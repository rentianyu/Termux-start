
# 设置root登录 服务器的话不常用
sed -i 's/.\{,1\}PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
sed -i 's/.\{,1\}ClientAliveInterval 0/ClientAliveInterval 60/' /etc/ssh/sshd_config

# ssh关闭密码登录 这个好像不对
# pa=PasswordAuthentication
# ep=PermitEmptyPasswords
# sed -i "s/.\{,1\}${pa}.*/${pa} no/;s/.\{,1\}${ep}.*/${ep} no/" /etc/ssh/sshd_config; service sshd restart

# ssh时长增加
ai=ClientAliveInterval
ac=ClientAliveCountMax
sed -i "s/.\{,1\}${ai}.*/${ai} 300/;s/.\{,1\}${ac}.*/${ac} 3/" /etc/ssh/sshd_config; service sshd restart
