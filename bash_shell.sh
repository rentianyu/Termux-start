#!/bim/bash
# 获取脚本所在绝对目录
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
SHELL_FOLDER=$(dirname $(readlink -f "$0"))

