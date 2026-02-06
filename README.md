<div align="center">

# 🦞 Makaroshka's Jarvis Extension
### OpenClaw Windows Bridge & Auto-Installer

**[ 🇬🇧 English Version ](#-makaroshkas-jarvis-extension-openclaw-for-windows)** | **[ 🇷🇺 Русская версия ](#-jarvis-extension-от-makaroshka-openclaw-для-windows)**

---
</div>

<a name="-makaroshkas-jarvis-extension-openclaw-for-windows"></a>
## 🇬🇧 Makaroshka's Jarvis Extension (OpenClaw for Windows)

**Turn your AI Agent into a fully autonomous Windows Operator.**

> **⚠️ Disclaimer:** This project is a **deployment wrapper and extension module** for the amazing [OpenClaw](https://github.com/openclaw/openclaw) project. All core AI logic belongs to the OpenClaw team. This repository provides the necessary infrastructure (PowerShell Bridge, Installation Scripts, Security Protocols) to make OpenClaw viable on **Windows via WSL2**.

### 🌟 Why this exists?
The original OpenClaw is a powerful terminal-based agent. However, running it on Windows inside WSL creates a "sandbox" effect where the AI cannot access your actual files, browser, or system settings.

**This extension solves that problem by building a "Bridge" between the Linux subsystem and your Windows Host.**

### ✨ Key Features added to OpenClaw
* **🪟 Windows Bridge System:** A custom PowerShell gateway allowing the agent to execute commands on the host machine from within WSL.
* **⚡ Zero-Config Installer:** Automated script (`setup.sh`) that installs Node.js, PNPM, WSL dependencies, and the OpenClaw core in one go.
* **🛡️ Security Injection:** Pre-configured `IDENTITY.md` with anti-prompt-injection protocols and strict command boundaries.
* **🤖 SMM Automation:** Ready-to-use scripts for social media posting (Moltbook/Real platforms) directly from Windows.

### 🚀 Installation (The Easy Way)

**Prerequisites:** Windows 10/11 with WSL2 (Ubuntu) installed.

1.  Open your Ubuntu terminal.
2.  Run the following commands:

```bash
# Clone this extension repository
git clone [https://github.com/Makkaroshka/OpenClaw-Jarvis-Extension.git](https://github.com/Makkaroshka/OpenClaw-Jarvis-Extension.git)

# Enter the directory
cd OpenClaw-Jarvis-Extension

# Run the magic installer
chmod +x setup.sh
./setup.sh

<a name="russian-version"></a>
🇷🇺 Jarvis Extension от Makkaroshka (OpenClaw для Windows)

Превращает вашего ИИ-агента в полноценного оператора Windows.

    ⚠️ Важно: Этот проект является надстройкой (wrapper) и модулем развертывания для проекта OpenClaw. Ядро ИИ и основная логика разработаны командой OpenClaw. Этот репозиторий предоставляет инфраструктуру (PowerShell-мост, скрипты установки, протоколы безопасности) для полноценной работы агента на Windows через WSL2.

🌟 Зачем это нужно?

Оригинальный OpenClaw — мощный агент, но при запуске на Windows (через WSL) он оказывается заперт в "песочнице" Linux. Он может думать, но не может открыть файл на рабочем столе, запустить браузер или управлять системой.

Это расширение строит "Мост" между подсистемой Linux и вашей основной Windows, давая агенту руки.
✨ Что добавляет этот мод?

    🪟 Windows Bridge: Система на базе PowerShell, позволяющая агенту выполнять команды в Windows прямо из терминала Linux.

    ⚡ Авто-Установщик: Скрипт setup.sh, который одной командой ставит всё: Node.js, PNPM, зависимости и само ядро OpenClaw. Вам не нужно мучиться с настройкой среды.

    🛡️ Защита Личности: Внедренный IDENTITY.md с защитой от "взлома промпта" (Prompt Injection) и четкими правилами безопасности.

    🤖 SMM Автоматизация: Готовые скрипты для постинга в соцсети (Moltbook и др.) напрямую через Windows.

🚀 Установка (За 1 минуту)

Требования: Windows 10/11 с установленным WSL2 (Ubuntu).

    Откройте терминал Ubuntu.

    Введите следующие команды:

Bash

# Скачиваем репозиторий расширения
git clone [https://github.com/Makkaroshka/OpenClaw-Jarvis-Extension.git](https://github.com/Makkaroshka/OpenClaw-Jarvis-Extension.git)

# Заходим в папку
cd OpenClaw-Jarvis-Extension

# Запускаем установщик
chmod +x setup.sh
./setup.sh

⚙️ Как запустить

После установки перейдите в созданную папку:
Bash

cd ~/openclaw_jarvis
# Отредактируйте .env, добавив свои ключи
nano .env 
# Запустите Джарвиса
pnpm start
