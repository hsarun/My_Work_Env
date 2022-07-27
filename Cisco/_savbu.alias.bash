

export PATH=/ws/arunhsri-sjc/bin:$PATH
alias cscope='/ws/arunhsri-sjc/bin/cscope'
alias cdws='cd /ws/arunhsri-sjc'
alias dcos='source /auto/savbu-releng/scm/acme/bin/.bashrc.build'
alias commitpatches='/nfs/acmedata/sanos/'
alias sac=`screen -x arun-code`
alias sas=`screen -x arun-swt`

alias n3kimagingmake='gmake -j32 images/final/core_suplltor-imaging-only && gmake -j32 images/final/eth_suplltor-imaging-only && gmake -j32 images/final/n3000_uk9-imaging-only'
alias n3500imagingmake='gmake -j32 images/final/core_suplltormtc-imaging-only && gmake -j32 images/final/eth_suplltormtc-imaging-only && gmake -j32 images/final/n3500_uk9-imaging-only'


ws()
{
    export MYTREE=/ws/arunhsri-sjc/$1
}
alias setws='export MYTREE=`pwd`'
alias nosetws='export MYTREE=""'
alias cdb='cd ${MYTREE}/build'


export MYDBFHM="/auto/n5kfh/daily_build/fh_maint/oregon"
cdfhm() { cd /ws/arunhsri-sjc/fhm/$1; }
cdfhmdb() { cd /ws/arunhsri-sjc/fhmdb/$1; }
lnfhmdb() { cdfhmdb; ln -s  ${MYDBFHM}/$1/src $1; }

export MYDBFHT="/auto/n5kfh/daily_build/fh_throttle/oregon"
cdfht() { cd /ws/arunhsri-sjc/fht/$1; }
cdfhtdb() { cd /ws/arunhsri-sjc/fhtdb/$1; }
lnfhtdb() { cdfhtdb; ln -s  ${MYDBFHT}/$1/src $1; }

export MYDBFH="/auto/n5kfh/daily_build/fh/oregon"
cdfh() { cd /ws/arunhsri-sjc/fh/$1; }
cdfhdb() { cd /ws/arunhsri-sjc/fhdb/$1; }
lnfhdb() { cdfhdb; ln -s  ${MYDBFH}/$1/src $1; }

export MYDBZUOLD="/auto/n5keagle/daily_build/zulu/oregon"
export MYDBZU="/auto/n5kzulu/daily_build/zulu/nexus"
cdzu() { cd /ws/arunhsri-sjc/zu/$1; }
cdzudb() { cd /ws/arunhsri-sjc/zudb/$1; }
lnzudb() { cdzudb; ln -s  ${MYDBZU}/$1/src $1; }

export MYDBGC="/auto/n5kgoldcoast/daily_build/goldcoast/nexus/"
cdgc() { cd /ws/arunhsri-sjc/gc/$1; }
cdgcdb() { cd /ws/arunhsri-sjc/gcdb/$1; }
lngcdb() { cdgcdb; ln -s  ${MYDBGC}/$1/src $1; }

export MYDBER="/auto/n5kerocks/daily_build/erocks/oregon"
cder() { cd /ws/arunhsri-sjc/er/$1; }
cderdb() { cd /ws/arunhsri-sjc/erdb/$1; }
lnerdb() { cderdb; ln -s  ${MYDBER}/$1/src $1; }

export MYDBAN="/ws/sjc-nuoBuild02/daily_build/andaman/nexus-3000"
cdan() { cd /ws/arunhsri-sjc/an/$1; }
cdandb() { cd /ws/arunhsri-sjc/andb/$1; }
lnandb() { cdandb; ln -s  ${MYDBAN}/$1/src $1; }

export MYDBBA="/ws/sjc-nuo20/daily_build/bahamas/nexus-3000"
cdba() { cd /ws/arunhsri-sjc/ba/$1; }
cdbadb() { cd /ws/arunhsri-sjc/badb/$1; }
lnbadb() { cdbadb; ln -s  ${MYDBBA}/$1/src $1; }

