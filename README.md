# 🎮 Tactical Ops: Assault on Terror - Linux Installer

<div align="center">

![Platform](https://img.shields.io/badge/Platform-Linux-blue?style=for-the-badge&logo=linux)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Languages](https://img.shields.io/badge/Languages-7%20Languages-orange?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-v469e-purple?style=for-the-badge)
![Game](https://img.shields.io/badge/Game-Tactical%20Ops%3A%20AoT-red?style=for-the-badge)
![Tested On](https://img.shields.io/badge/Tested%20On-Linux%20Mint%2022.1-success?style=for-the-badge)
![Auto Install](https://img.shields.io/badge/Auto%20Install-✓-green?style=for-the-badge)
![Multilingual](https://img.shields.io/badge/Multilingual-✓-yellow?style=for-the-badge)

**Tactical Ops: Assault on Terror - Linux Installer**
*Tactical Ops: Assault on Terror - Instalador Linux* 

[🇧🇷 Português](#português) | [🇺🇸 English](#english)

</div>

---

## Português

### 📋 Descrição

Instalador automático para Tactical Ops: Assault on Terror no Linux. Este script baixa e instala automaticamente o jogo completo com todas as dependências necessárias, criando atalhos no menu de aplicações.

### 🌟 Características

    ✅ Instalação automática do Tactical Ops v469e
    ✅ Suporte multilíngue (PT-BR/EN/DE/ES/FR/IT/RU)
    ✅ Dependências automáticas (wget, unzip, p7zip-full)
    ✅ Atalhos no menu para versões 3.4 e 3.5
    ✅ Ícone de alta qualidade incluído
    ✅ Interface amigável com caixas de diálogo

### 🛠️ Compatibilidade

    ✅ Linux Mint 22.1 (testado)
    ✅ Ubuntu 20.04+
    ✅ Debian 11+
    ✅ Outras distribuições baseadas em Debian

### 📦 Pré-requisitos
Dependências do sistema (instaladas automaticamente)
bash

#### Serão instaladas automaticamente pelo script:
wget unzip p7zip-full whiptail

### 🚀 Como usar

#### Instalação rápida (um comando):

```bash
wget https://raw.githubusercontent.com/hudsonalbuquerque97-sys/tactical-ops-installer-linux/main/TacticalOps-Install-Linux.sh && chmod +x TacticalOps-Install-Linux.sh && ./TacticalOps-Install-Linux.sh
```
**Ou alternativamente se prefere usar o curl:**

```bash
curl -fsSL https://raw.githubusercontent.com/hudsonalbuquerque97-sys/tactical-ops-installer-linux/main/TacticalOps-Install-Linux.sh -o /tmp/to-installer.sh && chmod +x /tmp/to-installer.sh && /tmp/to-installer.sh
```
#### Ou instalação manual:

1. **Baixe o script:**

```bash
wget https://raw.githubusercontent.com/hudsonalbuquerque97-sys/tactical-ops-installer-linux/main/TacticalOps-Install-Linux.sh
```
2. **Torne-o executável:**

```bash
chmod +x TacticalOps-Install-Linux.sh
```
3. **Execute o script:**

```bash
./TacticalOps-Install-Linux.sh
```

### 📂 O que o script faz

    ✅ Verifica dependências necessárias
    ✅ Detecta idioma do sistema automaticamente
    ✅ Baixa arquivos do jogo da Internet
    ✅ Extrai e instala o Tactical Ops v469e
    ✅ Copia arquivos Linux para ambas versões (3.4 e 3.5)
    ✅ Baixa ícone de alta resolução
    ✅ Cria atalhos no menu de aplicações
    ✅ Configura permissões de execução

### 🎮 Como jogar após instalação

**Opção 1 - Menu de Aplicativos:**

    Procure por "Tactical Ops 3.4" no menu Iniciar/Dash

    Procure por "Tactical Ops 3.5" no menu Iniciar/Dash

    Clique no ícone desejado

**Opção 2 - Terminal:**

```bash
cd ~/Games/TacticalOps/TO340/System && ./TacticalOps.sh
# ou
cd ~/Games/TacticalOps/TO350/System && ./TacticalOps.sh
```

### 📁 Estrutura de arquivos

```
~/Games/TacticalOps/           # Instalação principal
├── TO340/                     # Versão 3.4
│   └── System/
│       ├── TacticalOps.sh     # Launcher Linux
│       └── *.so              # Bibliotecas nativas
├── TO350/                     # Versão 3.5  
│   └── System/
│       ├── TacticalOps.sh     # Launcher Linux
│       └── *.so              # Bibliotecas nativas
└── Icons/
    └── TacticalOps.png        # Ícone HD

~/.local/share/applications/   # Atalhos do menu
├── tactical-ops-3.4.desktop
└── tactical-ops-3.5.desktop
```

### 🌐 Idiomas suportados

    Português (Brasil) - Detecção automática
    English (Inglês)
    Deutsch (Alemão)
    Español (Espanhol)
    Français (Francês)
    Italiano (Italiano)
    Русский (Russo)

### 🔧 Solução de problemas

**Problema: Script não executa**

```bash
chmod +x TacticalOps-Install-Linux.sh
```

**Problema: Falta de permissões**

Execute como usuário normal, não como root

```bash
./TacticalOps-Install-Linux.sh
```
**Problema: Dependências não instaladas automaticamente**

```bash
sudo apt update && sudo apt install wget unzip p7zip-full whiptail -y
```

## 📜 Licença

Este script é fornecido sob licença MIT. O jogo Tactical Ops: Assault on Terror é propriedade de seus respectivos detentores.

## 🔗 Links úteis

-  **Mirror Oficial:** https://mirror.tactical-ops.eu/
-  **Site da Comunidade:** https://www.tactical-ops.eu/
-  **Repositório GitHub:** https://github.com/hudsonalbuquerque97-sys/tactical-ops-installer

## 🤝 Contribuindo

Sinta-se à vontade para enviar issues ou pull requests para melhorar este instalador.

## ⭐ Créditos

-  **Comunidade Tactical Ops** – Pelo suporte contínuo ao jogo
-  **Desenvolvedores do TO** – Por criar este clássico
-  **Contribuidores do mirror** – Por disponibilizar os arquivos

---

## English

### 📋 Description

Automatic installer for Tactical Ops: Assault on Terror on Linux. This script automatically downloads and installs the complete game with all necessary dependencies, creating application menu shortcuts.

### 🌟 Features

    ✅ Automatic installation of Tactical Ops v469e
    ✅ Multilingual support (PT-BR/EN/DE/ES/FR/IT/RU)
    ✅ Automatic dependencies (wget, unzip, p7zip-full)
    ✅ Menu shortcuts for versions 3.4 and 3.5
    ✅ High quality icon included
    ✅ User-friendly interface with dialog boxes

### 🛠️ Compatibility

    ✅ Linux Mint 22.1 (tested)
    ✅ Ubuntu 20.04+
    ✅ Debian 11+
    ✅ Other Debian-based distributions

### 📦 Prerequisites

System dependencies (installed automatically)
bash

#### Will be automatically installed by the script:

wget unzip p7zip-full whiptail

### 🚀 How to use
#### Quick installation (one command):

```bash
wget https://raw.githubusercontent.com/hudsonalbuquerque97-sys/tactical-ops-installer-linux/main/TacticalOps-Install-Linux.sh && chmod +x TacticalOps-Install-Linux.sh && ./TacticalOps-Install-Linux.sh
```

**Or if you prefer to use curl:**

```bash
curl -fsSL https://raw.githubusercontent.com/hudsonalbuquerque97-sys/tactical-ops-installer-linux/main/TacticalOps-Install-Linux.sh -o /tmp/to-installer.sh && chmod +x /tmp/to-installer.sh && /tmp/to-installer.sh
```
#### Or manual installation:

1. **Download the script:**

```bash
wget https://raw.githubusercontent.com/hudsonalbuquerque97-sys/tactical-ops-installer-linux/main/TacticalOps-Install-Linux.sh
```

2. **Make it executable:**

```bash
chmod +x TacticalOps-Install-Linux.sh
```

3. **Run the script:**

```bash
./TacticalOps-Install-Linux.sh
```

### 📂 What the script does

    ✅ Checks required dependencies
    ✅ Detects system language automatically
    ✅ Downloads game files from the Internet
    ✅ Extracts and installs Tactical Ops v469e
    ✅ Copies Linux files for both versions (3.4 and 3.5)
    ✅ Downloads high-resolution icon
    ✅ Creates application menu shortcuts
    ✅ Sets execution permissions

### 🎮 How to play after installation

**Option 1 - Application Menu:**

    Search for "Tactical Ops 3.4" in your Start Menu/Dash

    Search for "Tactical Ops 3.5" in your Start Menu/Dash

    Click the desired icon

**Option 2 - Terminal:**

```bash
cd ~/Games/TacticalOps/TO340/System && ./TacticalOps.sh
# ou
cd ~/Games/TacticalOps/TO350/System && ./TacticalOps.sh
```

### 📁 File structure

```
~/Games/TacticalOps/           # Main installation
├── TO340/                     # Version 3.4
│   └── System/
│       ├── TacticalOps.sh     # Linux launcher
│       └── *.so              # Native libraries
├── TO350/                     # Version 3.5  
│   └── System/
│       ├── TacticalOps.sh     # Linux launcher
│       └── *.so              # Native libraries
└── Icons/
    └── TacticalOps.png        # HD icon

~/.local/share/applications/   # Menu shortcuts
├── tactical-ops-3.4.desktop
└── tactical-ops-3.5.desktop
```

### 🌐 Supported languages

    Portuguese (Brazil) - Automatic detection
    English
    German (Deutsch)
    Spanish (Español)
    French (Français)
    Italian (Italiano)
    Russian (Русский)

### 🔧 Troubleshooting

**Problem: Script won't run**

```bash
chmod +x TacticalOps-Install-Linux.sh
```

**Problem: Permission issues**

Run as normal user, not as root

```bash
./TacticalOps-Install-Linux.sh
```

**Problem: Dependencies not installed automatically**

```bash
sudo apt update && sudo apt install wget unzip p7zip-full whiptail -y
```

## 📜 License

This script is provided under MIT license. Tactical Ops: Assault on Terror game is property of its respective owners.

## 🔗 Useful links

- **Official Mirror:** https://mirror.tactical-ops.eu/
- **Community Site:** https://www.tactical-ops.eu/
- **GitHub Repository:** https://github.com/hudsonalbuquerque97-sys/tactical-ops-installer

## 🤝 Contributing

Feel free to submit issues or pull requests to improve this installer.

## ⭐ Credits

- **Tactical Ops Community** – For continuous game support
- **TO Developers** – For creating this classic
- **Mirror contributors** – For providing the files
---

**Made with ❤️ for the TacticalOps community**
