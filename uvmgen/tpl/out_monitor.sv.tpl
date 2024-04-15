`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV

//  Class: ${name}_out_monitor
class ${name}_out_monitor extends uvm_monitor;
  `uvm_component_utils(${name}_out_monitor);

  virtual ${name}_intf vif;
  uvm_analysis_port #(${name}_out_trans) ap;

  function new(string name = "${name}_out_monitor", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  extern function void build_phase(uvm_phase phase);
  extern task main_phase(uvm_phase phase);
  extern task collect(${name}_out_trans tr);
endclass : ${name}_out_monitor

function void ${name}_out_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(virtual ${name}_intf)::get(this, "", "vif", vif))
    `uvm_fatal("${name}_out_monitor", "virtual interface must be set for vif!!!")
  ap = new("ap", this);
endfunction : build_phase

task ${name}_out_monitor::main_phase(uvm_phase phase);
  ${name}_out_trans tr;
  while (1) begin
    collect(tr);
  end
endtask : main_phase

task ${name}_out_monitor::collect(${name}_out_trans tr);
  @(negedge vif.clk);
  begin
    tr           = new("tr");

    //todo:add monitor action.
    ap.write(tr);
  end
endtask : collect
`endif
