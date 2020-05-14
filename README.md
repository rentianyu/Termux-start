# Termux-命令备份

## 1. 软件下载地址

- Termux: https://f-droid.org/packages/com.termux
- Termux-API: https://f-droid.org/packages/com.termux.api

## 2. 使用命令

```bash
curl -fsSL https://raw.githubusercontent.com/rentianyu/Termux-start/master/termux.sh | bash
```

## 3. 代码如下

```bash
#!/data/data/com.termux/files/usr/bin/bash

echo 1.更新软件包
apt update -y && apt upgrade -y && apt autoremove -y

echo 2.安装应用包
apt install -y termux-api termux-auth vim curl git wget unzip unrar fish tsu nmap python jq openssh

echo 3.设置默认shell为fish
chsh -s fish

echo 4.清空开屏界面
:>$PREFIX/etc/motd

echo 5.启用三行功能按键
mkdir ~/.termux;echo "extra-keys = [['+', '-', '\"', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', '.', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', '$', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]">~/.termux/termux.properties

echo 6.定义一些快捷命令
echo "apti aptr aa lsa .. nmap1 nmap6"

mkdir -p ~/.config/fish
s=~/.config/fish/config.fish

echo "
alias apti='apt install'
alias aptr='apt remove'
alias aa='apt update -y && apt upgrade -y && apt autoremove -y'

alias lsa='ls -a'
alias ..='cd ..&& ls -a'

alias nmap1='nmap 127.0.0.1'
alias nmap6='nmap 166.66.66.1-254'
alias nmap192='nmap 192.168.0.1-254'

alias cdg='cd /sdcard/ADM/Github'

">>$s

echo 9.设置清空fish欢迎语命令到剪贴板
termux-clipboard-set "set -U fish_greeting"

echo 7.默认启动sshd
echo sshd>>$s

fish

```