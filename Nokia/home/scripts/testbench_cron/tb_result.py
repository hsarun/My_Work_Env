#! /usr/bin/python
import sys  
import os
import datetime

#def init():


def compare_l(filepath_result, filepath_compare):
   result = 0
   words = {}
   fr = open(filepath_result, "r")
   fc = open(filepath_compare, "r")

   print("fr:")
   line_r = fr.readlines()
   fr.close()
   #print line_r
   print "The last line is:"
   #print line_r[len(line_r)-1]
   word_r = line_r[len(line_r)-1]
   print word_r
   # or simply
   #print line_r[-1]

   print("fc:")
   line_c = fc.readlines()
   fc.close()
   #print line_c
   print "The last line is:"
   #print line_c[len(line_c)-1]
   word_c = line_c[len(line_c)-1]
   print word_c
   # or simply
   #print line_c[-1]

   if word_r != word_c :
       result = 1

   return result 


def compare_f_s(filepath_result, filepath_compare):
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
       skip_compare = 0
       no_lines=no_lines+1
       for i in range(0,4,1):
           if i < len(word_r) and i < len(word_c):
                #print( "comparing {0} and {1}".format(word_r[i], word_c[i]))
                #Skip comparing following lines:
                #PANOS Git hash:
                #Current time:
                #Elapsed time:
                #if i == 0:
                #    if (word_r[i] == "PANOS" and word_r[i+1] == "Git"):
                #        break;

                if i == 0:
                    if (word_r[i] == "Current" and word_r[i+1] == "time:"):
                        break;

                if i == 0:
                    if (word_r[i] == "Elapsed" and word_r[i+1] == "time:"):
                        break;

                no_words=no_words+1
                if word_r[i] != word_c[i] :
                    result = 1
                    if diff_file_open == 0:
                        diff_file_open = 1
                        fw = open("/tmp/diff.txt", 'w')
                    fw.write("<\n")
                    fw.write(line_r);
                    fw.write(">\n")
                    fw.write(line_c);
                    print( "comparing {0} and {1}".format(word_r[i], word_c[i]))

       line_r = fr.readline()
       line_c = fc.readline()

   print "No. of lines compared: ", no_lines
   print "No. of words compared: ", no_words
   fr.close()
   fc.close()
   if diff_file_open == 1:
       fw.close()

   return result


def compare_f(filepath_result, filepath_compare):
   result = 0
   no_lines = 0
   no_words = 0
   words = {}
   fr = open(filepath_result)
   fc = open(filepath_compare)

   line_r = fr.readline()
   line_c = fc.readline()

   while line_r != '' or line_c != '':
       print( "comparing line {0} and {1}".format(line_r, line_c))
       no_lines=no_lines+1
       word_r = line_r.split()
       word_c = line_c.split()
       for i in range(0,4,1):
           if i < len(word_r) and i < len(word_c):
                #print( "comparing {0} and {1}".format(word_r[i], word_c[i]))
                no_words=no_words+1
                if word_r[i] != word_c[i] :
                   result = 1
                   print( "comparing diff {0} and {1}".format(word_r[i], word_c[i]))

       line_r = fr.readline()
       line_c = fc.readline()
   
   fr.close()
   fc.close()
   print "No. of lines compared: ", no_lines
   print "No. of words compared: ", no_words
   return result 
       

def main(): 
   result = 0 
   filepath_result = sys.argv[1]
   filepath_compare = sys.argv[2]
   arguments = len(sys.argv) - 1
   print ("the script is called with %i arguments" % (arguments))

   if not os.path.isfile(filepath_result):
       print("File path {0} does not exist. Exiting...".format(filepath_result))
       sys.exit()
   if not os.path.isfile(filepath_compare):
       print("File path {0} does not exist. Exiting...".format(filepath_compare))
       sys.exit()

   now = datetime.datetime.now()
   print
   print "Current date and time using str method of datetime object:"
   print str(now)
   day=""
   day+=now.isoformat()
   print("day is ", day);

   #result = compare_f(filepath_result, filepath_compare)
   result = compare_f_s(filepath_result, filepath_compare)

   if result == 1:
       print("COMPARE FAILED") 
   else :
       print("COMPARE SUCCESSFUL") 

   #result = compare_l(filepath_result, filepath_compare)

   #if result == 1:
   #    print("COMPARE FAILED") 
   #else :
   #    print("COMPARE SUCCESSFUL") 

   return result


if __name__ == '__main__':  
   main()
