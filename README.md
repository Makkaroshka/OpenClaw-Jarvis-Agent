<div align="center">

# 🤖 Makaroshka's Jarvis Extension
### OpenClaw Windows Bridge & Auto-Installer

[ 🇬🇧 English Version ](#english-version) | [ 🇷🇺 Русская версия ](#russian-version)

---
</div>

<a name="english-version"></a>
## 🇬🇧 Makaroshka's Jarvis Extension (OpenClaw for Windows)

**Turn your AI Agent into a fully autonomous Windows Operator.**

> **⚠️ Disclaimer:** This project is a **deployment wrapper and extension module** for the amazing [OpenClaw](https://github.com/openclaw/openclaw) project. All core AI logic belongs to the OpenClaw team. This repository provides the necessary infrastructure (PowerShell Bridge, Installation Scripts, Security Protocols) to make OpenClaw viable on **Windows via WSL2**.

### 🌟 Why this exists?
The original OpenClaw is a powerful terminal-based agent. However, running it on Windows inside WSL creates a "sandbox" effect where the AI cannot access your actual files, browser, or system settings. 

**This extension builds a "Bridge" between the Linux subsystem and your Windows Host.**

### ✨ Key Features added to OpenClaw
* **🪟 Windows Bridge System:** A custom PowerShell gateway allowing the agent to execute commands on the host machine from within WSL.
* **⚡ Zero-Config Installer:** Automated script (`setup.sh`) that installs Node.js, PNPM, WSL dependencies, and the OpenClaw core in one go.
* **🛡️ Security Injection:** Pre-configured `IDENTITY.md` with anti-prompt-injection protocols and strict command boundaries.
* **🤖 SMM Automation:** Ready-to-use scripts for social media posting (Moltbook/Real platforms) directly from Windows.

### 🚀 Installation (The Easy Way)

**Prerequisites:** Windows 10/11 with WSL2 (Ubuntu) installed.

1. Open your Ubuntu terminal.
2. Run the following commands:

```bash
# Clone this extension repository
git clone https://github.com/Makkaroshka/OpenClaw-Jarvis-Agent.git

# Enter the directory
cd OpenClaw-Jarvis-Extension

# Run the magic installer
chmod +x setup.sh
./setup.sh
```

### ⚙️ How to Start

**After installation, go to the created folder and start your agent:**
```bash
cd ~/openclaw_jarvis

# Edit .env to add your API Keys (Telegram, OpenAI/Anthropic)
nano .env 
# Start the agent
pnpm start
```

🏆 Credits

Core & Logic: [OpenClaw Team](https://github.com/openclaw/openclaw).

Windows Bridge & Installer: [Makkaroshka](https://github.com/Makkaroshka)

---

<a name="russian-version"></a>
## 🇷🇺 Jarvis Extension от Makkaroshka (OpenClaw для Windows)

**Превращает вашего ИИ-агента в полноценного оператора Windows.**

> **⚠️ Дисклеймер:** Этот проект является **надстройкой (wrapper)** и модулем развертывания для проекта [OpenClaw](https://github.com/openclaw/openclaw). Ядро ИИ и основная логика разработаны командой OpenClaw. Этот репозиторий предоставляет инфраструктуру (PowerShell-мост, скрипты установки, протоколы безопасности) для полноценной работы агента на **Windows через WSL2**.

### 🌟 Зачем это нужно?
Оригинальный OpenClaw — мощный агент, но при запуске на Windows (через WSL) он оказывается заперт в «песочнице» Linux. Он не может получить доступ к вашим файлам, браузеру или настройкам системы.

**Это расширение строит «Мост» между подсистемой Linux и вашей основной Windows.**

### ✨ Ключевые особенности
* **🪟 Windows Bridge System:** Кастомный шлюз на PowerShell, позволяющий агенту выполнять команды в Windows прямо из WSL.
* **⚡ Авто-установщик:** Скрипт (`setup.sh`), который сам ставит Node.js, PNPM, зависимости и ядро OpenClaw за один раз.
* **🛡️ Защита личности:** Внедренный `IDENTITY.md` с защитой от взлома промптов и четкими правилами безопасности.
* **🤖 SMM Автоматизация:** Готовые скрипты для постинга в соцсети (Moltbook и др.) напрямую через Windows.

### 🚀 Установка (Простой способ)

**Требования:** Windows 10/11 с установленным WSL2 (Ubuntu).

1. Откройте терминал Ubuntu.
2. Выполните следующие команды:

```bash
# Скачиваем репозиторий расширения
git clone https://github.com/Makkaroshka/OpenClaw-Jarvis-Agent.git

# Заходим в папку
cd OpenClaw-Jarvis-Extension

# Запускаем магический установщик
chmod +x setup.sh
./setup.sh
```

⚙️ Как запустить

**После установки перейдите в созданную папку и запустите агента:**
```Bash

cd ~/openclaw_jarvis

# Отредактируйте .env, добавив свои ключи API
nano .env 
# Запуск агента
pnpm start
```

🏆 Авторы

Ядро и логика: [OpenClaw Team](https://github.com/openclaw/openclaw)

Windows Bridge и установщик: [Makkaroshka](https://github.com/Makkaroshka)