export MYDBBAM="/auto/n5keagle/daily_build/bahamas_maint/nexus/"
cdbam() { cd /ws/arunhsri-sjc/bam/$1; }
cdbamdb() { cd /ws/arunhsri-sjc/bamdb/$1; }
lnbamdb() { cdbamdb; ln -s  ${MYDBBAM}/$1/src $1; }

export MYDBCA="/auto/n3kcayman/daily_build/cayman/nexus-3000/"
cdca() { cd /ws/arunhsri-sjc/ca/$1; }
cdcadb() { cd /ws/arunhsri-sjc/cadb/$1; }
lncadb() { cdcadb; ln -s  ${MYDBCA}/$1/src $1; }

export MYDBCAM="/auto/n3kcayman/daily_build/cayman_maint_patch/nexus/"
cdcam() { cd /ws/arunhsri-sjc/cam/$1; }
cdcamdb() { cd /ws/arunhsri-sjc/camdb/$1; }
lncamdb() { cdcamdb; ln -s  ${MYDBCAM}/$1/src $1; }

export MYDBCAT="/auto/n3kcayman/daily_build/cayman_throttle/nexus/"
cdcat() { cd /ws/arunhsri-sjc/cat/$1; }
cdcatdb() { cd /ws/arunhsri-sjc/catdb/$1; }
lncatdb() { cdcatdb; ln -s  ${MYDBCAT}/$1/src $1; }

export MYDBCP="/auto/n3kcaymanplus/daily_build/cayman_plus/nexus/"
cdcpt() { cd /ws/arunhsri-sjc/cpt/$1; }
cdcptdb() { cd /ws/arunhsri-sjc/cptdb/$1; }
lncptdb() { cdcptdb; ln -s  ${MYDBCP}/$1/src $1; }

export MYDBCU="/auto/n3kculebra/daily_build/culebra/nexus"
cdcul() { cd /ws/arunhsri-sjc/cul/$1; }
cdculdb() { cd /ws/arunhsri-sjc/culdb/$1; }
lnculdb() { cdculdb; ln -s  ${MYDBCU}/$1/src $1; }

export MYDBED="/auto/n3keden/daily_build/eden/nexus/"
cdedn() { cd /ws/arunhsri-sjc/edn/$1; }
cdedndb() { cd /ws/arunhsri-sjc/edndb/$1; }
lnedndb() { cdedndb; ln -s  ${MYDBED}/$1/src $1; }

export MYDBEDP="/auto/n3kedenplus/daily_build/eden_plus/nexus/"
cdednp() { cd /ws/arunhsri-sjc/ednp/$1; }
cdednpdb() { cd /ws/arunhsri-sjc/ednpdb/$1; }
lnednpdb() { cdedndb; ln -s  ${MYDBEDP}/$1/src $1; }

export MYDBEG="/auto/n3keagleinteg/daily_build/eagle_integ/nexus/"
cdegl() { cd /ws/arunhsri-sjc/egl/$1; }
cdegldb() { cd /ws/arunhsri-sjc/egldb/$1; }
lnegldb() { cdedndb; ln -s  ${MYDBEG}/$1/src $1; }

#export MYDBEDFCS="/auto/n3keden/daily_build/eden_fcs_trident/nexus/"
#cdedfcs() { cd /ws/arunhsri-sjc/esfcs/$1; }
#cdedfcsdb() { cd /ws/arunhsri-sjc/edfcsdb/$1; }
#lnedfcsldb() { cdedfcsdb; ln -s  ${MYDBEDFCS}/$1/src $1; }

export MYDBEDFCS="/auto/n3kedenfcstrident/daily_build/eden_fcs_trident/nexus/"
cdedfcs() { cd /ws/arunhsri-sjc/esfcs/$1; }
cdedfcsdb() { cd /ws/arunhsri-sjc/edfcsdb/$1; }
lnedfcsldb() { cdedfcsdb; ln -s  ${MYDBEDFCS}/$1/src $1; }

