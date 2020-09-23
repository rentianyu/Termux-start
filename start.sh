
# 前言
    echo '
    本项目仅为自用，出问题改不负责
    项目地址：https://github.com/rentianyu/install
    此脚本为Termux或Ubuntu安装之后的初始化脚本

    # 如果是要在Termux上运行请注意以下几点
    - 至少授予Termux储存权限（最好是权限全给）
    - 如果链接termux类命令到系统请保证termux具有root权限、授予Termux API软件所有权限和自启动权限
    - 安卓9自用，其他自测

-------------------------------------------

    # 请准备完毕后输入以下数字继续

    1. 为 Termux 初始化
    2. 为 Ubuntu 初始化
    3. 为 vps 安装DD系统

    温馨提示...如果你不想执行选项...按 Ctrl + C 即可退出
    '
# 前言结束

# 传入参数判断
if [ ! -d $1 ]; then
    i=$1
    echo -e "正在使用静默模式$1"
    else
    read i
fi

# DD系统判断
if [ $i = 3 ]; then
    apt install -y xz-utils openssl gawk file
    wget --no-check-certificate https://shell.p1e.cn/reinstall/Network-Reinstall-System-Modify.sh && chmod a+x Network-Reinstall-System-Modify.sh
    bash Network-Reinstall-System-Modify.sh -Ubuntu_18.04
fi

# 判断 2 模式是否为 root 用户
if [[ $i = 2 && $(whoami) != root ]]; then
    echo "当前不是root用户，已退出脚本"
fi

# 1、2 模式重复部分
if [[ $i = 1 || $i = 2 ]]; then
    # 说明一些变量
    # fish 的配置文件
    s=~/.config/fish/config.fish

    #-------分割线-------#

    echo 更新软件包
    apt upgrade -y ; apt autoremove -y

    echo 安装应用包
    apt install -y vim git zip unzip curl fish nmap jq dos2unix htop

    echo 定义一些快捷命令
    mkdir -p ~/.config/fish

    echo "
    alias apti='apt -y install'
    alias aptr='apt -y remove'
    alias apts='apt search'
    alias aa='apt update -y ; apt upgrade -y ; apt autoremove -y'

    alias lsa='ls -a'
    alias ..='cd ..; ls -a'
    alias ll='ls -al'

    alias cdg='cd ~/github ; ls'

    alias gitc='git clone'
    alias gitp='git add . ; git commit -m auto-push ; git push ; echo push成功'
    alias gitw='git add . ; git commit -m auto-push ; git push ; git push github master ; echo push成功'

    alias nmap1='nmap 127.0.0.1'
    alias nmap2='nmap 192.168.0.2'
    alias nmap6='nmap 192.168.0.6'
    alias nmap192='nmap 192.168.0.1-255'

    alias mi6='ssh mi6'
    alias vps='ssh vps'
    alias router='ssh router'

    
    ">$s


    echo 创建一些文件夹和一些文件
    mkdir ~/task
    :>~/task/day.sh
    chmod +x ~/task/day.sh
    :>~/task/hour.sh
    chmod +x ~/task/hour.sh

    echo 配置ssh
    if [ -d ~/.ssh/config ]; then
    mkdir ~/.ssh
    echo '
    Host mi6
        HostName 192.168.0.2
        User u0_a
        Port 8022

    Host vps
        HostName 0
        User root
        Port 22

    Host pad
        HostName 192.168.0.3
        User u0_a
        Port 8022

    Host router
        HostName 192.168.0.1
        User root
        Port 22' > ~/.ssh/config
    fi
    
    cat ~/.ssh/*.pub

    echo 配置github
    git config --global user.email "1782898491@qq.com"
    git config --global user.name "rentianyu"

fi

# 1 模式独有
if [ $i = 1 ]; then

    # Termux
    echo 安装软件包
    apt update -y && apt install -y termux-api termux-auth tsu cronie openssh

    if [ -d ~/.ssh/*.pub ]; then
        apt install -y openssh
    fi

    echo 设置默认shell为fish并清空termux启动语和fish欢迎语
    chsh -s fish
    :>$PREFIX/etc/motd
    fish -c "set -U fish_greeting"

    echo 启用三行功能按键
    mkdir ~/.termux;echo "extra-keys = [['+', '-', '\"', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', 'BACKSLASH', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', '$', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]">~/.termux/termux.properties


    echo 创建文件和文件夹
    ln -s /sdcard/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv/ ~/qq
    mkdir -p /sdcard/ADM/github
    ln -s /sdcard/ADM/github ~/github
    ln -s /sdcard/ADM ~/adm


    echo 定义一些命令
    echo "
    alias cdq='cd ~/qq;ls'
    alias cda='cd /sdcard/ADM;ls'

    if ps -A | grep sshd
    else
        sshd
    end

    if ps -A | grep crond
    else
        crond
    end

    ">>$s

    echo 链接termux类命令到系统
    su -c '
    mount -o rw,remount /
    mount -o rw,remount /system
    rm -rf /system/bin/termux*
    for i in $(ls /data/data/com.termux/files/usr/bin/termux*)
    do
    ln -s $i /system/bin
    done
    mount -o ro,remount /
    mount -o ro,remount /system'

    echo 安装oy my fish
    termux-clipboard-set "curl -L https://get.oh-my.fish | fish ; omf install ays"

# 2 模式独有
elif [ $i = 2 ]; then

    # Ubuntu
    echo 安装软件包
    apt update -y && apt install -y python nodejs npm python3-dev python3-pip python3-setuptools
    pip3 install thefuck


    echo 设置默认shell为fish并清空欢迎语
    chsh -s $(which fish) && fish -c "set -U fish_greeting"


    echo 定义一些命令
    echo "
    alias cdd='cd /mnt/c/Users/Admin/Desktop'

    alias adb='adb.exe'
    alias clip='clip.exe'
    alias winpaste='powershell.exe Get-Clipboard'

    cd /mnt/c/Users/Admin/Desktop

    thefuck --alias | source
    
    ">>$s

    echo 创建和链接一些文件
    ln -s /mnt/d/10.code/2.Github ~/github

    echo Ubuntu设置终端为中文以及北京时间
    apt install -y fonts-noto-cjk language-pack-zh-hans ;
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
    locale-gen zh_CN.UTF-8

    rm -rf /etc/localtime
    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

    echo 安装oy my fish和其他
    echo "

    echo 'cd /mnt/c/Users/Admin/Desktop'>>~/.config/fish/config.fish

    curl -L https://get.oh-my.fish | fish
    omf install ays


    # 设置WSL默认登录用户为root
    ubuntu config --default-user root'

    "
# 输入错误
else
    echo 输入错误，正在退出脚本

fi
