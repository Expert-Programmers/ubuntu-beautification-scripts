#!/usr/bin/env bash

software_urls=(
    https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb # Google Chrome
    https://vscode.cdn.azure.cn/stable/f88bbf9137d24d36d968ea6b2911786bfe103002/code_1.20.1-1518535978_amd64.deb # Visual Studio Code
    http://d1.music.126.net/dmusic/netease-cloud-music_1.1.0_amd64_ubuntu.deb # 网易云音乐
    https://raw.githubusercontent.com/getlantern/lantern-binaries/master/lantern-installer-64-bit.deb # Lantern
    # https://dl.pstmn.io/download/latest/linux64 # Postman
    # https://download.jetbrains.8686c.com/toolbox/jetbrains-toolbox-1.6.2914.tar.gz # jetbrains-toolbox
    # https://download.robomongo.org/1.2.1/linux/robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz # Mongodb-GUI Robo 3T
)

function download_and_install_software() {
    download_dir=$1
    software_url=$2
    software=${software_url##*/}
    echo "开始下载软件: ${software}"
    wget -P ${download_dir} ${software_url} >& /dev/null
    echo "完成下载: ${software}"
    echo "准备安装软件: ${software}"
    while [ true ]; do
        sudo dpkg -i $download_dir/$software >& /dev/null
        if [ $? != 0 ]; then
            sudo apt-get install -f >& /dev/null
        else
            break
        fi
    done
    echo "软件安装完成: ${software}"
    rm -rfv $download_dir/$software
}

function main() {
    download_dir=~/Downloads
    for software_url in ${software_urls[@]}; do
        download_and_install_software ${download_dir} ${software_url}
    done
}

main
