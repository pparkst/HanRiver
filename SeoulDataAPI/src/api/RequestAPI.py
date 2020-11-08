import urllib3
import json
import xmltodict
import datetime
import threading

#http://openapi.seoul.go.kr:8088/516a4461797070613539644b544c55/xml/WPOSInformationTime/1/5/20201106

API_HOST = "http://openapi.seoul.go.kr:8088"
API_KEY = "516a4461797070613539644b544c55"
data = {}
http = urllib3.PoolManager()

def requstAPI(path, query, method, data={}):
    url = API_HOST + '/' + API_KEY + '/' + path

    if 'GET' == method:
        req = http.request(method, url)
        req.auto_close = False
    return req.data

def dataFormat(result_API):
    dict_type = xmltodict.parse(result_API)
    json_type = json.dumps(dict_type)
    dict2_type = json.loads(json_type)

    return dict2_type

def run():
    now = datetime.datetime.now()
    nowDate = now.strftime('%Y%m%d')
    query = 'xml/WPOSInformationTime/1/5/%s' % nowDate
    
    result = requstAPI(query, '', 'GET')
    data = dataFormat(result)

    result_Code = data['WPOSInformationTime']['RESULT']['CODE']

    if result_Code == 'INFO-000':
        print(data['WPOSInformationTime']['row'][4]['W_TEMP'])


timer = threading.Timer(600, run)
timer.start()