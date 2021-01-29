#!/bim/bash
# 获取脚本所在绝对目录
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

# 联通签到2
cd "$SHELL_FOLDER"
git clone https://github.com/lunnlew/AutoSignMachine.git liantong
cd liantong; npm i; npm audit fix
# 在4-23小时之间每隔三十分钟尝试运行可运行的脚本子任务
# */30 4-23 * * * /bin/node ~/tools/liantong/index.js unicom --user 1******5 --password 7****** --appid 1************9


# Google Drive 百宝箱
cd "$SHELL_FOLDER"
git clone https://github.com/dissipator/gd-utils.git gd
cd gd; npm i; npm audit fix
# 替换配置文件
# node ~/tools/gd/index.js


# 文字转图片
git clone git@github.com:rentianyu/txt2img.git
# python3 ~/tools/txt2img/txt2img.py -w "文字" -u "标题"