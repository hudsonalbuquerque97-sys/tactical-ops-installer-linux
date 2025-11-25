#!/bin/bash
# Tactical Ops: Assault on Terror - Linux Installer
# multilingual Installer (PT-BR/EN/DE/ES/FR/IT/RU)
# Created by: HUDSON ALBUQUERQUE hudsonalbuquerque97-sys

#==============================================
# CORES / COLORS
#==============================================
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#==============================================
# VARIÁVEIS / VARIABLES
#==============================================
GAME_DIR="$HOME/Games"
TMP_DIR="/tmp/tactical-ops-installer-$"
ICON_URL="https://icons.iconarchive.com/icons/3xhumed/mega-games-pack-39/256/Tactical-Ops-Assault-on-Terror-1-icon.png"

TO_V469_7Z="TO-Fixed-Pack-v469e.7z"
TO_LINUX_ZIP="TOFP469d-LinuxFiles.zip"

URL_TOV469="https://mirror.tactical-ops.eu/client-patches/custom-clients/TO-Fixed-Pack-v469e.7z"
URL_TO_LINUX="https://mirror.tactical-ops.eu/client-patches/custom-clients/fixed-pack-addons/TOFP469d-LinuxFiles.zip"

LANG=""
DIALOG_TOOL=""

#==============================================
# TRADUÇÕES / TRANSLATIONS
#==============================================
declare -A TEXTS_PT=(
    ["title"]="Instalador Tactical Ops: Assault on Terror"
    ["welcome"]="Bem-vindo ao Instalador do Tactical Ops!\n\nEste script irá:\n\n• Baixar o Tactical Ops v469e da Internet\n• Instalar em $HOME/Games/TacticalOps/\n• Criar atalhos no menu para v3.4 e v3.5\n• Baixar ícone de alta qualidade\n\nDeseja continuar com a instalação?"
    ["checking_deps"]="Verificando dependências..."
    ["installing"]="Instalando"
    ["deps_ok"]="Dependências instaladas com sucesso!"
    ["downloading"]="Baixando"
    ["extracting"]="Extraindo arquivos..."
    ["copying"]="Copiando arquivos do Linux v340..."
    ["copying_350"]="Copiando arquivos do Linux v350..."
    ["creating_shortcuts"]="Criando atalhos no menu..."
    ["downloading_icon"]="Baixando ícone de alta resolução..."
    ["success"]="Instalação Concluída!"
    ["success_msg"]="O Tactical Ops foi instalado com sucesso!\n\nLocalização: $HOME/Games/TacticalOps/\n\nAtalhos criados:\n• Tactical Ops 3.4\n• Tactical Ops 3.5\n\nVocê pode iniciar o jogo pelo menu de aplicativos."
    ["error"]="Erro"
    ["cancelled"]="Instalação cancelada pelo usuário."
    ["install_error"]="Erro durante a instalação. Verifique os logs."
)

declare -A TEXTS_EN=(
    ["title"]="Tactical Ops: Assault on Terror Installer"
    ["welcome"]="Welcome to Tactical Ops Installer!\n\nThis script will:\n\n• Download Tactical Ops v469e from Internet\n• Install to $HOME/Games/TacticalOps/\n• Create menu shortcuts for v3.4 and v3.5\n• Download high quality icon\n\nDo you want to continue with installation?"
    ["checking_deps"]="Checking dependencies..."
    ["installing"]="Installing"
    ["deps_ok"]="Dependencies installed successfully!"
    ["downloading"]="Downloading"
    ["extracting"]="Extracting files..."
    ["copying"]="Copying Linux files v340..."
    ["copying_350"]="Copying Linux files v350..."
    ["creating_shortcuts"]="Creating menu shortcuts..."
    ["downloading_icon"]="Downloading high resolution icon..."
    ["success"]="Installation Complete!"
    ["success_msg"]="Tactical Ops has been installed successfully!\n\nLocation: $HOME/Games/TacticalOps/\n\nShortcuts created:\n• Tactical Ops 3.4\n• Tactical Ops 3.5\n\nYou can launch the game from your applications menu."
    ["error"]="Error"
    ["cancelled"]="Installation cancelled by user."
    ["install_error"]="Error during installation. Check logs."
)

