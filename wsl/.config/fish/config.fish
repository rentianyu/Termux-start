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
alias nmap='nmap.exe'
alias nmap1='nmap 127.0.0.1'

alias router='ssh router'
alias mi6='ssh mi6'
alias pad='ssh pad'
alias k30='ssh k30'
alias vps='ssh vps'
alias pan='ssh pan'

alias myip='curl ifconfig.me'

alias adb='adb.exe'
alias clip='clip.exe'
alias winpaste='powershell.exe Get-Clipboard'

alias cdd='cd /mnt/d/8.文件/桌面/; ls'
alias cdw='cd /mnt/d/10.code/1.website/loveit/public; ls'
alias cdg='cd /mnt/d/10.code/2.Github; ls'
alias cdv='/mnt/d/10.code/0.vscode; ls'

alias jd_config_get='scp -r pan:~/jd/config/ "/mnt/d/8.文件/桌面/"'
alias jd_config_put='mv /mnt/d/8.文件/桌面/config/config1.sh /mnt/d/8.文件/桌面/config/config.sh;scp -r "/mnt/d/8.文件/桌面/config" pan:~/jd/;pan bash jd/git_pull.sh'
alias jd_config1='wget -O /mnt/d/8.文件/桌面/config/config1.sh https://raw.githubusercontent.com/EvineDeng/jd-base/v3/sample/config.sh.sample'