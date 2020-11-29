import urllib3
import json
import xmltodict
import datetime
import threading
import os
import sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))))
import database.dbcon as dbcon


#http://openapi.seoul.go.kr:8088/516a4461797070613539644b544c55/xml/WPOSInformationTime/1/5/20201106

API_HOST = "http://openapi.seoul.go.kr:8088"
API_KEY = "516a4461797070613539644b544c55"
data = {}
http = urllib3.PoolManager()

beforeApiRequestTime = "00:00"

def requstAPI(path, query, method, data={}):
    url = API_HOST + '/' + API_KEY + '/' + path

    if 'GET' == method:
        req = http.request(method, url)
        req.auto_close = True
    return req.data

def dataFormat(result_API):
    dict_type = xmltodict.parse(result_API)
    json_type = json.dumps(dict_type)
    dict2_type = json.loads(json_type)

    return dict2_type

def setEntity(data):
        entity= { 'name': "'%s'" % data['WPOSInformationTime']['row'][4]['SITE_ID'], 
                'temperature': data['WPOSInformationTime']['row'][4]['W_TEMP'], 
                "created" : "sysdate()" }
        return entity

def run():
    global beforeApiRequestTime
    now = datetime.datetime.now()
    nowDate = now.strftime('%Y%m%d')
    query = 'xml/WPOSInformationTime/1/5/%s' % nowDate
    
    result = requstAPI(query, '', 'GET')
    print(result)
    data = dataFormat(result)
    result_Code = data['WPOSInformationTime']['RESULT']['CODE']

    if result_Code == 'INFO-000':
        print(data['WPOSInformationTime']['row'][4]['W_TEMP'])
        newApiRequestTime = str(data['WPOSInformationTime']['row'][4]['MSR_TIME'])

        if beforeApiRequestTime != newApiRequestTime:
                beforeApiRequestTime = newApiRequestTime
                entity = setEntity(data)
                dbcon.InsertHanRiverData(entity)
    timer = threading.Timer(300, run)
    timer.start()


run()