declare -A TEXTS_DE=(
    ["title"]="Installer Tactical Ops: Assault on Terror"
    ["welcome"]="Willkommen zum Tactical Ops Installer!\n\nDieses Skript wird:\n\n• Tactical Ops v469e aus dem Internet herunterladen\n• In $HOME/Games/TacticalOps/ installieren\n• Menü-Verknüpfungen für v3.4 und v3.5 erstellen\n• Ein hochauflösendes Icon herunterladen\n\nMöchten Sie mit der Installation fortfahren?"
    ["checking_deps"]="Überprüfe Abhängigkeiten..."
    ["installing"]="Installiere"
    ["deps_ok"]="Abhängigkeiten erfolgreich installiert!"
    ["downloading"]="Herunterladen"
    ["extracting"]="Entpacke Dateien..."
    ["copying"]="Kopiere Linux v340 Dateien..."
    ["copying_350"]="Kopiere Linux v350 Dateien..."
    ["creating_shortcuts"]="Erstelle Menü-Verknüpfungen..."
    ["downloading_icon"]="Lade hochauflösendes Icon herunter..."
    ["success"]="Installation abgeschlossen!"
    ["success_msg"]="Tactical Ops wurde erfolgreich installiert!\n\nOrt: $HOME/Games/TacticalOps/\n\nErstellte Verknüpfungen:\n• Tactical Ops 3.4\n• Tactical Ops 3.5\n\nSie können das Spiel über das Anwendungsmenü starten."
    ["error"]="Fehler"
    ["cancelled"]="Installation vom Benutzer abgebrochen."
    ["install_error"]="Fehler während der Installation. Überprüfen Sie die Logs."
)

declare -A TEXTS_ES=(
    ["title"]="Instalador Tactical Ops: Assault on Terror"
    ["welcome"]="¡Bienvenido al Instalador de Tactical Ops!\n\nEste script hará:\n\n• Descargar Tactical Ops v469e de Internet\n• Instalar en $HOME/Games/TacticalOps/\n• Crear accesos directos en el menú para v3.4 y v3.5\n• Descargar un ícono de alta resolución\n\n¿Desea continuar con la instalación?"
    ["checking_deps"]="Verificando dependencias..."
    ["installing"]="Instalando"
    ["deps_ok"]="¡Dependencias instaladas con éxito!"
    ["downloading"]="Descargando"
    ["extracting"]="Extrayendo archivos..."
    ["copying"]="Copiando archivos de Linux v340..."
    ["copying_350"]="Copiando archivos de Linux v350..."
    ["creating_shortcuts"]="Creando accesos directos en el menú..."
    ["downloading_icon"]="Descargando ícono de alta resolución..."
    ["success"]="¡Instalación completa!"
    ["success_msg"]="¡Tactical Ops se instaló correctamente!\n\nUbicación: $HOME/Games/TacticalOps/\n\nAccesos directos creados:\n• Tactical Ops 3.4\n• Tactical Ops 3.5\n\nPuede iniciar el juego desde el menú de aplicaciones."
    ["error"]="Error"
    ["cancelled"]="Instalación cancelada por el usuario."
    ["install_error"]="Error durante la instalación. Verifique los registros."
)

