`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV
//  Class: ${name}_in_agent
class ${name}_in_agent extends uvm_agent;
  `uvm_component_utils(${name}_in_agent);

  //sequencer
  ${name}_in_driver                     drv;
  ${name}_in_monitor                    mon;
  ${name}_sequencer                     sqr;

  uvm_analysis_port #(${name}_in_trans) ap;
  function new(string name = "${name}_in_agent", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass : ${name}_in_agent

function void ${name}_in_agent::build_phase(uvm_phase phase);
  super.build_phase(phase);
  sqr = ${name}_sequencer::type_id::create("sqr", this);
  drv = ${name}_in_driver::type_id::create("drv", this);
  mon = ${name}_in_monitor::type_id::create("mon", this);
endfunction : build_phase


function void ${name}_in_agent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  drv.seq_item_port.connect(sqr.seq_item_export);
  ap = mon.ap;
endfunction : connect_phase
`endif
