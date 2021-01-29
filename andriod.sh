#!/system/bin/sh
# 静默截图到SD卡(保存的多重动作): 
f=/sdcard/DCIM/Screenshots
screencap -p > $f/屏幕截图_$(date +%Y%m%d%H%M%S).png
for i in $(seq 2);do am broadcast -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d file://$f; done

# 蚂蚁森林偷能量修改配置文件
f=/storage/emulated/0/Android/data/pansong291.xposed.quickenergy
sed -i 's/"threadCount".*/"threadCount": 16,/' $f/config.json
sed -i 's/"queryThreadCount".*/"queryThreadCount": 4,/' $f/config.json
sed -i 's/"checkInterval".*/"checkInterval": 29000,/' $f/config.json
sed -i 's/"threadCount".*/"threadCount": 16,/' $f.qiufeng/config.json
sed -i 's/"queryThreadCount".*/"queryThreadCount": 4,/' $f.qiufeng/config.json
sed -i 's/"checkInterval".*/"checkInterval": 29000,/' $f.qiufeng/config.json
# 挂载系统
mount -o ro,remount -t auto /
mount -o rw,remount -t auto /system || mount /system || mount -o rw,remount -t auto /



