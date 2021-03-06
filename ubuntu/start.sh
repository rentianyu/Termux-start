#!/bin/bash
###
 # @Author: your name
 # @Date: 2021-01-31 13:01:07
 # @LastEditTime: 2021-01-31 13:11:11
 # @LastEditors: your name
 # @Description: In User Settings Edit
 # @FilePath: \install\ubuntu\start.sh
### 
# 更新软件包
for i in update upgrade autoremove; do apt $i -y; done

# 安装应用包
apt install -y vim git zip unzip curl wget fish jq dos2unix htop tree python3 python3-pip

# fish有关
chsh -s $(which fish)
fish -c "set -U fish_greeting" 
cp -rf .config ~

# 配置github
git config --global user.email "1782898491@qq.com"
git config --global user.name "rentianyu"

# Ubuntu设置终端为中文
apt update &&
apt install -y language-pack-zh-hans
update-locale LANG=zh_CN.UTF-8

# Ubuntu设置终端为北京时间
rm -rf /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime



# 安装oy my fish和其他
echo "

# WSL 专用
ln -s /mnt/d/10.code/2.Github ~/github
echo 'cd /mnt/c/Users/Admin/Desktop'>>~/.config/fish/config.fish
# 通用
curl -L https://get.oh-my.fish | fish
omf install numist

# 设置WSL默认登录用户为root
ubuntu config --default-user root'

"