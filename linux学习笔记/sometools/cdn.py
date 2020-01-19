import requests
from lxml import etree

baseUrl = 'https://www.bootcdn.cn/'
cdn = 'twitter-bootstrap'  # input('请输入cdn名:\n')
'''
输入想获取的cdn名，首先从服务器获取所有cdn名，如果输入的cdn名在服务器返回的列表中，则返回cdn信息
'''
r = requests.get(baseUrl + cdn)
selector = etree.HTML(r.text)
content = selector.xpath('/html/body/main/div/div/ul/li[*]/span/text()')
for url in content:
    if url.endswith('.css'):
        print('<link rel="stylesheet" type="text/css" media="screen" href="', url, '"/>')
    if url.endswith('.js'):
        print('<script type="text/ecmascript" src="', url, '"></script>')
