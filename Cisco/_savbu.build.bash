#! /bin/sh
#tmp=`hostname | cut -b5-7`
#echo $tmp

#if [ $tmp == "xdm" ] || [ $tmp == "cde" ]
#then
    #echo "its xdm"
#    source /auto/savbu-releng/scm/acme/bin/.bashrc.build
#else
#    tmp=`hostname | cut -b1-6`
#    if [ $tmp == "nuo-sw" ] ; then
        #echo "its nuo"
#        source /auto/savbu-releng/scm/acme/bin/.bashrc.build
#    fi
#fi

#if [ $tmp == "cde" ]
#then
    #echo "its cde"
#    source /auto/savbu-releng/scm/acme/bin/.bashrc.build
#fi

#Build-Server Name: nuo-sw-build10;

date | grep IST > /dev/null; let US_SERV=$?;
if [ $US_SERV == 0 ]; then
    #echo India-server;
    #Create india specific aliases like the ones below if you need them;
    alias vi='vim -u NONE'
    export ACME_VIEW_SERVER=bgl-dcos-lnx01
    source /auto/andiamo/tools/etc/.bashrc.build
else
    #echo US-Server;
    alias vi='/usr/bin/vim -u /ws/arunhsri-sjc/.vimrc -i /ws/arunhsri-sjc/.viminfo --noplugin'
    source /auto/andatc/independent/shellrc-files/current/rc/.bashrc.build
fi

tmp=`hostname | cut -b1-6`
if [ $tmp == "nuo-sw" ] 
then
    #echo "its nuo"
    source /auto/savbu-releng/scm/acme/bin/.bashrc.build
    source /users/arunhsri/.savbu.alias.bash
fi

tmp=`hostname | cut -b1-8`
if [ $tmp == "savbu-sw" ] 
then
    source /auto/savbu-releng/scm/acme/bin/.bashrc.build
    source /users/arunhsri/.savbu.alias.bash
fi

tmp=`hostname | cut -b1-6`
if [ $tmp == "n3k-sw" ] 
then
    source /auto/savbu-releng/scm/acme/bin/.bashrc.build
    source /users/arunhsri/.savbu.alias.bash
    source /users/arunhsri/.insbu.build.bash
fi

tmp=`hostname | cut -b1-6`
if [ $tmp == "ins-sw" ] 
then
    source /auto/savbu-releng/scm/acme/bin/.bashrc.build
    source /users/arunhsri/.savbu.alias.bash
    source /users/arunhsri/.insbu.build.bash
fi