export MYDBEDMNT="/auto/n3kedenfcstrident/daily_build/eden_fcs_trident_patch/nexus/"
cdedmnt() { cd /ws/arunhsri-sjc/edmnt/$1; }
cdedmntdb() { cd /ws/arunhsri-sjc/edmntdb/$1; }
lnedmntldb() { cdedmntdb; ln -s  ${MYDBEDMNT}/$1/src $1; }

export MYDBEDP="/auto/n3kedenplus/daily_build/eden_plus/nexus/"
cdedp() { cd /ws/arunhsri-sjc/edp/$1; }
cdedpdb() { cd /ws/arunhsri-sjc/edp/$1; }
lnedpdb() { cdedpdb; ln -s  ${MYDBEDP}/$1/src $1; }

export MYDBNPT="/auto/n3kfb64bit/daily_build/nep_cr/nexus/"
export MYDBGOA="/auto/n3kfijimsft/daily_build/goa_dev/nexus/"

export MYDBEDMTC="/auto/n3kedenfcsmtc/daily_build/eden_fcs_mtc/nexus/"
cdedmtc() { cd /ws/arunhsri-sjc/edmtc/$1; }
cdedmtcdb() { cd /ws/arunhsri-sjc/edmtc/$1; }
lnedmtcdb() { cdedmtcdb; ln -s  ${MYDBEDMTC}/$1/src $1; }

export MYDBFJ2="/auto/n3kedenplus/daily_build/fiji_eft2/nexus/"
export MYDBFP="/auto/n3kfijiecats/daily_build/fijiplus_cco/nexus/"
export MYDBFJVX="/auto/n3kfijimsft/daily_build/fiji_vxlan/nexus"
export MYDBGCCO="/auto/n3kfijiecats/daily_build/goa_cco/nexus/"
export MYDBFBMPLS="/auto/n3kgoadev/daily_build/fb_mpls/nexus/"
export MYDBFBMPLSIPV6="/auto/n3kfijicco/daily_build/ipv6_fb_mpls/nexus/"
export MYDBHW="/auto/n3kcolva/daily_build/hawaii_cco/nexus/"
export MYDBMTCCR="/auto/n3kmtccr/daily_build/mtc_cr/nexus/"


export MYDBN3KCMDN="/auto/Insieme-EOR2/release/n3k_camden/nexus/"
export MYDBCMDN3K="/auto/Insieme-EOR2/release/camden_3k/nexus/"
export MYDBASHFLD1121="/auto/Insieme-EOR2/release/ashfield_1121/nexus"
export MYDBBRONTE="/auto/Insieme-EOR8/release//bronte/nexus/"
export MYDBBRONTEPLUS="/auto/Insieme-EOR7/release//bronteplus/nexus/"
export MYDBCAMDEN="/auto/Insieme-EOR3/release/camden/nexus/"
export MYDBCMDN_3K="/auto/Insieme-EOR4/release//camden_n3k/nexus/"


gmer() { cdb; gmake IMAGE_BASE=n5000_uk9 LBLDGRP=supnuovaor x86s/gdb/$1/$2; }
alias gmerik='cdb;gmake -j32 images/gdb/n5000_uk9_kickstart'
alias gmeris='cdb;gmake -j64 images/gdb/n5000_uk9'
alias gmeriso='cdb;gmake -j8 images/gdb/n5000_uk9-imaging-only'
alias gmerieo='cdb;gmake -j8 images/gdb/eth_supnuovaor-imaging-only'
alias gmerico='cdb;gmake -j8 images/gdb/core_supnuovaor-imaging-only'

gmerf()
{
    cdb;
    gmake -j8 IMAGE_BASE=n5000_uk9 LBLDGRP=supnuovaor x86s/final/$1/$2
}
alias gmerfik='cdb;gmake images/final/n5000_uk9_kickstart'
alias gmerfis='cdb;gmake images/final/n5000_uk9'
alias gmerfiso='cdb;gmake -j8 images/final/n5000_uk9-imaging-only'
alias gmerfieo='cdb;gmake -j8 images/final/eth_supnuovaor-imaging-only'
alias gmerfico='cdb;gmake -j8 images/final/core_supnuovaor-imaging-only'

