# QQ 机器人有关

1. 下载运行文件并赋予执行权限

`mkdir ~/qq; cd ~/qq`
去 [go-cqhttp](https://github.com/Mrs4s/go-cqhttp/releases) 下载运行文件
`mv go-cqhttp-* go-cqhttp; chmod +x *`

2. 移动配置文件和脚本

wget [config.hjson](config.hjson)
wget [device.json](device.json)
wget [filter.json](filter.json)
wget [main.py](main.py)

3. 启动

```
screen -S qq
cd ~/qq; ./go-cqhttp

screen -S bot
python3 ~/qq/main.py
```