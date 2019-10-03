#!/bin/bash

shopt -s expand_aliases
source ~/.bashrc.local
echo "Parameter is: "
echo $1
echo $2
echo $3
echo $4
vhdl $2

#alias

#run_suite csim

#sh np3chip

#sh gop -e pumice_msm_ingress
#echo "Aliases are"
#alias | grep np3chip

#simout=$2/sim.stdout.$3.txt
#simerr=$2/sim.stderr.$3.txt

#csimout=$2/csim.stdout.$3.txt
#csimerr=$2/csim.stderr.$3.txt
#midsimout=$2/midsim.stdout.$3.txt
#midsimerr=$2/midsim.stderr.$3.txt

#echo "sim parameter is: "
#echo $simout
#echo $simerr
#echo "csim parameter is: "
#echo $csimout
#echo $csimerr
#echo "midsim parameter is: "
#echo $midsimout
#echo $midsimerr

#run_suite_test
#run_suite csim
#run_suite midsim

#Testing.. Remove Below lines later
#ls -ltr $2 > $csimout
#ls -ltr $2 > $midsimout

#echo "Command is run_suite csim"
#run_suite csim > $csimout 2> $csimerr
#echo "Command run_suite csim is Done"

#echo "Command is run_suite midsim"
#run_suite midsim > $midsimout 2> $midsimerr
#echo "Command run_suite midsim is Done"

#cat /home/arunsr/ws/mg11f/midsim.stdout.2019-07-09T14:58:07.332758.txt | mailx -s "Subject Here"  arun.srinivasa@nokia.com
#cat $midsimout | mailx -s "Subject Here"  arun.srinivasa@nokia.com
#cat $csimout > $simout
#echo "" >> $simout
#cat $midsimout >> $simout
#echo "" >> $simout
#cat $simout | mailx -s "Subject Here"  arun.srinivasa@nokia.com
#subject="TestBenchResult_$1"
#cat $simout | mailx -s $subject  arun.srinivasa@nokia.com