gman()
{
    cdb;
    gmake -j8 LBLDGRP=suplltor x86s/gdb/$1/$2
}
alias gmanik='cdb;gmake images/gdb/n3000_uk9_kickstart'
alias gmanis='cdb;gmake images/gdb/n3000_uk9'
alias gmaniso='cdb;gmake -j8 images/gdb/n3000_uk9-imaging-only'
alias gmanieo='cdb;gmake -j8 images/gdb/eth_suplltor-imaging-only'
alias gmanico='cdb;gmake -j8 images/gdb/core_suplltor-imaging-only'

gmanf()
{
    cdb;
    gmake -j8 LBLDGRP=suplltor x86s/final/$1/$2
}
alias gmanfik='cdb;gmake images/final/n3000_uk9_kickstart'
alias gmanfis='cdb;gmake images/final/n3000_uk9'
alias gmanfiso='cdb;gmake -j32 images/final/n3000_uk9-imaging-only'
alias gmanfieo='cdb;gmake -j32 images/final/eth_suplltor-imaging-only'
alias gmanfico='cdb;gmake -j32 images/final/core_suplltor-imaging-only'

alias gmn3kfik='cdb;gmake images/final/n3000_uk9_kickstart'
alias gmn3kfis='cdb;gmake images/final/n3000_uk9'
alias gmn3kfiso='cdb;gmake -j32 images/final/n3000_uk9-imaging-only'
alias gmn3kfieo='cdb;gmake -j32 images/final/eth_suplltor-imaging-only'
alias gmn3kfico='cdb;gmake -j32 images/final/core_suplltor-imaging-only'

alias gmn3kfsec0='gmake -j32 images/final/n3000_uk9-imaging-only && gmake -j32 images/final/eth_suplltor-imaging-only && gmake -j32 images/final/core_suplltor-imaging-only'
alias gmn3kgsec0='gmake -j32 images/gdb/n3000_uk9-imaging-only && gmake -j32 images/gdb/eth_suplltor-imaging-only && gmake -j32 images/gdb/core_suplltor-imaging-only'
alias imaging="gmake -j32 images/final/core_suplltor-imaging-only && gmake -j32 images/final/eth_suplltor-imaging-only && gmake -j32 images/final/n3000_uk9-imaging-only"


ngdban()
{
    gdb-x86 ${MYTREE}/build/gdblinks/gdb_n3000_uk9 $*
}

ngdber()
{
    gdb-x86 ${MYTREE}/build/gdblinks/gdb_n5000_uk9 $*
}

wgdber()
{
    gdb-x86-wrl ${MYTREE}/build/gdblinks/gdb_n5000_uk9 $*
}

ntgdb()
{
    gdb-x86 ${MYTREE}/build/gdblinks/gdb_n5000_uk9  ${MYTREE}/build/x86s/gdb/netstack/sup/netstack $*
}

ulsgc()
{
    cd ${MYTREE}/build/images/gdb
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/gc/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b fh -t quick_sanity -baseline fh.latest -n5boot $1 -n5isan $2 -fex fex.bin -fexth fexth.bin | tee -a ${tmp_file_path}
}

ulsgcf()
{
    cd ${MYTREE}/build/images/final
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/gc/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b fh -t quick_sanity -baseline fh.latest -n5boot $1 -n5isan $2 -fex fex.bin -fexth fexth.bin | tee -a ${tmp_file_path}
}

ulser()
{
    cd ${MYTREE}/build/images/gdb
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/er/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b er -t l2_l3_quick_sanity -baseline er.latest -n5boot $1 -n5isan $2 -fex fex.bin -fexth fexth.bin | tee -a ${tmp_file_path}
}

