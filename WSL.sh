#!/usr/bin/bash
if [ $(whoami) == root ]
then
    echo 1.更新软件包
    apt update -y && apt upgrade -y && apt autoremove -y

    echo 2.安装应用包
    apt install -y busybox vim git unrar fish nmap python jq openssh

    echo 3.设置默认shell为fish并清空欢迎语
    chsh -s $(which fish) && fish -c "set -U fish_greeting"

    echo 4.定义一些快捷命令
    echo "apti aptr aa lsa .. nmap1 nmap6"

    mkdir -p ~/.config/fish
    s=~/.config/fish/config.fish

    echo "
    alias apti='apt -y install'
    alias aptr='apt -y remove'
    alias apts='apt search'
    alias aa='apt update -y && apt upgrade -y && apt autoremove -y'

    alias lsa='ls -a'
    alias ..='cd ..&& ls -a'
    alias gitp='git add . && git commit -m "auto-push" && git push && echo push成功'

    alias nmap1='nmap 127.0.0.1'
    alias nmap6='nmap 166.66.66.6'
    alias nmap66='nmap 166.66.66.1-254'
    alias nmap192='nmap 192.168.0.1-254'

    alias cdg='cd /mnt/d/10.code/2.Github ; ls'
    alias wincopy='clip.exe'
    alias winpaste='powershell.exe Get-Clipboard'

    alias cdg='cd /mnt/d/10.code/2.Github && ls -a'
    alias cdd='cd /mnt/c/Users/Admin/Desktop && ls -a'

    alias adb='adb.exe'
    alias clip='clip.exe'

    ">>$s

    echo 5.配置sshd
    echo sshd >> $s
    ssh-keygen

    echo 6.安装并配置oy my fish
    curl -L https://get.oh-my.fish | fish
    echo "omf install ays"

    echo 7.显示信息
    echo '
    # 设置默认WSL为root用户
    kali config --default-user root
    ubuntu2004 config --default-user root'


    fish

else
    echo "当前不是root用户，请切换到root"
fi

