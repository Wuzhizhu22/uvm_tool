#use "vsim -c -do run.do" to run simulation.
vlib work
set UVM_HOME D:/modelsim/verilog_src/uvm-1.1d
set UVM_DPI_HOME D:/modelsim/uvm-1.1d/win64
#todo:add work path.
#set WORK_HOME D:/WhatIDone/UVM_ENSM 

vlog +incdir+$UVM_HOME/src+$WORK_HOME/interfaces/+$WORK_HOME/src/agents/in_agent/+$WORK_HOME/src/agents/out_agent/+$WORK_HOME/src/env/+$WORK_HOME/src/seq/+$WORK_HOME/tb/+$WORK_HOME/tests/ \
     -L mtiAvm -L mtiOvm -L mtiUvm -L mtiUPF  $UVM_HOME/src/uvm_pkg.sv -f $WORK_HOME/scripts/filelist.f 
vsim -c -voptargs="+acc" -sv_lib D:/modelsim/uvm-1.1d/win64/uvm_dpi +UVM_TESTNAME=ensm_pin_pl_fdd_indp_case work.top_tb +UVM_VERBOSITY=UVM_LOW -sv_seed random  -l log

#todo: add wave.
run -all