ulserf()
{
    cd ${MYTREE}/build/images/final
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/er/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b er -t l2_l3_quick_sanity -baseline er.latest -n5boot $1 -n5isan $2 -fex fex.bin -fexth fexth.bin | tee -a ${tmp_file_path}
}

ulsan()
{
    cd ${MYTREE}/build/images/gdb
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/an/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b andaman -t quick_sanity -baseline qs.latest -n3boot $1 -n3isan $2 | tee -a ${tmp_file_path}
}

ulsanf()
{
    cd ${MYTREE}/build/images/final
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/an/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b andaman -t quick_sanity -baseline qs.latest -n3boot $1 -n3isan $2 | tee -a ${tmp_file_path}
}

ulsba()
{
    cd ${MYTREE}/build/images/gdb
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/ba/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b bahamas -t quick_sanity -baseline qs.latest -n3boot $1 -n3isan $2 | tee -a ${tmp_file_path}
}

ulsbaf()
{
    cd ${MYTREE}/build/images/final
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/ba/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b bahamas -t quick_sanity -baseline qs.latest -n3boot $1 -n3isan $2 | tee -a ${tmp_file_path}
}

ulsbam()
{
    cd ${MYTREE}/build/images/gdb
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/bam/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b bahamas_maint -t quick_sanity -baseline qs.latest -n3boot $1 -n3isan $2 | tee -a ${tmp_file_path}
}

ulsbamf()
{
    cd ${MYTREE}/build/images/final
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/bam/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b bahamas_maint -t quick_sanity -baseline qs.latest -n3boot $1 -n3isan $2 | tee -a ${tmp_file_path}
}

ulsca()
{
    cd ${MYTREE}/build/images/gdb
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/ca/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b cayman -t quick_sanity -baseline qs.latest -n3boot $1 -n3isan $2 | tee -a ${tmp_file_path}
}

ulscaf()
{
    cd ${MYTREE}/build/images/final
    tmp_file_name=`date +%d%m%y_%0k%M`
    tmp_file_path="/ws/arunhsri-sjc/uls/ca/${tmp_file_name}"
    echo ${MYTREE} >> ${tmp_file_path}
    /auto/nxos-golden/bin/si -b cayman -t quick_sanity -baseline qs.latest -n3boot $1 -n3isan $2 | tee -a ${tmp_file_path}
}

lbt()
{
    #Usage - lbt er 273 / lbt an / lbt an 146
    ARUN_BR="bahamas"
    ARUN_BUILD=""
    if [ "$1" = "an" ]
    then
        ARUN_BR="andaman"
    fi
    if [ "$1" = "ba" ]
    then
        ARUN_BR="bahamas"
    fi
    if [ "$1" = "er" ]
    then
        ARUN_BR="erocks"
    fi
    if [ "$2" != "" ]
    then
        ARUN_BUILD="$2"
    fi
    cd /ws/arunhsri-sjc/$1
    mkdir -p $2
    cd $2
    acme nw -linkedtree -branch ${ARUN_BR} -build ${ARUN_BUILD}
    setws
}

adiff()
{
    #Usage - genpatch urpf - will go to tree root and generate urpf.diff
    cdt
    acme diff -patch_mode | tee ${MYTREE}/../$1
}

makebcm()
{
    cdt
    cd third-party/src/broadcom-sdk/sdk-xgs-robo-5.9.1
    export SDK=`pwd`
    cd systems/linux/user/cx86-2_6
    #make clean
    make
    ls -l libbcmsdk.so
    #cp libbcm_sdk.so platform/nuova/bcm_usd/sdk/bin_shared/
}

makebcm6()
{
    cdt
    cd third-party/src/broadcom-sdk/sdk-xgs-robo-6.2.0-EA2
    export SDK=`pwd`
    export PATH=/auto/andatcd/gmake/3.81/bin:$PATH
    cd systems/linux/user/cx86-2_6
    #make clean
    make
    ls -l libbcmsdk.so
    #cp libbcm_sdk.so platform/nuova/bcm_usd/sdk/bin_shared/
}

