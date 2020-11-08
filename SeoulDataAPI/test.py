import datetime
import threading

def fun_a():
    timer = threading.Timer(60, test)
    timer.start()

def test():
    while(True):

        now = datetime.datetime.now()
        date = now.strftime('%Y%m%d')

        nowTime = now.strftime('%M')
        nowTime2 = now.strftime('%S')

        print(date)
        print(nowTime)
        print(nowTime2)
        if nowTime == '56' or nowTime == '00':
            break

fun_a()
