#!/bin/ash

# 路由器安装软件
opkg update && opkg install fish htop

# 路由器卸载插件
for i in music ttnode adbyby jd uugame mwan3helper; do
  echo -e "\n---- $i ----"
  opkg list_installed | grep -i $i | sed "s/ .*//g;s/^/opkg remove /g" | sed -n '1!G;h;$p'  
done

# 网易云音乐 music
opkg remove luci-i18n-unblockmusic-zh-cn
opkg remove luci-app-unblockmusic
opkg remove UnblockNeteaseMusicGo
opkg remove UnblockNeteaseMusic
# 甜糖星愿 ttnode
opkg remove luci-app-ttnode
# 广告屏蔽大师 adbyby
opkg remove luci-i18n-adbyby-plus-zh-cn
opkg remove luci-app-adbyby-plus
opkg remove adbyby
# 京东签到 jd-dailybonus
opkg remove luci-app-jd-dailybonus
# UU 加速器 uuplugin
opkg remove luci-i18n-uugamebooster-zh-cn
opkg remove luci-app-uugamebooster
opkg remove uugamebooster
# MWAN3 分流助手 mwan3helper
opkg remove luci-i18n-mwan3helper-zh-cn
opkg remove luci-app-mwan3helper
