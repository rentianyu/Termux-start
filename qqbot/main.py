from flask import Flask,request
from json import loads
import requests
import re

bot_server = Flask(__name__)

suList = ['1782898491']
xbt = '1782898491'
xbt_group = '773276432'


def words():
    '''一言'''
    url = 'https://v1.hitokoto.cn/'
    data = requests.get(url)
    return data.json()['hitokoto']

def botOp(msg):
    '''青云智能聊天'''
    url = 'http://api.qingyunke.com/api.php?key=free&appid=0&msg='+msg
    return requests.get(url).json()['content'].replace('{br}','\n')

def fund_valuation():
    '''基金查询'''
    result = ''
    fundList = {
        '农银新能源　':'002190',
        '景顺长城混合':'260108',
        '建信新能源　':'009147',
        '招商中证白酒':'161725',
        '前海开源混合':'002079',
        '兴全定期混合':'001511'
    }
    for name, value in fundList.items():
        url = 'http://fundgz.1234567.com.cn/js/' + value + '.js'
        data = requests.get(url).text
        data = re.findall('"gszzl":"(.*?)"', data)
        result += name+':'+data[0] +'\n'
    return result

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

    #if 'status' not in data:
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
    
    # 一言
    if raw_message == '一言':
        if message_type == 'group':
            group_id =  str(data['group_id'])
            send_group_msg(group_id, words())
        else:
            send_private_msg(user_id, words())

    # 基金
    elif raw_message == '基金':
        if user_id in suList:
            send_private_msg(user_id, fund_valuation())

    return ''

if __name__ == '__main__':
    bot_server.run(port=5701)
    #端口也是你在酷Q配置文件里自定义的
