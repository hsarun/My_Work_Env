#!/bin/bash

#source ~/.bashrc.local
source /etc/profile.d/owner.sh

simout=/tmp/mg11f.Aug28.tb.sim.stdout.prev.txt
simout1=/tmp/mg11f.Aug28.tb.sim.stdout.prev-1.txt
simattach=/tmp/mg11f.Aug28.tb.sim.stdout.09.20.2019.txt
simattach1=/tmp/mg11f.Aug28.tb.sim.stdout.09.20.2019-1.txt
subject="Test Attach from shell"
#cat $simout | mailx -s $subject  arun.srinivasa@nokia.com
#mailx -s $subject arun.srinivasa@nokia.com < /dev/null
#mailx -s $subject -a $simattach arun.srinivasa@nokia.com < /dev/null
#cat $simout | mailx -s $subject -a $simattach arun.srinivasa@nokia.com
echo "OWNER_EMAIL is"
echo $OWNER_EMAIL
email_body="Legacy: \r\nIn Subject:\nPASS: No change with Previous Run\n"
echo -e $email_body

#echo `env`

if [ -e $simout1 ] && [ -e $simattach1 ]
then
    echo "simout is $simout & simattach is $simattach"
elif [ -e $simout1 ]
then
    echo "simout is $simout"
else
    echo "simout is None"
fi
#echo "Test in Body - 2 attaches" | mailx -s "$subject" -a $simattach -a $simout arun.srinivasa@nokia.com
#echo "Test in Body - 2 attaches using OWNER_EMAIL" | mailx -s "$subject" -a $simattach -a $simout $OWNER_EMAIL
#echo -e $email_body | mailx -s "$subject" -a $simattach -a $simout $OWNER_EMAIL
#mailx -s "$subject" -a $simattach -a $simout $OWNER_EMAIL < /dev/null
#echo " " | mailx -s "$subject" -a $simattach -a $simout $OWNER_EMAIL
#attachfiles="-a $simattach -a $simout"
attachfiles=""
if [ -e $simout ]
then
    attachfiles="-a $simout "
fi
if [ -e $simattach1 ]
then
    attachfiles+="-a $simattach "
fi

#echo " " | mailx -s "$subject" $attachfiles $OWNER_EMAIL
#echo " " | mailx -s "$subject" $OWNER_EMAIL


redirect=""
#echo "can i redirect using dollar?" > $redirect
redirect=/dev/stdout
echo "can i redirect using dollar?" >> $redirect
redirect=/tmp/redirect.txt
echo "can i redirect using dollar?" >> $redirect

