#!/usr/bin/env bash

useless_softwares=(
    libreoffice-common
    unity-webapps-common
    thunderbird
    totem
    rhythmbox
    simple-scan
    brasero
    gnome-mahjongg
    aisleriot
    gnome-mines
    gnome-sudoku
    onboard
)

function remove-software() {
    for useless_software in ${useless_softwares[@]}; do
        echo "正在移除的软件是: ${useless_software}"
        sudo apt-get remove $useless_software >& /dev/null
    done
}

function main() {
    printf "将要被移除的软件有:\n"
    printf "\t%s\n" ${useless_softwares[@]}
    while [ true ]; do
        read -p "是否要继续? (yes/no) > " choose
        case $choose in
            yes)
                remove-software
                break
            ;;
            no)
                exit 0
            ;;
            *)
                echo "输入有误,请重新输入."
        esac
    done
    echo "全部移除完毕."
}

main