#! /usr/bin/python
import subprocess
import sys
import os
import time
import datetime
from datetime import date
from datetime import datetime

base = '/home/arunsr/ws/'
#export MY_PROJECT=$HOME/ws
myhome = os.environ['HOME']
wsbase = myhome + "/ws/"
now = datetime.now()

def compare_f(filepath_result, filepath_compare, filepath_diff, fws, is_cron):
   result = 0
   no_lines = 0
   no_words = 0
   words = {}
   fr = open(filepath_result)
   fc = open(filepath_compare)

   line_r = fr.readline()
   line_c = fc.readline()
   diff_file_open = 0

   while line_r != '' or line_c != '':
       word_r = line_r.split()
       word_c = line_c.split()
       no_lines=no_lines+1
       for i in range(0,4,1):
           if i < len(word_r) and i < len(word_c):
                #print( "comparing {0} and {1}".format(word_r[i], word_c[i]))
                #Skip comparing following lines:
                #PANOS Git hash:
                #Current time:
                #Elapsed time:
                if i == 0:
                    if (word_r[i] == "PANOS" and word_r[i+1] == "Git"):
                        break;

                if i == 0:
                    if (word_r[i] == "Current" and word_r[i+1] == "time:"):
                        break;

                if i == 0:
                    if (word_r[i] == "Elapsed" and word_r[i+1] == "time:"):
                        break;

                no_words=no_words+1
                if word_r[i] != word_c[i] :
                   result = 1
                   #print( "comparing diff {0} and {1}".format(word_r[i], word_c[i]))
                   if diff_file_open == 0:
                       diff_file_open = 1
                       fw = open(filepath_diff, 'w')
                   fw.write("<\n")
                   fw.write(line_r);
                   fw.write(">\n")
                   fw.write(line_c);

       line_r = fr.readline()
       line_c = fc.readline()

   if is_cron == "is_cron":
        print >> fws, "No. of lines compared: ", no_lines
        print >> fws, "No. of words compared: ", no_words
   else:
        print "No. of lines compared: ", no_lines
        print "No. of words compared: ", no_words

   fr.close()
   fc.close()
   if diff_file_open == 1:
       fw.close()

   return result

def create_cmd(br, param, wp_path, res, fws, is_cron):
    cmd=""
    #cmd+="bash -c \'source /home/arunsr/scripts/testbench_cron/run_vhdl.suite.sh "
    cmd+="bash -c \'source "
    cmd+=myhome
    cmd+="/scripts/testbench_cron/run_vhdl.suite.sh"
    cmd+=" "
    cmd+=param
    cmd+=" "
    cmd+=br
    cmd+=" "
    cmd+=wp_path
    cmd+=" "
    cmd+=now.strftime("%m.%d.%Y")
    cmd+=" "
    cmd+=res
    cmd+=" "
    cmd+=is_cron
    cmd+="\'"

    if is_cron == "is_cron":
        print >> fws, "Cmd is ", cmd
    else:
        print "Cmd is ", cmd

    return cmd


def update_panos_workspace(br, wp_path, fws, is_cron):
    #now = datetime.datetime.now()
    cmd = ""
    #print("wsbase is ", wsbase)

    panos = wp_path + "/panos/"
    #print("Dir is ", panos)

    cmd=""
    cmd+="git up"
    if is_cron == "is_cron":
        print >> fws, "Cmd is ", cmd
    else:
        print "Cmd is ", cmd
    #p=subprocess.Popen(cmd, cwd=panos, shell=True, stdout=None, stderr=None)
    p=subprocess.Popen(cmd, cwd=panos, shell=True, stdout=fws, stderr=fws)
    p.wait()
    if is_cron == "is_cron":
        print >> fws, "Cmd done is ", cmd
    else:
        print "Cmd done is ", cmd


