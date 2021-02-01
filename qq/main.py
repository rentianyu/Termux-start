'''
Author: your name
Date: 2021-01-27 21:36:36
LastEditTime: 2021-02-01 15:10:46
LastEditors: Please set LastEditors
Description: In User Settings Edit
FilePath: \install\qq\main.py
'''

from func import *
from send import *
from flask import Flask,request
from json import loads
import re

bot_server = Flask(__name__)
suList = ['1782898491']
xbt = '1782898491'
xbt_group = '773276432'

text, image, record, video = "text", "image", "record", "video"

@bot_server.route('/api/message',methods=['POST'])
#路径是你在酷Q配置文件里自定义的

def server():
    '''主要函数'''
    data = request.get_data().decode('utf-8')
    data = loads(data)

    if 'status' not in data:
        # 打印内容
        print(data)
        raw_message = data['raw_message'] # 消息内容
        
        message_type = data['message_type'] # 消息类型 group private
        
        user_id = str(data['user_id']) # 发送人

        if message_type == "group":
            group_id =  str(data['group_id']) # 发送群

            if raw_message == '一言':
                send_group_msg(words())
                # send_group_msg(url, group_id, image)

        elif message_type == "private":

            if raw_message == '一言':
                if user_id in suList:
                    send_private_msg(words())

            elif raw_message == '基金':
                if user_id in suList:
                    send_private_msg(fund_valuation())

    return ''

if __name__ == '__main__':
    bot_server.run(port=5701)
    #端口也是你在酷Q配置文件里自定义的