declare -A TEXTS_FR=(
    ["title"]="Installateur Tactical Ops: Assault on Terror"
    ["welcome"]="Bienvenue dans l’installateur de Tactical Ops !\n\nCe script va :\n\n• Télécharger Tactical Ops v469e depuis Internet\n• L’installer dans $HOME/Games/TacticalOps/\n• Créer des raccourcis dans le menu pour les versions v3.4 et v3.5\n• Télécharger une icône haute résolution\n\nSouhaitez-vous continuer l’installation ?"
    ["checking_deps"]="Vérification des dépendances..."
    ["installing"]="Installation"
    ["deps_ok"]="Dépendances installées avec succès !"
    ["downloading"]="Téléchargement"
    ["extracting"]="Extraction des fichiers..."
    ["copying"]="Copie des fichiers Linux v340..."
    ["copying_350"]="Copie des fichiers Linux v350..."
    ["creating_shortcuts"]="Création des raccourcis dans le menu..."
    ["downloading_icon"]="Téléchargement de l’icône haute résolution..."
    ["success"]="Installation terminée !"
    ["success_msg"]="Tactical Ops a été installé avec succès !\n\nEmplacement : $HOME/Games/TacticalOps/\n\nRaccourcis créés :\n• Tactical Ops 3.4\n• Tactical Ops 3.5\n\nVous pouvez lancer le jeu depuis le menu des applications."
    ["error"]="Erreur"
    ["cancelled"]="Installation annulée par l’utilisateur."
    ["install_error"]="Erreur lors de l’installation. Vérifiez les journaux."
)

declare -A TEXTS_IT=(
    ["title"]="Installatore Tactical Ops: Assault on Terror"
    ["welcome"]="Benvenuto nell'Installatore di Tactical Ops!\n\nQuesto script farà:\n\n• Scaricare Tactical Ops v469e da Internet\n• Installarlo in $HOME/Games/TacticalOps/\n• Creare collegamenti nel menu per v3.4 e v3.5\n• Scaricare un'icona ad alta risoluzione\n\nVuoi continuare con l'installazione?"
    ["checking_deps"]="Verifica delle dipendenze..."
    ["installing"]="Installazione"
    ["deps_ok"]="Dipendenze installate con successo!"
    ["downloading"]="Download"
    ["extracting"]="Estrazione dei file..."
    ["copying"]="Copia dei file Linux v340..."
    ["copying_350"]="Copia dei file Linux v350..."
    ["creating_shortcuts"]="Creazione dei collegamenti nel menu..."
    ["downloading_icon"]="Download dell'icona ad alta risoluzione..."
    ["success"]="Installazione completata!"
    ["success_msg"]="Tactical Ops è stato installato con successo!\n\nPercorso: $HOME/Games/TacticalOps/\n\nCollegamenti creati:\n• Tactical Ops 3.4\n• Tactical Ops 3.5\n\nPuoi avviare il gioco dal menu delle applicazioni."
    ["error"]="Errore"
    ["cancelled"]="Installazione annullata dall'utente."
    ["install_error"]="Errore durante l'installazione. Controlla i log."
)

 declare -A TEXTS_RU=(
    ["title"]="Установщик Tactical Ops: Assault on Terror"
    ["welcome"]="Добро пожаловать в установщик Tactical Ops!\n\nЭтот скрипт выполнит:\n\n• Загрузка Tactical Ops v469e из Интернета\n• Установка в $HOME/Games/TacticalOps/\n• Создание пунктов меню для версий v3.4 и v3.5\n• Загрузка иконки в высоком разрешении\n\nПродолжить установку?"
    ["checking_deps"]="Проверка зависимостей..."
    ["installing"]="Установка"
    ["deps_ok"]="Зависимости успешно установлены!"
    ["downloading"]="Загрузка"
    ["extracting"]="Распаковка файлов..."
    ["copying"]="Копирование файлов Linux v340..."
    ["copying_350"]="Копирование файлов Linux v350..."
    ["creating_shortcuts"]="Создание ярлыков в меню..."
    ["downloading_icon"]="Загрузка иконки высокого разрешения..."
    ["success"]="Установка завершена!"
    ["success_msg"]="Tactical Ops успешно установлен!\n\nПапка: $HOME/Games/TacticalOps/\n\nСозданные ярлыки:\n• Tactical Ops 3.4\n• Tactical Ops 3.5\n\nВы можете запустить игру через меню приложений."
    ["error"]="Ошибка"
    ["cancelled"]="Установка отменена пользователем."
    ["install_error"]="Ошибка во время установки. Проверьте логи."
)

#==============================================
# FUNÇÕES / FUNCTIONS
#==============================================

function ctrl_c(){
    echo -e "\n\n${redColour}[!] ${TEXTS[$error]}${endColour}\n"
    cleanup
    exit 1
}

