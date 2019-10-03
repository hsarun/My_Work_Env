#! /usr/bin/python
import subprocess
import os
import datetime

base = '/home/arunsr/ws/'
#export MY_PROJECT=$HOME/ws
myhome = os.environ['HOME']
wsbase = myhome + "/ws/"

def update_workspace(br):
#    cmd = []
    now = datetime.datetime.now()
    cmd = ""
#    wp_path = base + br
    wp_path = wsbase + br
    print("wsbase is ", wsbase)
#    print("Home is ", os.environ['HOME'])

    panos = wp_path + "/panos/"
    print("Dir is ", panos)

    #cmd=""
    #cmd+="ls -ltr"
    #print("Cmd is ", cmd)
#    p=subprocess.Popen("ls -ltr", cwd=panos, shell=True)
#    p.wait()
#    cmd=""
#    cmd+="git show"
#    print("Cmd is ", cmd)
#    p=subprocess.Popen(cmd, cwd=panos, shell=True)

    cmd=""
    cmd+="git up"
    print("Cmd is ", cmd)
#    p=subprocess.Popen(cmd, cwd=panos, shell=True, stdout=None, stderr=None)
#    p.wait()

    vhdl=wp_path + "/vhdl"
    print("vhdl path", vhdl);
#    p=subprocess.Popen("ls -ltr", cwd=vhdl, shell=True)
    cmd=""
    #cmd+="bash -c \'source /home/arunsr/scripts/testbench_cron/run_vhdl.sh " + br + "\'"
    #cmd+="bash -c \'source /home/arunsr/scripts/testbench_cron/run_vhdl.sh " + br + wp_path + "\'"
    #cmd+="bash -c \'source /home/arunsr/scripts/testbench_cron/run_vhdl.sh " + br
    #cmd+="bash -c \'source /home/arunsr/scripts/testbench_cron/run_vhdl.sh "
    cmd+="bash -c \'source /home/arunsr/scripts/testbench_cron/run_vhdl.suite.sh "
    cmd+=" "
    cmd+="setup"
    cmd+=" "
    cmd+=br
    cmd+=" "
    #cmd+=wp_path + "\'"
    cmd+=wp_path
    cmd+=" "
    cmd+=now.isoformat()
    cmd+="\'"
    print("Cmd is ", cmd)
    #p=subprocess.Popen([cmd, br], shell=True, executable='/bin/bash')
    var = os.system(cmd);
    print "os.sys o/p:", var
    #p.wait()
    #p=subprocess.Popen("env|grep vhdl", stdout=subprocess.PIPE, shell=True)
    #p.wait()
    #print p.communicate()

    cmd=""
    cmd+="cvs up"
    print("Cmd is ", cmd)
    #p=subprocess.Popen(cmd, cwd=vhdl, shell=True, stdout=None, stderr=None)
    #p.wait()
    print("Cmd is Done ", cmd)

    cmd=""
    cmd+="bash -c \'source /home/arunsr/scripts/testbench_cron/run_vhdl.suite.sh "
    cmd+=" "
    cmd+="suite"
    cmd+=" "
    cmd+=br
    cmd+=" "
    #cmd+=wp_path + "\'"
    cmd+=wp_path
    cmd+=" "
    cmd+=now.isoformat()
    cmd+="\'"
    print("Cmd is ", cmd)
    #p=subprocess.Popen([cmd, br], shell=True, executable='/bin/bash')
    var = os.system(cmd);
    print "os.sys o/p:", var

update_workspace("mg11f")
