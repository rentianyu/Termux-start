print_modname() {
  ui_print "**********************"
  ui_print "         集合模块       "
  ui_print "    1. 链接termux命令        "
  ui_print "    2. 链接QQ、微信、下载目录        "
  ui_print "    by @小贝塔   "
  ui_print "                      "
  ui_print "**********************"
}
print_modname

SKIPUNZIP=1
unzip -o "$ZIPFILE" -x 'META-INF/*' -d $MODPATH >&2
set_perm_recursive $MODPATH 0 0 0755 0644

sys_bin="$TMPDIR/xbt_sys_bin"
termux_bin="$TMPDIR/xbt_termux_bin"
for b in /sbin /system/bin /system/xbin /vendor/bin ; do
ls $b >> "${sys_bin}_tmp"
done
sort -u "${sys_bin}_tmp" > ${sys_bin}
ls /data/data/com.termux/files/usr/bin/ | sort > $termux_bin
for c in $(comm -13 ${sys_bin} ${termux_bin}) ; do
ln -s "/data/data/com.termux/files/usr/bin/${c}" $MODPATH/system/bin/
done

# 启用service脚本
. $MODPATH/service.sh 1

ui_print "完成设置"