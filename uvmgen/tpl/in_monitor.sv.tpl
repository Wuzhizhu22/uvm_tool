`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV

//  Class: ${name}_in_monitor
class ${name}_in_monitor extends uvm_monitor;
  `uvm_component_utils(${name}_in_monitor);

  virtual ${name}_intf vif;
  uvm_analysis_port #(${name}_in_trans) ap;

  function new(string name = "${name}_in_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  extern function void build_phase(uvm_phase phase);
  extern task main_phase(uvm_phase phase);
  extern task collect(${name}_in_trans tr);
endclass : ${name}_in_monitor

function void ${name}_in_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(virtual ${name}_intf)::get(this, "", "vif", vif))
    `uvm_fatal("${name}_in_monitor", "virtual interface must be set for vif!!!")
  ap = new("ap", this);
endfunction : build_phase

task ${name}_in_monitor::main_phase(uvm_phase phase);
  ${name}_in_trans tr;
  tr = new("tr");
  while (1) begin
    collect(tr);
  end
endtask : main_phase

task ${name}_in_monitor::collect(${name}_in_trans tr);
  @(posedge vif.clk) begin

    //todo:add monitor action.

    ap.write(tr);
    tr = new("tr");
  end
endtask : collect
`endif
