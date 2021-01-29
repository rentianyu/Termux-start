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

