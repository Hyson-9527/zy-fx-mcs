#!/bin/bash

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RESET='\033[0m'

LAUNCHER_URL="https://raw.githubusercontent.com/Hyson-9527/zy-fx-mcs/main/michangsheng.sh"
LAUNCHER_NAME="michangsheng.sh"
CONFIG_FILE="tianjice.conf"

echo -e "${GREEN}感应到传法神符，开始接引道法…${RESET}"

echo
echo -e "${CYAN}为得其所，望道友引其来路…${RESET}"
read -p "$(echo -e ${CYAN}请告知仙府之径: ${RESET})" user_game_dir

if [ -z "$user_game_dir" ]; then
    user_game_dir="/路径未寻，待君另辟洞天…/"
    echo -e "${YELLOW}寻路未果，暂居他处，道友可往天机策再寻仙府之径…${RESET}"
fi

echo -e "${YELLOW}灵符已动，传法之机悄然开启…${RESET}"
curl -o "$HOME/$LAUNCHER_NAME" "$LAUNCHER_URL"

echo -e "${YELLOW}接引其身…${RESET}"
chmod +x "$HOME/$LAUNCHER_NAME"

echo -e "${YELLOW}存此天机…${RESET}"
echo "GAME_DIR=\"$user_game_dir\"" > "$HOME/$CONFIG_FILE"
echo "GAME_PORT=\"8001\"" >> "$HOME/$CONFIG_FILE"

echo -e "${YELLOW}上携启闭之法…${RESET}"
sed -i "/bash ~\/$LAUNCHER_NAME/d" "$HOME/.bashrc"
echo "bash ~/$LAUNCHER_NAME" >> "$HOME/.bashrc"

echo -e "${GREEN}传法既成，灵机已备！${RESET}"
echo -e "${GREEN}将Termux闭之，复启，可见神迹！${RESET}"
