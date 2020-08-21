#!/usr/bin/bash
if [ $(whoami) == root ]
then
    echo 1.更新软件包
    apt update -y ; apt upgrade -y ; apt autoremove -y

    echo 2.安装应用包
    apt install -y vim git unrar fish nmap python jq nodejs npm nodejs-legacy

    echo 3.设置默认shell为fish并清空欢迎语
    chsh -s $(which fish) ; fish -c "set -U fish_greeting"

    echo 4.定义一些快捷命令
    echo "apti aptr aa lsa .. nmap1 nmap6"

    mkdir -p ~/.config/fish
    s=~/.config/fish/config.fish

    echo "
alias apti='apt -y install'
alias aptr='apt -y remove'
alias apts='apt search'
alias aa='apt update -y ; apt upgrade -y ; apt autoremove -y'

alias lsa='ls -a'
alias ..='cd ..; ls -a'
alias gitp='git add . ; git commit -m auto-push ; git push ; echo push成功'

alias nmap1='nmap 127.0.0.1'

">>$s

    echo 5.配置git
    git config --global user.name "rentianyu"
    git config --global user.email "1782898491@qq.com"
    
    echo 6.Ubuntu设置终端为中文
apt install -y language-pack-zh-hans ; locale-gen zh_CN.UTF-8 ;
    echo '
LANG="zh_CN.UTF-8"
LANGUAGE="zh_CN:zh:en_US:en"
LC_NUMERIC="zh_CN.UTF-8"
LC_TIME="zh_CN.UTF-8"
LC_MONETARY="zh_CN.UTF-8"
LC_PAPER="zh_CN.UTF-8"
LC_IDENTIFICATION="zh_CN.UTF-8"
LC_NAME="zh_CN.UTF-8"
LC_ADDRESS="zh_CN.UTF-8"
LC_TELEPHONE="zh_CN.UTF-8"
LC_MEASUREMENT="zh_CN.UTF-8"
LC_ALL=zh_CN.UTF-8' > /etc/default/locale

    echo '稍后重启以应用中文'
    
    echo 7.一些脚本的下载
    mkdir ~/Scripts
    cd ~/Scripts
        echo '宝塔baota.sh'
        wget -O baota.sh http://download.bt.cn/install/install-ubuntu_6.0.sh | chmod +x baota.sh
        echo 'v2ray脚本'
        wget -O v2ray.sh https://git.io/v2ray.sh | chmod +x v2ray.sh
        echo 'BBR加速脚本'
        wget -O BBR.sh https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh ; chmod +x BBR.sh

    echo 8.创建一些文件夹
    mkdir ~/Github
    mkdir ~/Scripts

    echo 8.安装并配置oy my fish
    curl -L https://get.oh-my.fish | fish
    echo "omf install ays"
    # fish -c "omf install ays"

else
    echo "当前不是root用户，请切换到root"
fi

