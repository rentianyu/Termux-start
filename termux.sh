#!/data/data/com.termux/files/usr/bin/bash

echo 1.更新软件包
apt update -y && apt upgrade -y && apt autoremove -y

echo 2.安装应用包
apt install -y termux-api termux-auth vim git unzip unrar fish tsu nmap python jq openssh nodejs npm

echo 3.设置默认shell为fish
chsh -s fish

echo 4.清空开屏界面和fish欢迎语
:>$PREFIX/etc/motd && fish -c "set -U fish_greeting"

echo 5.启用三行功能按键
mkdir ~/.termux;echo "extra-keys = [['+', '-', '\"', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', 'BACKSLASH', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', '$', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]">~/.termux/termux.properties

echo 6.定义一些快捷命令
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
alias ll='ls -al'

alias nmap1='nmap 127.0.0.1'
alias nmap6='nmap 192.168.0.6'
alias nmap192='nmap 192.168.0.1-254'

alias gitp='git add . ; git commit -m auto-push ; git push ; echo push成功'

alias cdg='cd /sdcard/ADM/Github'
ln -s /sdcard/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv/ ~/QQ

alias vps='ssh vps'

">>$s

echo 7.ssh有关
echo sshd>>$s
mv -f ~/.ssh ~/.ssh_bak
ssh-keygen -t dsa -f ~/.ssh/id_dsa -P ""
cat ~/.ssh/*.pub | termux-clipboard-set
echo 'Host router
    HostName 192.168.0.1
    User root
    Port 22

Host vps
    HostName 0
    User root
    Port 22'>~/.ssh/config


echo 8.配置git
git config --global user.name "rentianyu"
git config --global user.email "1782898491@qq.com"

echo 9.安装并配置oy my fish
termux-clipboard-set "omf install ays"
curl -L https://get.oh-my.fish | fish
