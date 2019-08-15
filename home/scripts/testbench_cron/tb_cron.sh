#!/bin/bash

branch=$1
home=/home/arunsr


function update_panos() {
echo "Updating panos " $1
sleep 2
cd $1
git up
}

function update_vhdl() {
echo "Updating vhdl " $1
sleep 2
cvsup
}

update_wp () {
echo $1
sleep 5
source /home/arunsr/scripts/run_vhdl.sh $1
panos=~/ws/$1/panos
vhdl=~/ws/$1/vhdl

update_panos $panos
update_vhdl $vhdl
}

function run_testsuite() {
source /home/arunsr/scripts/run_vhdl.sh $1
env | grep vhdl

echo pwd
#run_suite csim_mg # TODO uncomment this
sleep 2
echo "FINISHED RUNNING"
}

function get_results() {
tb_result_dir=$HOME/ws/testbench_results/$1/
cd $tb_result_dir
ls -ltr 
}

#update_wp $1
run_testsuite $1 
get_results $1
