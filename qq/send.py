'''
Author: your name
Date: 2021-01-31 18:16:53
LastEditTime: 2021-02-01 14:28:39
LastEditors: Please set LastEditors
Description: In User Settings Edit
FilePath: \qq\send_cq.py
'''
import requests

def send_msg(msg, type_id, id, msg_type, data_type):
    # 文本消息
    if msg_type == "text":
        msg = msg

    # QQ 表情、回复、合并转发
    elif msg_type in ['face', 'reply', 'forward', 'node']:
        msg = f"[CQ:{msg_type}, id={msg}]"

    # 图片、语音、短视频
    elif msg_type in ['image', 'record', 'video']:
        msg = f"[CQ:{msg_type}, file={msg}]"

    # @某人
    elif msg_type == "at":
        msg = f"[CQ:{msg_type}, qq={msg}]"

    # 猜拳魔法表情、掷骰子魔法表情、窗口抖动（戳一戳）、匿名发消息
    elif msg_type in ['prs', 'dice', 'shake', 'anonymous']:
        msg = f"[CQ:{msg_type}]"

    # 戳一戳、推荐好友、推荐群
    elif msg_type in ['poke', 'contact', 'music']:    
        msg = f"[CQ:{msg_type}, id={msg}, type={data_type}]"

    # 链接分享
    elif msg_type == "share":
        msg = f"[CQ:share, url={msg}, title={data_type}]"

    # 位置
    elif msg_type == "location":
        msg = f"[CQ:location, lat={msg}, lon={data_type}]"

    # XML 消息、JSON 消息
    elif msg_type in ['xml', 'json']:
        msg = f"[CQ:{msg_type}, data={msg}]"

    data={
        f"{type_id}_id": id,
        'message': msg
    }

    api_url = 'http://127.0.0.1:5700/send_msg'
    requests.post(api_url,data=data)
    print(data)

def send_private_msg(msg, id=1782898491, msg_type="text", data_type="share"):
    '''
    文本 ：(msg, user_id, text)\n
    表情 : (msg, user_id, face)\n
    图片 : (msg, user_id, image)\n
    语音 : (msg, user_id, record)\n
    视频 : (msg, user_id, video)\n
    @人  : (msg, user_id, at)\n
    猜拳 : (msg, user_id, rps)\n
    掷骰子 : (msg, user_id, dice)\n
    窗口抖动 : (msg, user_id, shake)\n
    戳一戳 : (msg, user_id, poke, "126", "2003")\n
    匿名发消息 : (msg, user_id, anonymous)\n
    链接分享 : (msg, user_id, share, 标题, 网址)\n
    推荐好友 : (msg, user_id, contact, QQ号, qq)\n
    推荐群 : (msg, user_id, contact, 群号, group)\n
    位置 : (msg, user_id, location, 维度, 经度)\n
    音乐分享 : (msg, user_id, music, 网易云歌曲id, 163)\n
    回复 : (msg, user_id, reply, 消息id)\n
    合并转发 : (msg, user_id, forward, 消息id)\n
    合并转发节点 : (msg, user_id, node, 消息id)\n
    XML 消息 : (msg, user_id, xml, 消息体, data)\n
    JSON 消息 : (msg, user_id, json, 消息体, data)
    '''
    send_msg(msg, "user", id, msg_type, data_type)

def send_group_msg(msg, id=630378946, msg_type="text", data_type="share"):
    '''
    文本 ：(msg, group_id, text)\n
    表情 : (msg, group_id, face)\n
    图片 : (msg, group_id, image)\n
    语音 : (msg, group_id, record)\n
    视频 : (msg, group_id, video)\n
    @人  : (msg, group_id, at)\n
    猜拳 : (msg, group_id, rps)\n
    掷骰子 : (msg, group_id, dice)\n
    窗口抖动 : (msg, group_id, shake)\n
    戳一戳 : (msg, group_id, poke, "126", "2003")\n
    匿名发消息 : (msg, group_id, anonymous)\n
    链接分享 : (msg, group_id, share, 标题, 网址)\n
    推荐好友 : (msg, group_id, contact, QQ号, qq)\n
    推荐群 : (msg, group_id, contact, 群号, group)\n
    位置 : (msg, group_id, location, 维度, 经度)\n
    音乐分享 : (msg, group_id, music, 网易云歌曲id, 163)\n
    回复 : (msg, group_id, reply, 消息id)\n
    合并转发 : (msg, group_id, forward, 消息id)\n
    合并转发节点 : (msg, group_id, node, 消息id)\n
    XML 消息 : (msg, group_id, xml, 消息体, data)\n
    JSON 消息 : (msg, group_id, json, 消息体, data)
    '''
    send_msg(msg, "group", id, msg_type, data_type)
