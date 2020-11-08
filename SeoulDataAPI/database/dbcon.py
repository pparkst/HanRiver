from MySQLdb import _mysql

db = _mysql.connect("", "", "", "")
cur = db.cursor()
cur.execute("SELECT sysdate()")
res = cur.fetchall()
print(res)
