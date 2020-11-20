#from MySQLdb import _mysql
#db = _mysql.connect(host="", port=, user="", passwd="", db="")
import MySQLdb

RDS_HOST = "r"
RDS_USER = ""
RDS_PASSWD = ""
RDS_PORT = 

def dbConn(schema):
    db = MySQLdb.connect(host=RDS_HOST, port=RDS_PORT, user=RDS_USER, passwd=RDS_PASSWD, db=schema, charset='utf8')
    return db

def InsertHanRiverData(dataDic):
    try:
        db = dbConn("pparkst_db")

        cur = db.cursor()
        table = "tbl_hanRiverInfo"
        columns = ",". join(dataDic.keys())
        placeHolders = ",".join(str(_[1]) for _ in dataDic.items())
        query = "INSERT INTO %s (%s) VALUES (%s)" % (table, columns, placeHolders)
        cur.execute(query)
        db.commit()
    finally:
        print("!INSERT DATA!")
        db.close()
