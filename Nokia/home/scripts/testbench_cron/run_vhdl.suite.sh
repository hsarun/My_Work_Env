#!/bin/bash

#echo "Parameter Number is: "
#echo $#
if [ $# -ne 6 ]; then
    echo "Format is $(basename $BASH_SOURCE) {suite|sendMail} testbench-base-dir path last-part-of-file result is_cron"
    exit 1;
fi;

shopt -s expand_aliases
source ~/.bashrc.local
if [ -e /etc/profile.d/owner.sh ]
then
    source /etc/profile.d/owner.sh
fi
vhdl $2 > /dev/null

if [ $6 == "is_cron" ]; then
    redirect=$simwsfile
else
    redirect=/dev/stdout
fi;

simout=/tmp/$2.tb.sim.stdout.$4.txt
simerr=/tmp/$2.tb.sim.stderr.$4.txt
simprev=/tmp/$2.tb.sim.stdout.prev.txt
simdiff=/tmp/$2.tb.sim.stdout.diff.txt
simwsfile=/tmp/$2.tb.sim.stdout.ws.$4.txt

csimout=/tmp/$2.tb.csim.stdout.$4.txt
csimerr=/tmp/$2.tb.csim.stderr.$4.txt
midsimout=/tmp/$2.tb.midsim.stdout.$4.txt
midsimerr=/tmp/$2.tb.midsim.stderr.$4.txt

echo "Parameter is: " >> $redirect
echo $1 >> $redirect
echo $2 >> $redirect
echo $3 >> $redirect
echo $4 >> $redirect
echo $5 >> $redirect

echo "sim parameter is: " >> $redirect
echo $simout >> $redirect
echo $simerr >> $redirect
echo $simdiff >> $redirect
echo $simwsfile >> $redirect
echo "csim parameter is: " >> $redirect
echo $csimout >> $redirect
echo $csimerr >> $redirect
echo "midsim parameter is: " >> $redirect
echo $midsimout >> $redirect
echo $midsimerr >> $redirect

if [ "$1" == "suite" ]; then

    #Testing.. Remove Below lines later
    #ls -ltr $3 > $csimout
    #ls -ltr $3 > $midsimout

    echo "Command is run_suite csim" >> $redirect
    run_suite csim > $csimout 2> $csimerr
    echo "Command run_suite csim is Done" >> $redirect

    echo "Command is run_suite midsim" >> $redirect
    run_suite midsim > $midsimout 2> $midsimerr
    echo "Command run_suite midsim is Done" >> $redirect

    cat $csimout > $simout
    echo "" >> $simout
    cat $midsimout >> $simout
    echo "" >> $simout
fi;


if [ "$1" == "sendMail" ]; then
    #sendMail.. Send the Mail with attachments and Cleanup...

    subject="TestBenchResult_$2---$5"
    email_body="Legacy: \r\nIn Subject:\nPASS: No change with Previous Run\n"
    echo "OWNER_EMAIL is $OWNER_EMAIL" >> $redirect
    attachfiles=""

    if [ -e $simout ]
    then
        attachfiles+=" -a $simout "
    fi

    if [ -e $simprev ]
    then
        attachfiles+=" -a $simprev "
    fi

    if [ -e $simdiff ]
    then
        attachfiles+=" -a $simdiff "
    fi

    if [ -e $simwsfile ]
    then
        attachfiles+=" -a $simwsfile "
    fi


    echo "attachfiles is $attachfiles" >> $redirect
    echo " " | mailx -s "$subject" $attachfiles $OWNER_EMAIL

    echo "mv -f $simout $simprev" >> $redirect
    mv -f $simout $simprev
    rm -f $csimout
    rm -f $csimerr
    rm -f $midsimout
    rm -f $midsimerr
    rm -f $simdiff

    exit 0
fi;

