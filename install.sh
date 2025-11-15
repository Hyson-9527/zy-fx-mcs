#!/bin/bash

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

LAUNCHER_URL="https://raw.githubusercontent.com/你的用户名/你的仓库名/main/milongsen.sh"
LAUNCHER_NAME="milongsen.sh"

echo -e "${GREEN}灵符已动，传法之机悄然开启……${RESET}"

echo -e "${YELLOW}接引其身……${RESET}"
curl -o "$HOME/$LAUNCHER_NAME" "$LAUNCHER_URL"

echo -e "${YELLOW}存此天机……${RESET}"
chmod +x "$HOME/$LAUNCHER_NAME"

echo -e "${YELLOW}上携启闭之法……${RESET}"
sed -i "/bash ~\/$LAUNCHER_NAME/d" "$HOME/.bashrc"
echo "bash ~/$LAUNCHER_NAME" >> "$HOME/.bashrc"

echo -e "${GREEN}传法既成，灵机已备！${RESET}"
echo -e "${GREEN}将Termux闭之，复启，可见神迹！${RESET}"
