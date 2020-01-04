# Termux-命令备份   

**1.授予Termux储存权限**      

 `termux-setup-storage`

**2.更新源、升级软件包**

`apt update && apt upgrade`

**3.更换软件源**

`export EDITOR=vi`

`apt edit-sources`

`http://mirrors.tuna.tsinghua.edu.cn/termux`

**4.安装常用命令包**

`pkg install vim curl wget git unzip unrar`

**5.终端配色**

`sh -c "$(curl -fsSL https://github.com/Cabbagec/termux-ohmyzsh/raw/master/install.sh)"`
选14、6
`~/termux-ohmyzsh/install.sh`

**6.更换主题**

`vim .zshrc`
更换为`junkfood`或`cloud`

**7.开屏界面编辑**

`vim $PREFIX/etc/motd`

**8.三行功能按键**

`mkdir $HOME/.termux ; echo "extra-keys = [['+', '-', '*', '/', '>', '&', 'ENTER', 'BACKSPACE'], ['ESC', 'echo', '.', ':', 'HOME', 'UP', 'END', 'PGUP'], ['TAB', 'CTRL', 'ALT', 'FN', 'LEFT', 'DOWN', 'RIGHT', 'PGDN']]" > $HOME/.termux/termux.properties`

**9.安装nmap**

`pkg install nmap`

**10.安装metasploit**

`pkg install unstable-repo`
`pkg install metasploit`
