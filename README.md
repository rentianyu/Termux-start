# Termux-命令备份

## 1. 软件下载地址

- Termux: https://f-droid.org/packages/com.termux
- Termux-API: https://f-droid.org/packages/com.termux.api

## 2. 使用命令

```bash
pkg install -y wget && bash -c "$(wget -qO- 'https://raw.githubusercontent.com/rentianyu/Termux-start/master/termux.sh')"
```

## 3. 代码如下

```bash
#!/data/data/com.termux/files/usr/bin/bash

echo 1.更新软件包
apt update -y && apt upgrade -y && apt autoremove -y

echo 2.安装应用包
apt install -y termux-api termux-auth vim curl git unzip unrar fish tsu nmap openssh python

echo 3.设置默认shell为fish
chsh -s fish

echo 4.清空开屏界面
:>$PREFIX/etc/motd

echo 5.启用三行功能按键
mkdir ~/.termux;echo "extra-keys = [['+', '-', '\"', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', '.', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', '$', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]">~/.termux/termux.properties

echo 6.定义快捷命令
echo "apti aptr aa lsa .. nmap1 nmap6"

s=~/.config/fish/config.fish

echo "alias apti='apt install'">>$s
echo "alias aptr='apt remove'">>$s
echo "alias aa='apt update -y && apt upgrade -y && apt autoremove -y'">>$s

echo "alias lsa='ls -a'">>$s
echo "alias ..='cd ..&& ls -a'">>$s

echo "alias nmap1='nmap 127.0.0.1'">>$s
echo "alias nmap6='nmap 166.66.66.1-254'">>$s
echo "alias nmap192='nmap 192.168.0.1-254'">>$s

echo "alias cdg='cd /sdcard/ADM/Github'">>$s

echo 7.设置密码
passwd

echo 8.配置ssh
echo sshd>>$S
ssh-keygen

echo 9.设置清空fish欢迎语命令到剪贴板
termux-clipboard-set "set -U fish_greeting"

exit
```