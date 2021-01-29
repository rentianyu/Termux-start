#!/bin/bash
# 检测百分浏览器更新
url='http://static.centbrowser.cn/win_stable/'
curl -s "$url" | wc -l | grep 49 || "$url"
# 检测微秘更新
url='https://wemind.cn/download'
curl -s "$url" | grep d8e501103ab26ebd6827b2c940c434db37f49319 || qq "$url"