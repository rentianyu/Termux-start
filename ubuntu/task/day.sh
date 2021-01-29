#!/bin/bash
# 每天英语单词卡片
for i in $(curl -s -H 'cookie: l' 'https://api.vc.bilibili.com/link_draw/v1/doc/doc_list?uid=20862117'| jq -r '.data.items[0,1].pictures[].img_src'); do group "[CQ:image,file=$i]"; done

# 联通营业厅签到脚本更新
lt=~/liantong &&
wget -O $lt --no-check-certificate https://raw.githubusercontent.com/mixool/HiCnUnicom/master/CnUnicom.sh &&
sed -i "s/^deviceId=.*/devicedId=a87eca8da1624462a14965013aef4e6b/" $lt &&
sed -i "s/^appId=.*/appId=06eccb0b7c2fd02bc1bb5e8a9ca287417cdc4b93ff7dc243e2eb109e2df9f91751c78e274b633ca49fe33c8e629fa28b708e608f50d2e609b368d3aa3508047b37b71b500ae92310a37a7bd46a6c7526/" $lt &&
chmod +x $lt &&mv -f $lt /bin/liantong &&
# 联通签到
qq "$(liantong phone@pass | tail -n 1)"