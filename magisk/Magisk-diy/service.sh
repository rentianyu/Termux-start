[ -z $1 ] && sleep 13

mo() {
    local m1=${1%\#\*\#*}
    local m2=${1##*\#\*\#}
    [[ -d "$m2" ]] || return
    [[ -d "$m1" ]] || mkdir -p "$m1"
    mount --bind "$m2" "$m1"
    chcon u:object_r:media_rw_data_file:s0 "$m2"
    chown media_rw:media_rw "$m1"
    if [[ "$(echo -n ${m1} |grep -o '^/data/media/0')" == '/data/media/0' ]] ; then am broadcast --user 0 -a android.intent.action.MEDIA_SCANNER_SCAN_FILE -d "file:///storage/emulated/0/${m1#/data/media/0/}" &>/dev/null ; fi
}

LG="
/data/media/0/ADM/QQ#*#/data/media/0/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv
/data/media/0/ADM/WX#*#/data/media/0/Android/data/com.tencent.mm/MicroMsg/Download
/data/media/0/ADM/下载#*#/data/media/0/Download
"

for TT in $LG; do
mo $TT
done
