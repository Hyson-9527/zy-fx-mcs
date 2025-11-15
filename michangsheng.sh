#!/bin/bash

GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
RED='\033[1;31m'
CYAN='\033[1;36m'
RESET='\033[0m'

CONFIG_FILE="tianjice.conf"
GAME_FILE="game.html"
SELF_NAME="michangsheng.sh"

function create_default_config() {
    echo -e "${YELLOW}未见天机策，始创坤舆图...${RESET}"
    echo 'GAME_DIR="/路径待设，请于菜单中修改/"' > "$CONFIG_FILE"
    echo 'GAME_PORT="8001"' >> "$CONFIG_FILE"
}

function press_any_key_to_return() {
    echo
    read -n 1 -s -p "$(echo -e ${CYAN}"任触一键 即归来处...${RESET})"
}

while true; do
    if [ ! -f "$HOME/$CONFIG_FILE" ]; then
        create_default_config
    fi
    source "$HOME/$CONFIG_FILE"

    clear
    echo -e "${GREEN}========================"
    echo -e "      ${YELLOW}觅长生${GREEN}"
    echo -e "========================${RESET}"
    echo -e "${GREEN}天机所示:${RESET}"
    echo -e "  - 仙府路径: ${CYAN}${GAME_DIR}${RESET}"
    echo -e "  - 传送阵号: ${CYAN}${GAME_PORT}${RESET}"
    echo -e "${GREEN}------------------------${RESET}"
    echo -e "${YELLOW}一、 开启仙途"
    echo -e "${BLUE}二、 另辟洞天"
    echo -e "${MAGENTA}三、 更换阵号"
    echo -e "${RED}九、 断毙仙缘"
    echo -e "${RED}零、 归于虚无${RESET}"
    echo -e "${GREEN}------------------------${RESET}"

    read -n 1 -p "$(echo -e ${CYAN}"请示法旨: "${RESET})" choice
    echo

    case $choice in
        1|[一])
            if [ ! -d "$GAME_DIR" ]; then
                echo -e "${YELLOW}警：天道不允，另择佳地！${RESET}"
                press_any_key_to_return
                continue
            fi
            echo -e "${GREEN}遵法旨，仙途将启...${RESET}"
            cd "$GAME_DIR"
            echo -e "${GREEN}已至仙府！${RESET}"
            echo -e "${GREEN}传送阵已在 ${GAME_PORT} 号开启...${RESET}"
            echo -e "${YELLOW}请驾临仙址: http://127.0.0.1:${GAME_PORT}/${GAME_FILE}${RESET}"
            python -m http.server "$GAME_PORT"
            break
            ;;
        2|[二])
            echo
            echo -e "${CYAN}欲辟新洞天，须入档案器中，寻得路径，摹其宗卷，再复归此处置之${RESET}"
            read -p "$(echo -e ${CYAN}请示下新洞天途径: ${RESET})" new_dir
            if [ -d "$new_dir" ]; then
                sed -i "s|^GAME_DIR=.*|GAME_DIR=\"$new_dir\"|" "$HOME/$CONFIG_FILE"
                echo -e "${GREEN}星移斗转，洞天已成！${RESET}"
            else
                echo -e "${YELLOW}警：天道不允，另择佳地！${RESET}"
            fi
            press_any_key_to_return
            ;;
        3|[三])
            read -p "$(echo -e ${CYAN}请示下新传送阵号: ${RESET})" new_port
            if [[ "$new_port" =~ ^[0-9]+$ ]]; then
                sed -i "s|GAME_PORT=.*|GAME_PORT=\"$new_port\"|" "$HOME/$CONFIG_FILE"
                echo -e "${GREEN}阵号已更！${RESET}"
            else
                echo -e "${YELLOW}警：阵号须为灵数！${RESET}"
            fi
            press_any_key_to_return
            ;;
        9|[九])
            echo
            read -n 1 -p "$(echo -e ${YELLOW}"此举一断，仙缘永绝！道友可愿担此果？？ (y/n): "${RESET})" confirm
            echo
            if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
                echo -e "${YELLOW}斩因...${RESET}"
                sed -i "/bash ~\/$SELF_NAME/d" "$HOME/.bashrc"
                sleep 1
                echo -e "${MAGENTA}抹迹...${RESET}"
                [ -f "$HOME/$CONFIG_FILE" ] && rm "$HOME/$CONFIG_FILE"
                sleep 1
                echo -e "${RED}毙缘...${RESET}"
                rm "$HOME/$SELF_NAME"
                clear
                echo -e "${GREEN}}缘线既绝，各循其道，道友珍重${RESET}"
                exit 0
            else
                echo -e "${GREEN}心念未决，此缘当续，返启运台。${RESET}"
                press_any_key_to_return
            fi
            ;;
        0|[零])
            clear
            echo -e "${RED}剑入鞘，龙归海... 道友，珍重！${RESET}"
            sleep 2
            exit 0
            ;;
        *)
            echo
            echo -e "${YELLOW}法旨不明，请重示！${RESET}"
            press_any_key_to_return
            ;;
    esac
done
