#!/bin/bash
# 判断 2 模式是否为 root 用户
if [[ $i = 2 && $(whoami) != root ]]; then
    echo "当前不是root用户，已退出脚本,请切换为root用户再执行"
    exit 1
fi



# 模式4 只链接已安装的termux开头命令进系统
if [ $i = 4 ]; then
    apt update -y && apt install -y termux-tools termux-api termux-auth
    su -c '
    mount -o rw,remount -t auto /system ; mount -o rw,remount -t auto /

    ln -s /data/data/com.termux/files/usr/bin/termux* /system/bin
    
    mount -o ro,remount -t auto / ; mount -o ro,remount -t auto /system
    echo 执行完毕'
fi

# 模式5 链接已安装的所有termux命令进系统
if [ $i = 5 ]; then
    apt update -y && apt install -y termux-tools termux-api termux-auth
    su -c '
mount -o rw,remount -t auto /system ; mount -o rw,remount -t auto /

rm /system/bin/termux*
for a in $(ls /data/data/com.termux/files/usr/bin/*)
do
    ln -s $a /system/bin
done

mount -o ro,remount -t auto / ; mount -o ro,remount -t auto /system
    echo 执行完毕'
fi


# 模式6 删除系统所有的termux命令链接
if [ $i = 6 ]; then
su -c "
    mount -o rw,remount -t auto /system ; mount -o rw,remount -t auto /

    rm "$(ls -l /system/bin/* | grep termux | sed 's/.*:.. //g;s/ ->.*//g')"

    mount -o ro,remount -t auto / ; mount -o ro,remount -t auto /system
    echo 执行完毕"
fi

# 模式7 使用小贝塔去广告hosts
if [ $i = 7 ]; then
    su -c '
    mount -o rw,remount -t auto /system ; mount -o rw,remount -t auto /
    
    curl -sL https://raw.githubusercontent.com/rentianyu/Ad-set-hosts/master/hosts > /system/etc/hosts &&
    
    mount -o ro,remount -t auto / ; mount -o ro,remount -t auto /system

    echo 执行完毕'
fi

# 模式8 解除小米软件机型限制
if [ $i = 8 ]; then
    su -c '
    mount -o rw,remount -t auto /system ; mount -o rw,remount -t auto /
    
    grep 'ro.miui.ui.version.name' /system/build.prop && echo 已解除限制，无需再次解除 ||
    echo 'ro.miui.ui.version.name=V12' >> /system/build.prop
    
    mount -o ro,remount -t auto / ; mount -o ro,remount -t auto /system

    echo 执行完毕'
fi