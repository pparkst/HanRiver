import urllib3
import json
import xmltodict
import datetime
import threading
import os
import sys
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))))
import database.dbcon as dbcon
import src.common.utill as utill


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
        entityList = []

        for row in data['WPOSInformationTime']['row']:
                entity = { 'type': utill.riverStrKey.getRiverStrKey(row['SITE_ID']).value,
                'name': "%s" % row['SITE_ID'], 
                'temperature': float(row['W_TEMP']),
                'time': datetime.datetime.now().strftime('%Y-%m-%d ') + row['MSR_TIME']
               }

                entityList.append(entity)

        return entityList

def run():
    global beforeApiRequestTime
    now = datetime.datetime.now()
    nowDate = now.strftime('%Y%m%d')
    query = 'xml/WPOSInformationTime/1/5/%s' % nowDate
    
    result = requstAPI(query, '', 'GET')
    data = dataFormat(result)
    result_Code = ''

    if 'WPOSInformationTime' in data:
        result_Code = data['WPOSInformationTime']['RESULT']['CODE']

    if result_Code == 'INFO-000':
        #print(data['WPOSInformationTime']['row'][4]['W_TEMP'])
        newApiRequestTime = str(data['WPOSInformationTime']['row'][4]['MSR_TIME'])

        entityList = setEntity(data)
        for x in entityList:
                print(x)

        if beforeApiRequestTime != newApiRequestTime:
                beforeApiRequestTime = newApiRequestTime
                entityList = setEntity(data)
                dbcon.InsertHanRiverData(entityList)
    timer = threading.Timer(300, run)
    timer.start()


run()