def update_vhdl_workspace(br, wp_path, fws, is_cron):

    vhdl=wp_path + "/vhdl"
    #print "vhdl path", vhdl

    cmd=""
    cmd+="cvs up"
    if is_cron == "is_cron":
        print >> fws, "Cmd is ", cmd
    else:
        print "Cmd is ", cmd
    #p=subprocess.Popen(cmd, cwd=vhdl, shell=True, stdout=None, stderr=None)
    p=subprocess.Popen(cmd, cwd=vhdl, shell=True, stdout=fws, stderr=fws)
    p.wait()
    if is_cron == "is_cron":
        print >> fws, "Cmd done is ", cmd
    else:
        print "Cmd done is ", cmd


def run_vhdl_bash_script(br, wp_path, fws, is_cron):

    res="pass"
    var=0
    cmd = create_cmd(br, "suite", wp_path, res, fws, is_cron)
    var = os.system(cmd);
    if is_cron == "is_cron":
        print >> fws, "os.sys o/p:", var
    else:
        print "os.sys o/p:", var

    #Compare...
    param1=""
    param1+="/tmp/"
    param1+=br
    param1+=".tb.sim.stdout."
    param1+=now.strftime("%m.%d.%Y")
    param1+=".txt"
    param2=""
    param2+="/tmp/"
    param2+=br
    param2+=".tb.sim.stdout.prev.txt"
    param3=""
    param3+="/tmp/"
    param3+=br
    param3+=".tb.sim.stdout.diff.txt"
    filepath_result=param1
    filepath_compare=param2
    filepath_diff=param3

    do_compare=1
    result=0

    if is_cron == "is_cron":
        print >> fws, filepath_result
        print >> fws, filepath_compare
        print >> fws, filepath_diff

        if not os.path.isfile(filepath_result):
            print >> fws, ("File path {0} does not exist. ...".format(filepath_result))
            do_compare=0

        if not os.path.isfile(filepath_compare):
            print >> fws, ("File path {0} does not exist. ...".format(filepath_compare))
            do_compare=0

    else:
        print filepath_result
        print filepath_compare
        print filepath_diff

        if not os.path.isfile(filepath_result):
            print("File path {0} does not exist. ...".format(filepath_result))
            do_compare=0

        if not os.path.isfile(filepath_compare):
            print("File path {0} does not exist. ...".format(filepath_compare))
            do_compare=0

    if do_compare == 1:
        result = compare_f(filepath_result, filepath_compare, filepath_diff, fws, is_cron)
        if result == 1:
            res="FAIL"
            if is_cron == "is_cron":
                print >> fws, ("COMPARE FAILED")
            else:
                print("COMPARE FAILED")
        else:
            res="PASS"
            if is_cron == "is_cron":
                print >> fws, ("COMPARE SUCCESSFUL")
            else:
                print("COMPARE SUCCESSFUL")


    cmd = create_cmd(br, "sendMail", wp_path, res, fws, is_cron)
    var = os.system(cmd);
    if is_cron == "is_cron":
        print >> fws, "os.sys o/p:", var
    else:
        print "os.sys o/p:", var


def run_testbench(br, wp_path, is_cron):
    ws_filename=""
    ws_filename+="/tmp/"
    ws_filename+=br
    ws_filename+=".tb.sim.stdout."
    ws_filename+="ws."
    ws_filename+=now.strftime("%m.%d.%Y")
    ws_filename+=".txt"
    fws=open(ws_filename,"w")
    update_panos_workspace(br, wp_path, fws, is_cron)

    #Update CVS only on Friday Night...
    if now.weekday() == 5:
        update_vhdl_workspace(br, wp_path, fws, is_cron)

    run_vhdl_bash_script(br, wp_path, fws, is_cron)
    fws.close()
    cmd=""
    cmd+="rm -f "
    cmd+=ws_filename
    var = os.system(cmd);


def execute_testbench(br, is_cron):
    wp_path = wsbase + br
    run_testbench(br, wp_path, is_cron)

#execute_testbench("mg11f.Aug28")

def main():
    arguments = len(sys.argv) - 1
    if (arguments < 2):
        print("Usage: {0} {{is_cron|is_not_cron}} <workspace-name> [<workspace-name>...]".format(sys.argv[0]))
        return 0

    is_cron = sys.argv[1]
    i = 2
    while i <= arguments:
        br = sys.argv[i]
        execute_testbench(br, is_cron)
        i+=1

    return 0


if __name__ == '__main__':
    main()

