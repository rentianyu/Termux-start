# 安装软件包
for i in update upgrade autoremove; do; apt $i -y; done
apt install -y vim git zip unzip curl wget fish jq dos2unix htop tree neofetch termux* tsu cronie openssh

# 复制配置文件
cp -r ""$(dirname "$0")"/.*" ~/

# Shell
# 清空fish欢迎语
fish -c "set -U fish_greeting"
chsh -s fish
# 设置默认shell为fish并清空termux启动语和fish欢迎语
chsh -s fish
: >$PREFIX/etc/motd


# GitHub
git config --global user.email "1782898491@qq.com"
git config --global user.name "rentianyu"

# Termux
# 安装软件包
apt update -y && apt install -y 



# 启用三行功能按键
mkdir ~/.termux
echo "extra-keys = [['+', '-', '\"', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', 'BACKSLASH', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', '$', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]" >~/.termux/termux.properties

# 链接文件夹
ln -s /sdcard/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv/ ~/qq
mkdir -p /sdcard/ADM/github
ln -s /sdcard/ADM/github ~/github
ln -s /sdcard/ADM ~/adm

# 安装oy my fish

curl -L https://get.oh-my.fish | fish

omf install ays"


