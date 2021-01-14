#from MySQLdb import _mysql
#db = _mysql.connect(host="", port=, user="", passwd="", db="")
import colorama
from colorama import Fore, Style
import datetime
import MySQLdb

RDS_HOST = ""
RDS_USER = "sa"
RDS_PASSWD = ""
RDS_PORT = 

def dbConn(schema):
    db = MySQLdb.connect(host=RDS_HOST, port=RDS_PORT, user=RDS_USER, passwd=RDS_PASSWD, db=schema, charset='utf8')
    return db

def InsertHanRiverData(entityList):
    try:
        db = dbConn("pparkst_db")
        cur = db.cursor()
        
        table = "tbl_hanRiverInfo"
        columns = ",". join(entityList[0].keys())
        query = "INSERT INTO %s (%s) VALUES %s " % (table, columns, '(%s, %s, %s, %s)')
        value = [tuple(_ for _ in entity.values()) for entity in entityList]

        cur.executemany(query, value)
        db.commit()
    except Exception as e:
        print(Fore.RED, "INSERT DATA ERROR")
        print(e)
        print(Style.RESET_ALL)
    finally:
        print(Fore.GREEN, "INSERT DATA : _" + datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'))
        print(Style.RESET_ALL)
        db.close()
