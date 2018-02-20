#!/usr/bin/env bash

softwares=(
    mysql-server
    mysql-workbench
    steam
    git
    vim
    tmux
    tmuxinator
    curl
    figlet
    irssi
    python3-pip
    redis-server
    mongodb
    docker.io
    guake
    docky
    screenfetch
)

function install_softwares() {
    for software in ${softwares[@]}; do
        echo "正在安装的软件是: ${software}"
        sudo apt-get install $software -y >& /dev/null
    done
    echo "全部下载完毕"
}

function main() {
    printf "将要安装的软件有:\n"
    printf "\t%s\n" ${softwares[@]}
    while [ true ]; do
        read -p "是否要继续? (yes/no) > " choose
        case $choose in
            yes)
                install_softwares
                break
            ;;
            no)
                exit 0
            ;;
            *)
                echo "输入有误,请重新输入."
        esac
    done
}

main