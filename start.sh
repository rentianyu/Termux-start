i=1
until [ $i == 0 ]; do

    clear
    # 前言
    echo '
    ### 欢迎使用小贝塔Termux或Ubuntu初始化脚本 ###

    + 本脚本仅为自用，出问题改不负责
    + 本脚本项目地址：https://github.com/rentianyu/install
    + 去广告hosts项目地址：https://github.com/rentianyu/Ad-set-hosts

    # 如果是要在Termux上运行请注意以下几点
    + 至少授予Termux储存权限(最好是权限全给)
    + 如果链接termux类命令到系统请保证termux具有root权限、授予Termux API软件所有权限和自启动权限
    + 安卓9、10 自用，其他自测
    + 链接到系统指的是链接到 /system/bin/ 目录下

+++++---------------------------------------+++++

    # 请准备完毕后输入以下数字继续

    0. 退出脚本
    1. 为 Termux 初始化
    2. 为 Ubuntu 初始化
    3. 为 vps 安装DD系统
    4. 只链接已安装的termux开头命令进系统
    5. 链接已安装的所有termux命令进系统
    6. 移除链接到系统的termux命令
    7. 使用小贝塔去广告hosts
    8. 解除小米软件机型限制


    温馨提示...如果你不想执行选项...按 Ctrl + C 即可退出
    '
    # 前言结束

    # 等待传入参数
    read -t 600 i

    # 模式0 退出脚本判断
    if [ $i = 0 ]; then
        echo '脚本已退出，欢迎再次使用！'
        exit 0
    fi

    # 判断 2 模式是否为 root 用户
    if [[ $i = 2 && $(whoami) != root ]]; then
        echo "当前不是root用户，已退出脚本,请切换为root用户再执行"
        exit 0
    fi

    # 模式3 为 vps 安装DD系统
    if [ $i = 3 ]; then
        if [ $(whoami) = root ]; then
        apt install -y xz-utils openssl gawk file &&
        wget --no-check-certificate https://shell.p1e.cn/reinstall/Network-Reinstall-System-Modify.sh && chmod a+x Network-Reinstall-System-Modify.sh &&
        bash Network-Reinstall-System-Modify.sh -Ubuntu_18.04
        else
            echo "当前不是root用户，已退出脚本,请切换为root用户再执行"
            exit 0
        fi
    fi

    # 模式4 只链接已安装的termux开头命令进系统
    if [ $i = 4 ]; then
        su -c '
        mount --remount -w /system ; mount --remount -w /
        
        rm /system/bin/termux*
        for a in $(ls /data/data/com.termux/files/usr/bin/termux*)
        do
            ln -s $a /system/bin
        done
        
        mount --remount -r /system ; mount --remount -r /

        echo 执行完毕'
    fi

    # 模式5 链接已安装的所有termux命令进系统
    if [ $i = 5 ]; then
        su -c '
        mount --remount -w /system ; mount --remount -w /

        rm /system/bin/termux*
        for a in $(ls /data/data/com.termux/files/usr/bin/)
        do
            ln -s $a /system/bin
        done
        
        mount --remount -r /system ; mount --remount -r /

        echo 执行完毕'
    fi


    # 模式6 移除链接到系统的termux命令
    if [ $i = 6 ]; then
        su -c "
        mount --remount -w /system ; mount --remount -w /

        for a in $(ls -l /system/bin/* | grep termux | sed 's/.*:.. //g;s/ ->.*//g')
        do
            rm $a
        done
        
        mount --remount -r /system ; mount --remount -r /

        echo 执行完毕"
    fi

    # 模式7 使用小贝塔去广告hosts
    if [ $i = 7 ]; then
        su -c '
        mount --remount -w /system ; mount --remount -w /
        
        curl -sL https://raw.githubusercontent.com/rentianyu/Ad-set-hosts/master/hosts > /system/etc/hosts &&
        
        mount --remount -r /system ; mount --remount -r /

        echo 执行完毕'
    fi

    # 模式8 解除小米软件机型限制
    if [ $i = 8 ]; then
        su -c '
        mount --remount -w /system ; mount --remount -w /
        
        grep 'ro.miui.ui.version.name' /system/build.prop && echo 已解除限制，无需再次解除 ||
        echo 'ro.miui.ui.version.name=V12' >> /system/build.prop
        
        mount --remount -r /system ; mount --remount -r /

        echo 执行完毕'
    fi

    # 1、2 模式重复部分
    if [[ $i = 1 || $i = 2 ]]; then
        # 说明一些变量
        # fish 的配置文件
        s=~/.config/fish/config.fish

        #-------分割线-------#

        echo 更新软件包
        apt upgrade -y
        apt autoremove -y

        echo 安装应用包
        apt install -y vim git zip unzip curl wget fish nmap jq dos2unix htop

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
    alias pad='ssh pad'
    alias router='ssh router'

    
    " >$s

        echo 创建一些文件夹和一些文件
        mkdir ~/task
        : >~/task/day.sh
        chmod +x ~/task/day.sh
        : >~/task/hour.sh
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
        Port 22' >~/.ssh/config
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
        apt update -y && apt install -y termux-tools termux-api termux-auth tsu cronie openssh

        if [ -d ~/.ssh/*.pub ]; then
            apt install -y openssh
        fi

        echo 设置默认shell为fish并清空termux启动语和fish欢迎语
        chsh -s fish
        : >$PREFIX/etc/motd
        fish -c "set -U fish_greeting"

        echo 启用三行功能按键
        mkdir ~/.termux
        echo "extra-keys = [['+', '-', '\"', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', 'BACKSLASH', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', '$', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]" >~/.termux/termux.properties

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
    end > /dev/null

    if ps -A | grep crond
    else
        crond
    end > /dev/null

    " >>$s

        echo 安装oy my fish
        echo "
    curl -L https://get.oh-my.fish | fish
    
    omf install ays"

    fi


    # 2 模式独有
    if [ $i = 2 ]; then

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
    
    " >>$s

        echo 创建和链接一些文件
        ln -s /mnt/d/10.code/2.Github ~/github

        echo Ubuntu设置终端为中文
        apt install -y fonts-noto-cjk language-pack-zh-hans
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
    LC_ALL=zh_CN.UTF-8' >/etc/default/locale
        locale-gen zh_CN.UTF-8

        echo Ubuntu设置终端为北京时间
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

    fi

    sleep 10s

done
