
# 说明一些变量
# fish 的配置文件
s=~/.config/fish/config.fish

#-------分割线-------#

echo 1.更新软件包
apt update -y ; apt upgrade -y ; apt autoremove -y

echo 2.安装应用包
apt install -y vim git zip unzip wget fish nmap jq dos2unix

echo 3.设置默认shell为fish并清空欢迎语
chsh -s $(which fish) ; fish -c "set -U fish_greeting"

echo 4.定义一些快捷命令

mkdir -p ~/.config/fish

echo "
alias apti='apt -y install'
alias aptr='apt -y remove'
alias apts='apt search'
alias aa='apt update -y ; apt upgrade -y ; apt autoremove -y'

alias lsa='ls -a'
alias ..='cd ..; ls -a'
alias ll='ls -al'

alias cdg='cd ~/Github ; ls'

alias gitp='git add . ; git commit -m auto-push ; git push ; echo push成功'
alias gitw='git add . ; git commit -m auto-push ; git push ; git push github master ; echo push成功'

alias nmap1='nmap 127.0.0.1'
alias nmap192='nmap 192.168.0.1-255'

alias mi6='ssh mi6'
alias vps='ssh vps'

">$s


echo 8.创建一些文件夹和一些文件

mkdir ~/Task
cd ~/Task
touch day.ssh
touch hour.sh

echo 9.配置ssh和Github
mkdir ~/.ssh
echo 'Host router
    HostName 192.168.0.1
    User root
    Port 22

Host vps
    HostName 0
    User root
    Port 22' > ~/.ssh/config
cat ~/.ssh/*.pub
git config --global user.email "1782898491@qq.com"
git config --global user.name "rentianyu"


echo 8.安装并配置oy my fish
echo "omf install ays"
curl -L https://get.oh-my.fish | fish