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

`pkg update && pkg upgrade`

## 4. 安装常用命令包

`pkg install vim curl wget git unzip unrar`

## 5. 终端配色

`sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"`   

第一个选14，第二个选6   

再次修改终端配色的话执行这个

`~/termux-ohmyzsh/install.sh`

## 6. 更换主题

`vim .zshrc`   
更换为`junkfood`或`cloud`

## 7. 开屏界面编辑

`vim $PREFIX/etc/motd`

## 8. 三行功能按键

`mkdir $HOME/.termux ; echo "extra-keys = [['+', '-', '', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', '.', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', 'FN', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]" > $HOME/.termux/termux.properties``

## 9. 其他

```shell
pkg install tsu			# root环境使用termux命令
pkg install nmap		# 扫描端口用
pkg install sqlite3		# 数据库命令
pkg install termux-api 	# termux-api

结合一下
pkg install tsu nmap sqlite3 termux-api
```



