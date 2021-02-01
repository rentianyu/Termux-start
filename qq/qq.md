<!--
 * @Author: your name
 * @Date: 2021-01-31 13:01:06
 * @LastEditTime: 2021-02-01 12:49:45
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \install\qq\qq.md
-->
# QQ 机器人

## 1. 配置QQ环境

```bash
cp -r install/qq ~
cd ~/qq
wget -O go-cqhttp https://github.com/Mrs4s/go-cqhttp/releases/download/v0.9.39/go-cqhttp-v0.9.39-linux-amd64
chmod +x *
vim config.hjson
```

## 2. 启动

```bash
screen -S qq
cd ~/qq; ./go-cqhttp

screen -S bot
python3 ~/qq/main.py
```