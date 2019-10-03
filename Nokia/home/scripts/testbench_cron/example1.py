#! /usr/bin/python

import subprocess
import sys
import os
import time
from datetime import datetime
from datetime import date
print date.today()
#print date.isoformat()
now = datetime.now()
date_time = now.strftime("%m.%d.%Y")
print("date and time:",date_time)

print now.weekday()
ws_filename=""
ws_filename+="/tmp/"
ws_filename+="mg11s.Aug28"
ws_filename+=".tb.sim.stdout."
ws_filename+="ws."
ws_filename+=now.strftime("%m.%d.%Y")
ws_filename+=".txt"
print ws_filename

cmd=""
cmd+="rm -f "
cmd+=ws_filename
var = os.system(cmd);
print "os.sys o/p:", var



#myFile = open('append.txt', 'a')
#myFile.write('\nAccessed on ' + str(datetime.now()))

#log = open("/tmp/pyth_ls.txt", "w")
#cmd=""
#cmd+="ls"
#print "Cmd is ", cmd
#p=subprocess.Popen(cmd, shell=True, stdout=log, stderr=None)
#p.wait()