trap ctrl_c SIGINT

function cleanup(){
    if [ -d "$TMP_DIR" ]; then
        rm -rf "$TMP_DIR"
    fi
}

function detect_dialog(){
    if which whiptail >/dev/null 2>&1; then
        DIALOG_TOOL="whiptail"
    elif which dialog >/dev/null 2>&1; then
        DIALOG_TOOL="dialog"
    else
        echo -e "${yellowColour}[!] Installing whiptail...${endColour}"
        sudo apt-get update && sudo apt-get install whiptail -y
        DIALOG_TOOL="whiptail"
    fi
}

function show_msgbox(){
    local title="$1"
    local message="$2"
    
    # Limpeza completa para whiptail
    local clean_title=$(echo "$title" | sed -r 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g')
    local clean_message=$(echo "$message" | sed -r 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g')
    
    # Quebra de linha automática
    local clean_message=$(echo "$clean_message" | fold -s -w 70)
    
    if [ "$DIALOG_TOOL" = "whiptail" ]; then
        whiptail --title "$clean_title" --msgbox "$clean_message" 14 80
    else
        dialog --title "$clean_title" --msgbox "$clean_message" 14 80
    fi
}

function show_yesno(){
    local title="$1"
    local message="$2"
    
    local clean_title=$(echo "$title" | sed -r 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g')
    local clean_message=$(echo "$message" | sed -r 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g')
    
    local clean_message=$(echo "$clean_message" | fold -s -w 70)
    
    if [ "$DIALOG_TOOL" = "whiptail" ]; then
        whiptail --title "$clean_title" --yesno "$clean_message" 14 80
    else
        dialog --title "$clean_title" --yesno "$clean_message" 14 80
    fi
    
    return $?
}

function show_gauge(){
    local title="$1"
    local message="$2"
    
    local clean_title=$(echo "$title" | sed -r 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g')
    local clean_message=$(echo "$message" | sed -r 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g')
    
    if [ "$DIALOG_TOOL" = "whiptail" ]; then
        whiptail --title "$clean_title" --gauge "$clean_message" 10 80 0
    else
        dialog --title "$clean_title" --gauge "$clean_message" 10 80 0
    fi
}

function detect_language(){
    local sys_lang="${LANG:-${LANGUAGE:-en_US}}"
    
    # Detecção completa de todos os idiomas
    if [[ "$sys_lang" =~ ^pt_BR ]] || [[ "$sys_lang" =~ ^pt ]]; then
        LANG="PT"
    elif [[ "$sys_lang" =~ ^de_DE ]] || [[ "$sys_lang" =~ ^de ]]; then
        LANG="DE"
    elif [[ "$sys_lang" =~ ^es_ES ]] || [[ "$sys_lang" =~ ^es ]]; then
        LANG="ES"
    elif [[ "$sys_lang" =~ ^fr_FR ]] || [[ "$sys_lang" =~ ^fr ]]; then
        LANG="FR"
    elif [[ "$sys_lang" =~ ^it_IT ]] || [[ "$sys_lang" =~ ^it ]]; then
        LANG="IT"
    elif [[ "$sys_lang" =~ ^ru_RU ]] || [[ "$sys_lang" =~ ^ru ]]; then
        LANG="RU"
    else
        LANG="EN"  # Padrão para inglês
    fi
    
    # Carrega textos do idioma detectado
    declare -gA TEXTS
    case "$LANG" in
        "PT")
            for key in "${!TEXTS_PT[@]}"; do TEXTS[$key]="${TEXTS_PT[$key]}"; done
            ;;
        "DE")
            for key in "${!TEXTS_DE[@]}"; do TEXTS[$key]="${TEXTS_DE[$key]}"; done
            ;;
        "ES")
            for key in "${!TEXTS_ES[@]}"; do TEXTS[$key]="${TEXTS_ES[$key]}"; done
            ;;
        "FR")
            for key in "${!TEXTS_FR[@]}"; do TEXTS[$key]="${TEXTS_FR[$key]}"; done
            ;;
        "IT")
            for key in "${!TEXTS_IT[@]}"; do TEXTS[$key]="${TEXTS_IT[$key]}"; done
            ;;
        "RU")
            for key in "${!TEXTS_RU[@]}"; do TEXTS[$key]="${TEXTS_RU[$key]}"; done
            ;;
        *)
            for key in "${!TEXTS_EN[@]}"; do TEXTS[$key]="${TEXTS_EN[$key]}"; done
            ;;
    esac
}

