`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV
//  Class: ${name}_out_agent
class ${name}_out_agent extends uvm_agent;
  `uvm_component_utils(${name}_out_agent);

  //sequencer
  ${name}_out_monitor mon;

  uvm_analysis_port #(${name}_out_trans) ap;

  function new(string name = "${name}_out_agent", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass : ${name}_out_agent

function void ${name}_out_agent::build_phase(uvm_phase phase);
  super.build_phase(phase);
  mon = ${name}_out_monitor::type_id::create("mon", this);
endfunction : build_phase


function void ${name}_out_agent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  ap = mon.ap;
endfunction : connect_phase
`endif
