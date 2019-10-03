#!/bin/bash

shopt -s expand_aliases
source ~/.bashrc.local
echo "Parameter Number is: "
echo $#
if [ $# -ne 4 ]; then
    echo "Format is $(basename $BASH_SOURCE) {setup|suite} testbench-base-dir path last-part-of-file"
    exit 1;
fi;

echo "Parameter is: "
echo $1
echo $2
echo $3
echo $4
vhdl $2

if [ "$1" == "setup" ]; then
    # Just setup... Dont run the suite/mail...
    exit
fi;

simout=$3/tb.sim.stdout.$4.txt
simerr=$3/tb.sim.stderr.$4.txt

csimout=$3/tb.csim.stdout.$4.txt
csimerr=$3/tb.csim.stderr.$4.txt
midsimout=$3/tb.midsim.stdout.$4.txt
midsimerr=$3/tb.midsim.stderr.$4.txt

echo "sim parameter is: "
echo $simout
echo $simerr
echo "csim parameter is: "
echo $csimout
echo $csimerr
echo "midsim parameter is: "
echo $midsimout
echo $midsimerr

#Testing.. Remove Below lines later
ls -ltr $3 > $csimout
ls -ltr $3 > $midsimout

echo "Command is run_suite csim"
#run_suite csim > $csimout 2> $csimerr
echo "Command run_suite csim is Done"

echo "Command is run_suite midsim"
#run_suite midsim > $midsimout 2> $midsimerr
echo "Command run_suite midsim is Done"

#cat /home/arunsr/ws/mg11f/midsim.stdout.2019-07-09T14:58:07.332758.txt | mailx -s "Subject Here"  arun.srinivasa@nokia.com
#cat $midsimout | mailx -s "Subject Here"  arun.srinivasa@nokia.com
cat $csimout > $simout
echo "" >> $simout
cat $midsimout >> $simout
echo "" >> $simout
#cat $simout | mailx -s "Subject Here"  arun.srinivasa@nokia.com
subject="TestBenchResult_$2"
cat $simout | mailx -s $subject  arun.srinivasa@nokia.com

