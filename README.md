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
---

<a name="russian-version"></a>
## 🇷🇺 Русская версия (Russian Version)

**Превратите вашего ИИ-агента в полноценного оператора Windows.**

> **⚠️ Дисклеймер:** Этот проект является **надстройкой (wrapper)** и модулем развертывания для проекта [OpenClaw](https://github.com/openclaw/openclaw). Ядро ИИ и основная логика разработаны командой OpenClaw. Данный репозиторий предоставляет инфраструктуру (PowerShell Bridge, скрипты установки, протоколы безопасности) для работы агента на **Windows через WSL2**.

### 🌟 Зачем это нужно?
Оригинальный OpenClaw — мощный агент, но при запуске на Windows через WSL он заперт в «песочнице». Он не может получить доступ к вашим файлам, браузеру или настройкам системы. 

**Это расширение строит «Мост» между подсистемой Linux и вашей ОС Windows.**

### ✨ Ключевые особенности
* **🪟 Windows Bridge System:** Кастомный шлюз на PowerShell, позволяющий агенту выполнять команды в основной системе прямо из WSL.
* **⚡ Установка в один клик:** Скрипт `setup.sh` автоматически ставит Node.js, PNPM, зависимости WSL и ядро OpenClaw.
* **🛡️ Безопасность:** Настроенный файл `IDENTITY.md` с протоколами защиты от инъекций промптов.
* **🤖 Готовность к SMM:** Скрипты для автоматического постинга (например, в Moltbook) напрямую из Windows.

### 🚀 Установка

**Требования:** Windows 10/11 с установленным WSL2 (Ubuntu).

Введите эти команды в терминале Ubuntu:

```bash
# Клонируем репозиторий расширения
git clone [https://github.com/Makkaroshka/OpenClaw-Jarvis-Extension.git](https://github.com/Makkaroshka/OpenClaw-Jarvis-Extension.git)

# Заходим в папку
cd OpenClaw-Jarvis-Extension

# Запускаем магический установщик
chmod +x setup.sh
./setup.sh
