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
git clone https://github.com/Makkaroshka/OpenClaw-Jarvis-Extension.git

# Enter the directory
cd OpenClaw-Jarvis-Extension

# Run the magic installer
chmod +x setup.sh
./setup.sh

### ⚙️ How to Start

**After installation, go to the created folder and start your agent:**

cd ~/openclaw_jarvis
# Edit .env to add your API Keys (Telegram, OpenAI/Anthropic)
nano .env 
# Start the agent
pnpm start
🏆 Credits

    Core & Logic: OpenClaw Team.

    Windows Bridge & Installer: Makkaroshka
