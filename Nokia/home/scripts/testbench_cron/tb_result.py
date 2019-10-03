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


def compare_f(filepath_result, filepath_compare):
   result = 0
   words = {}
   fr = open(filepath_result)
   fc = open(filepath_compare)

   line_r = fr.readline()
   line_c = fc.readline()

   while line_r != '' or line_c != '':
       word_r = line_r.split()
       word_c = line_c.split()
       for i in range(0,4,1):
           if i < len(word_r) and i < len(word_c):
                #print( "comparing {0} and {1}".format(word_r[i], word_c[i]))
                if word_r[i] != word_c[i] :
                   result = 1
       line_r = fr.readline()
       line_c = fc.readline()
   
   fr.close()
   fc.close()
   return result 
       

def main(): 
   result = 0 
   filepath_result = sys.argv[1]
   filepath_compare = sys.argv[2]

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

   #if result == 1:
   #    print("COMPARE FAILED") 
   #else :
   #    print("COMPARE SUCCESSFUL") 

   result = compare_l(filepath_result, filepath_compare)

   if result == 1:
       print("COMPARE FAILED") 
   else :
       print("COMPARE SUCCESSFUL") 


if __name__ == '__main__':  
   main()
