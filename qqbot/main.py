'''
Author: your name
Date: 2021-01-27 21:36:36
LastEditTime: 2021-01-31 12:55:26
LastEditors: Please set LastEditors
Description: In User Settings Edit
FilePath: \install\qqbot\main.py
'''
from qqbot.func import *
from flask import Flask,request
from json import loads
import requests
import re

bot_server = Flask(__name__)

suList = ['1782898491']
xbt = '1782898491'
xbt_group = '773276432'

def send_private_msg(user_id, message, auto_escape=False):
    '''发送私人消息'''
    data={
        'user_id':user_id,
        'message':message,
        'auto_escape':auto_escape
    }
    api_url = 'http://127.0.0.1:5700/send_private_msg'
    requests.post(api_url,data=data)

def send_group_msg(group_id, message, auto_escape=False):
    '''发送群消息'''
    data={
        'group_id':group_id,
        'message':message,
        'auto_escape':auto_escape
    }
    api_url = 'http://127.0.0.1:5700/send_group_msg'
    requests.post(api_url,data=data)

@bot_server.route('/api/message',methods=['POST'])
#路径是你在酷Q配置文件里自定义的

def server():
    '''主要函数'''
    data = request.get_data().decode('utf-8')
    data = loads(data)

    if 'status' not in data:
        # 打印内容
        print(data)
        # 消息内容
        raw_message = data['raw_message']
        # 消息类型 group private
        message_type = data['message_type']
        # 发送人
        user_id = str(data['user_id'])
        # 发送群
        # group_id =  str(data['group_id'])
        
        if message_type == "group":

            if raw_message == '一言':
                send_group_msg(group_id, words())

        elif message_type == "private":

            if raw_message == '一言':
                send_private_msg(user_id, words())

            elif raw_message == '基金':
                if user_id in suList:
                    send_private_msg(user_id, fund_valuation())

    return ''

if __name__ == '__main__':
    bot_server.run(port=5701)
    #端口也是你在酷Q配置文件里自定义的