function check_dependencies(){
    echo -e "\n${blueColour}[!] ${TEXTS[checking_deps]}${endColour}\n"
    
    local deps=("wget" "unzip" "p7zip-full")
    
    for dep in "${deps[@]}"; do
        local pkg_name="$dep"
        local cmd_name="$dep"
        
        if [ "$dep" = "p7zip-full" ]; then
            cmd_name="7z"
        fi
        
        if ! which "$cmd_name" >/dev/null 2>&1; then
            echo -e "${greenColour}[+] ${TEXTS[installing]} $dep...${endColour}"
            sudo apt-get update >/dev/null 2>&1
            sudo apt-get install "$pkg_name" -y
        fi
    done
    
    echo -e "${greenColour}[+] ${TEXTS[deps_ok]}${endColour}\n"
}

function download_files(){
    echo -e "${greenColour}[+] ${TEXTS[downloading]} Tactical Ops Fixed Pack v469e...${endColour}"
    
    mkdir -p "$TMP_DIR"
    
    # Download com barra de progresso normal do terminal
    if [ ! -f "$TMP_DIR/$TO_V469_7Z" ]; then
        wget -c --no-check-certificate --progress=bar:force "$URL_TOV469" -O "$TMP_DIR/$TO_V469_7Z"
        if [ $? -ne 0 ]; then
            echo -e "${redColour}[!] ${TEXTS[error]} ao baixar TO Fixed Pack${endColour}"
            return 1
        fi
        echo -e "${greenColour}[✓] Download concluído!${endColour}\n"
    else
        echo -e "${yellowColour}[!] Arquivo já existe, pulando download...${endColour}\n"
    fi
    
    echo -e "${greenColour}[+] ${TEXTS[downloading]} Linux Files...${endColour}"
    
    if [ ! -f "$TMP_DIR/$TO_LINUX_ZIP" ]; then
        wget -c --no-check-certificate --progress=bar:force "$URL_TO_LINUX" -O "$TMP_DIR/$TO_LINUX_ZIP"
        if [ $? -ne 0 ]; then
            echo -e "${redColour}[!] ${TEXTS[error]} ao baixar Linux Files${endColour}"
            return 1
        fi
        echo -e "${greenColour}[✓] Download concluído!${endColour}\n"
    else
        echo -e "${yellowColour}[!] Arquivo já existe, pulando download...${endColour}\n"
    fi
}

function check_and_create_game_dir(){
    # Verifica se a pasta ~/Games existe, se não, cria
    if [ ! -d "$GAME_DIR" ]; then
        echo -e "${yellowColour}[!] Criando diretório $GAME_DIR...${endColour}\n"
        mkdir -p "$GAME_DIR"
        echo -e "${greenColour}[+] Diretório criado com sucesso!${endColour}\n"
    fi
}

function extract_and_install(){
    echo -e "${blueColour}[!] ${TEXTS[extracting]}${endColour}\n"
    
    check_and_create_game_dir
    cd "$GAME_DIR"
    
    if [ -f "$TMP_DIR/$TO_V469_7Z" ]; then
        7z x "$TMP_DIR/$TO_V469_7Z" -y >/dev/null 2>&1
    else
        echo -e "${redColour}[!] ${TEXTS[error]}: $TO_V469_7Z${endColour}"
        return 1
    fi
    
    cd "$TMP_DIR"
    
    if [ -f "$TMP_DIR/$TO_LINUX_ZIP" ]; then
        unzip -q "$TMP_DIR/$TO_LINUX_ZIP"
    else
        echo -e "${redColour}[!] ${TEXTS[error]}: $TO_LINUX_ZIP${endColour}"
        return 1
    fi
}

