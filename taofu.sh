#!/bin/bash

# Function to show menu
show_menu(){
    clear
    white "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e "${bblue}███████████████████████████████████████████████████████████████${plain}"
    echo -e "${bblue}██                                                                  ██${plain}"
    echo -e "${bblue}██  ░█████  ░█████  ░██   ░██████  ░█████  ░█████   ░██████  ░██   ██${plain}"
    echo -e "${bblue}██  ░██░██  ░██░██  ░██   ░██  ██  ░██░██  ░██░██   ░██  ██  ░██   ██${plain}"
    echo -e "${bblue}██  ░██░██  ░██░██  ░██   ░██  ██  ░██░██  ░██░██   ░██  ██  ░██   ██${plain}"
    echo -e "${bblue}██  ░█████  ░█████  ░██   ░██████  ░█████  ░█████   ░██████  ░██   ██${plain}"
    echo -e "${bblue}██                                                                  ██${plain}"
    echo -e "${bblue}███████████████████████████████████████████████████████████████${plain}"
    white "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    white "桃符脚本管理工具"
    white "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    white "桃符脚本管理工具快捷方式：tf"
    red "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    green "1. 卸载脚本"
    green "2. 管理 Warp"
    green "0. 退出脚本"
    red "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo
    readp "请输入数字:" Input
    case "$Input" in
        2 ) cfwarp;;
        1 ) uninstall_script;;
        0 ) exit 0;;
        * ) echo "无效的选择，请重新输入"; back;;
    esac
}

# Function to manage Warp
cfwarp() {
  bash <(curl -Ls https://gitlab.com/rwkgyg/CFwarp/raw/main/CFwarp.sh)
  back
}

# Function to uninstall the script
uninstall_script() {
    echo "正在卸载脚本..."
    # 清理安装内容
    rm -f /usr/local/bin/tf
    rm -f $FLAG_FILE
    echo "卸载完成。"
    exit 0
}

# Helper function for colored output
white(){
    echo -e "\e[1;37m$1\e[0m"
}

green(){
    echo -e "\e[1;32m$1\e[0m"
}

red(){
    echo -e "\e[1;31m$1\e[0m"
}

bblue(){
    echo -e "\e[1;34m$1\e[0m"
}

readp(){
    read -rp "$1" $2
}

# Function to return to menu
back(){
    read -p "按任意键返回主菜单..."
    show_menu
}

# Download and setup the script
setup_script(){
    if [ ! -f /usr/local/bin/tf ]; then
        wget -qO /usr/local/bin/tf https://raw.githubusercontent.com/Dreags/TaoFu/main/taofu.sh
        chmod +x /usr/local/bin/tf
        echo "脚本已安装。输入 'tf' 启动菜单。"
    fi
}

# Main execution starts here
if [ "$0" == "/usr/local/bin/tf" ]; then
    show_menu
else
    setup_script
    sleep 1
fi
