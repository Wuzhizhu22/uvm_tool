`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV
//  Class: ${name}_env
class ${name}_env extends uvm_env;
  `uvm_component_utils(${name}_env);

  ${name}_in_agent i_agt;
  ${name}_out_agent o_agt;
  ${name}_model mdl;
  ${name}_scb scb;


  uvm_tlm_analysis_fifo #(${name}_out_trans) agt_scb_fifo;
  uvm_tlm_analysis_fifo #(${name}_in_trans) agt_mdl_fifo;
  uvm_tlm_analysis_fifo #(${name}_out_trans) mdl_scb_fifo;

  function new(string name = "${name}_env", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass : ${name}_env



function void ${name}_env::build_phase(uvm_phase phase);
  super.build_phase(phase);
  `uvm_info("env", "env bulit", UVM_LOW)
  i_agt = ${name}_in_agent::type_id::create("i_agt", this);
  o_agt = ${name}_out_agent::type_id::create("o_agt", this);
  mdl = ${name}_model::type_id::create("mdl", this);
  scb = ${name}_scb::type_id::create("scb", this);
  agt_scb_fifo = new("agt_scb_fifo", this);
  agt_mdl_fifo = new("agt_mdl_fifo", this);
  mdl_scb_fifo = new("mdl_scb_fifo", this);
endfunction : build_phase


function void ${name}_env::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  i_agt.ap.connect(agt_mdl_fifo.analysis_export);
  mdl.port.connect(agt_mdl_fifo.blocking_get_export);
  mdl.ap.connect(mdl_scb_fifo.analysis_export);
  scb.exp_port.connect(mdl_scb_fifo.blocking_get_export);
  o_agt.ap.connect(agt_scb_fifo.analysis_export);
  scb.act_port.connect(agt_scb_fifo.blocking_get_export);
endfunction : connect_phase

`endif
