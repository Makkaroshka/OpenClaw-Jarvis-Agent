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
    git clone https://github.com/openclaw/openclaw.git "$TARGET_DIR"
fi

cd "$TARGET_DIR"
echo "Installing project dependencies..."
pnpm install

# 3. Setting up Windows Bridge
echo -e "${GREEN}[3/5] Deploying Windows Bridge...${NC}"
WIN_PATH="/mnt/c/JarvisBridge"
mkdir -p "$WIN_PATH"

INSTALLER_DIR=$OLDPWD 

if [ -d "$INSTALLER_DIR/windows_scripts" ]; then
    cp "$INSTALLER_DIR/windows_scripts/"* "$WIN_PATH/"
    echo "Bridge scripts copied to C:\JarvisBridge"
else
    echo -e "${RED}ERROR: 'windows_scripts' folder not found!${NC}"
fi

# 4. Injecting Identity & Configs (UPDATED PATH)
echo -e "${GREEN}[4/5] Injecting Jarvis Identity into Templates...${NC}"

# Путь к шаблонам в новом OpenClaw
TEMPLATE_PATH="$TARGET_DIR/docs/reference/templates"

if [ -f "$INSTALLER_DIR/config_templates/IDENTITY.md" ]; then
    # Перезаписываем стандартный шаблон
    cp -f "$INSTALLER_DIR/config_templates/IDENTITY.md" "$TEMPLATE_PATH/IDENTITY.md"
    echo "Custom IDENTITY.md injected into $TEMPLATE_PATH"
else
    echo -e "${RED}WARNING: Custom IDENTITY.md not found in config_templates folder.${NC}"
fi

if [ ! -f "$TARGET_DIR/.env" ]; then
    cp .env.example "$TARGET_DIR/.env" 2>/dev/null || touch "$TARGET_DIR/.env"
fi

# 5. Finalize
echo -e "${CYAN}======================================================${NC}"
echo -e "${GREEN}Installation Complete!${NC}"
echo -e "Next steps:"
echo -e "1. Edit configuration: ${CYAN}nano $TARGET_DIR/.env${NC}"
echo -e "2. Go to directory: ${CYAN}cd $TARGET_DIR${NC}"
echo -e "3. Wake up Jarvis: ${CYAN}pnpm start${NC}"
echo -e "${CYAN}======================================================${NC}"
