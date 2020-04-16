# Termux-命令备份

## 0. 软件下载地址

- Termux: https://f-droid.org/packages/com.termux
- Termux-API: https://f-droid.org/packages/com.termux.api

## 1. 授予Termux储存权限      

 `termux-setup-storage`

## 2. 更换软件源

> 个人认为不换也行，但是你换了就一直用，别换来换去，容易不兼容

- 换国内清华源

```shell
echo 'deb http://mirrors.tuna.tsinghua.edu.cn/termux stable main'>/data/user/0/com.termux/files/usr/etc/apt/sources.list
```

- 换官方源

```shell 
echo 'deb https://termux.org/packages/ stable main'>/data/user/0/com.termux/files/usr/etc/apt/sources.list
```

## 3. 更新源、升级软件包

`pkg update -y && pkg upgrade -y`

## 4. 安装常用命令包

`pkg install -y vim curl wget git unzip unrar fish`

## 5. 设置默认shell为fish

`chsh -s fish`

## 6. 清空欢迎界面

`:>$PREFIX/etc/motd && set -U fish_greeting`

## 7. 三行功能按键

```shell
mkdir $HOME/.termux ; echo "extra-keys = [['+', '-', '', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', '.', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', '$', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]" > $HOME/.termux/termux.properties
```

> 执行后报错正常，Ctrl+d退出软件再重进就配置好了

## 8. 其他

```shell
pkg install tsu			# root环境使用termux命令
pkg install nmap		# 扫描端口用
pkg install termux-api 		# termux-api
pkg install openssh		# SSH	

结合一下
pkg install -y tsu nmap termux-api openssh
```



