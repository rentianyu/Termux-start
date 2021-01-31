import requests
import re

def words():
    '''一言'''
    url = 'https://v1.hitokoto.cn/'
    data = requests.get(url)
    return data.json()['hitokoto']

def bot_qingyunke(msg):
    '''青云客智能聊天'''
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
