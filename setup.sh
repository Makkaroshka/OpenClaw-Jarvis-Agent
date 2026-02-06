#!/bin/bash

# Colors for UI
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${CYAN}======================================================${NC}"
echo -e "${CYAN}   MAKAROSHKA'S JARVIS EXTENSION INSTALLER (v1.0)   ${NC}"
echo -e "${CYAN}======================================================${NC}"

# 1. System Check & Dependencies
echo -e "${GREEN}[1/5] Checking system requirements...${NC}"
sudo apt update
sudo apt install -y git curl unzip

if ! command -v node &> /dev/null; then
    echo "Node.js not found. Installing..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs
else
    echo "Node.js is already installed."
fi

# Install pnpm (OpenClaw preferred manager)
if ! command -v pnpm &> /dev/null; then
    echo "Installing pnpm..."
    sudo npm install -g pnpm
fi

# 2. Cloning OpenClaw Core
TARGET_DIR="$HOME/openclaw_jarvis"
echo -e "${GREEN}[2/5] Downloading OpenClaw Core to $TARGET_DIR...${NC}"

if [ -d "$TARGET_DIR" ]; then
    echo "Target directory already exists. Skipping clone."
else
    # Clone official repo
    git clone https://github.com/openclaw/openclaw.git "$TARGET_DIR"
fi

cd "$TARGET_DIR"
echo "Installing project dependencies (this may take a minute)..."
pnpm install

# 3. Setting up Windows Bridge
echo -e "${GREEN}[3/5] Deploying Windows Bridge...${NC}"

# Path in Windows (via WSL mount)
WIN_PATH="/mnt/c/JarvisBridge"

if [ ! -d "$WIN_PATH" ]; then
    echo "Creating directory C:\JarvisBridge..."
    mkdir -p "$WIN_PATH"
fi

# We are currently in TARGET_DIR, need to go back to installer dir to get scripts
INSTALLER_DIR=$OLDPWD 

if [ -d "$INSTALLER_DIR/windows_scripts" ]; then
    echo "Copying Bridge scripts to Windows host..."
    cp "$INSTALLER_DIR/windows_scripts/"* "$WIN_PATH/"
else
    echo -e "${RED}ERROR: 'windows_scripts' folder not found in the installer directory!${NC}"
fi

# 4. Injecting Identity & Configs
echo -e "${GREEN}[4/5] Injecting Jarvis Identity & Protocols...${NC}"

# Path for the agent's identity file
AGENT_PATH="$TARGET_DIR/agents/main/agent"
mkdir -p "$AGENT_PATH"

if [ -f "$INSTALLER_DIR/config_templates/IDENTITY.md" ]; then
    cp "$INSTALLER_DIR/config_templates/IDENTITY.md" "$AGENT_PATH/IDENTITY.md"
    echo "Custom Identity installed."
else
    echo -e "${RED}WARNING: Custom IDENTITY.md not found.${NC}"
fi

# Create .env from example if it doesn't exist
if [ ! -f "$TARGET_DIR/.env" ]; then
    echo "Creating .env file..."
    cp .env.example "$TARGET_DIR/.env" 2>/dev/null || touch "$TARGET_DIR/.env"
    echo -e "${CYAN}NOTE: Please update $TARGET_DIR/.env with your API keys later.${NC}"
fi

# 5. Finalize
echo -e "${CYAN}======================================================${NC}"
echo -e "${GREEN}Installation Complete!${NC}"
echo -e "Next steps:"
echo -e "1. Edit configuration: ${CYAN}nano $TARGET_DIR/.env${NC}"
echo -e "2. Go to directory: ${CYAN}cd $TARGET_DIR${NC}"
echo -e "3. Wake up Jarvis: ${CYAN}pnpm start${NC}"
echo -e "${CYAN}======================================================${NC}"