function copy_linux_files(){
    echo -e "${blueColour}[!] ${TEXTS[copying]}${endColour}\n"
    
    if [ -d "$TMP_DIR/TacticalOps/TO340/System" ]; then
        cp -r "$TMP_DIR"/TacticalOps/TO340/System/* "$GAME_DIR"/TacticalOps/TO340/System/
        chmod +x "$GAME_DIR"/TacticalOps/TO340/System/TacticalOps.sh
    fi
    
    echo -e "${blueColour}[!] ${TEXTS[copying_350]}${endColour}\n"
    
    if [ -d "$TMP_DIR/TacticalOps/TO350/System" ]; then
        cp -r "$TMP_DIR"/TacticalOps/TO350/System/* "$GAME_DIR"/TacticalOps/TO350/System/
        chmod +x "$GAME_DIR"/TacticalOps/TO350/System/TacticalOps.sh
    fi
}

function download_icon(){
    echo -e "${blueColour}[!] ${TEXTS[downloading_icon]}${endColour}\n"
    
    mkdir -p "$GAME_DIR/TacticalOps/Icons"
    
    wget -q "$ICON_URL" -O "$GAME_DIR/TacticalOps/Icons/TacticalOps.png"
}

function create_desktop_entries(){
    echo -e "${blueColour}[!] ${TEXTS[creating_shortcuts]}${endColour}\n"
    
    mkdir -p "$HOME/.local/share/applications"
    
    # Atalho v3.4
    cat > "$HOME/.local/share/applications/tactical-ops-3.4.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Tactical Ops 3.4
Comment=Tactical Ops: Assault on Terror v3.4
Icon=$GAME_DIR/TacticalOps/Icons/TacticalOps.png
Exec=$GAME_DIR/TacticalOps/TO340/System/TacticalOps.sh
Path=$GAME_DIR/TacticalOps/TO340/System
Terminal=false
Categories=Game;ActionGame;
Keywords=game;fps;shooter;tactical;
EOF
    
    # Atalho v3.5
    cat > "$HOME/.local/share/applications/tactical-ops-3.5.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Tactical Ops 3.5
Comment=Tactical Ops: Assault on Terror v3.5
Icon=$GAME_DIR/TacticalOps/Icons/TacticalOps.png
Exec=$GAME_DIR/TacticalOps/TO350/System/TacticalOps.sh
Path=$GAME_DIR/TacticalOps/TO350/System
Terminal=false
Categories=Game;ActionGame;
Keywords=game;fps;shooter;tactical;
EOF
    
    chmod +x "$HOME/.local/share/applications/tactical-ops-3.4.desktop"
    chmod +x "$HOME/.local/share/applications/tactical-ops-3.5.desktop"
    
    # Atualizar cache do menu
    if which update-desktop-database >/dev/null 2>&1; then
        update-desktop-database "$HOME/.local/share/applications"
    fi
}

#==============================================
# MAIN
#==============================================

detect_dialog
detect_language

# Usa whiptail apenas para a confirmação inicial
if ! show_yesno "${TEXTS[title]}" "${TEXTS[welcome]}"; then
    show_msgbox "${TEXTS[title]}" "${TEXTS[cancelled]}"
    exit 0
fi

# O resto é no terminal normal com cores
echo -e "\n${blueColour}╔═══════════════════════════════════════════════════╗${endColour}"
echo -e "${blueColour}║           INICIANDO INSTALAÇÃO              ║${endColour}"
echo -e "${blueColour}╚═══════════════════════════════════════════════════╝${endColour}\n"

check_dependencies
download_files
extract_and_install
copy_linux_files
download_icon
create_desktop_entries

# Limpeza
cleanup

echo -e "\n${greenColour}╔═══════════════════════════════════════════════════╗${endColour}"
echo -e "${greenColour}║           ${TEXTS[success]}           ║${endColour}"
echo -e "${greenColour}╚═══════════════════════════════════════════════════╝${endColour}\n"

echo -e "${greenColour}${TEXTS[success_msg]}${endColour}\n"

exit 0
