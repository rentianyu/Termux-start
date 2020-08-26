# 重装系统命令备份

## 1. 配置安装命令

```bash
# termux
apt update -y && apt install -y curl && curl -L https://raw.githubusercontent.com/rentianyu/install/master/Termux.sh | bash

# WSL
apt update -y && apt install -y curl && curl -L https://raw.githubusercontent.com/rentianyu/install/master/WSL.sh | bash

# Ubuntu
apt update -y && apt install -y curl && curl -L https://raw.githubusercontent.com/rentianyu/install/master/Ubuntu.sh | bash

# 网易云签到、听歌脚本
wget -O /usr/bin/netease https://raw.githubusercontent.com/rentianyu/install/master/netease
```

## 2. Termux有关软件下载地址

- Termux: https://f-droid.org/packages/com.termux
- Termux-API: https://f-droid.org/packages/com.termux.api