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

# Install Node.js if not present
if ! command -v node &> /dev/null; then
    echo "Node.js not found. Installing..."
    curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
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
echo "Installing project dependencies..."
pnpm install

# 3. Setting up Windows Bridge
echo -e "${GREEN}[3/5] Deploying Windows Bridge...${NC}"

# Path in Windows (via WSL mount)
WIN_PATH="/mnt/c/JarvisBridge"

if [ ! -d "$WIN_PATH" ]; then
    echo "Creating directory C:\JarvisBridge..."
    mkdir -p "$WIN_PATH"
fi

# Installer directory (where the setup.sh is running from)
INSTALLER_DIR=$OLDPWD 

if [ -d "$INSTALLER_DIR/windows_scripts" ]; then
    echo "Copying Bridge scripts to Windows host..."
    cp "$INSTALLER_DIR/windows_scripts/"* "$WIN_PATH/"
else
    echo -e "${RED}ERROR: 'windows_scripts' folder not found!${NC}"
fi

# 4. Injecting Identity & Configs (DIRECT PATH)
echo -e "${GREEN}[4/5] Injecting Jarvis Identity & Protocols...${NC}"

# Path in your extension repository
LOCAL_IDENTITY="$INSTALLER_DIR/docs/reference/templates/IDENTITY.md"
TARGET_TEMPLATE_PATH="$TARGET_DIR/docs/reference/templates"

if [ -f "$LOCAL_IDENTITY" ]; then
    mkdir -p "$TARGET_TEMPLATE_PATH"
    cp -f "$LOCAL_IDENTITY" "$TARGET_TEMPLATE_PATH/IDENTITY.md"
    echo -e "${GREEN}✅ IDENTITY.md injected into $TARGET_TEMPLATE_PATH${NC}"
else
    echo -e "${RED}ERROR: IDENTITY.md not found at $LOCAL_IDENTITY${NC}"
fi

# Inject tools.md template
if [ -f "$INSTALLER_DIR/docs/reference/templates/tools.md" ]; then
    cp -f "$INSTALLER_DIR/docs/reference/templates/tools.md" "$TARGET_TEMPLATE_PATH/tools.md"
    echo -e "${GREEN}✅ tools.md injected into $TARGET_TEMPLATE_PATH${NC}"
fi

# 5. Finalize
echo -e "${CYAN}======================================================${NC}"
echo -e "${GREEN}Installation Complete!${NC}"
echo -e "Next steps:"
echo -e "1. Go to directory: ${CYAN}cd $TARGET_DIR${NC}"
echo -e "2. Run the Wizard: ${CYAN}pnpm start${NC}"
echo -e "${CYAN}======================================================${NC}"
