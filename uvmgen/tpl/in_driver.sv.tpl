`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV
//  Class: ${name}_in_driver
class ${name}_in_driver extends uvm_driver #(${name}_in_trans);
  `uvm_component_utils(${name}_in_driver);
  virtual ${name}_intf vif;

  function new(string name = "${name}_in_driver", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  extern function void build_phase(uvm_phase phase);
  extern task main_phase(uvm_phase phase);
  extern task drive(${name}_in_trans tr);
endclass : ${name}_in_driver

function void ${name}_in_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(virtual ${name}_intf)::get(this, "", "vif", vif))
    `uvm_fatal("${name}_in_driver", "virtual interface must be set for vif")
endfunction : build_phase

task ${name}_in_driver::main_phase(uvm_phase phase);
  int i;
  `uvm_info("${name}_driver", "driver waiting!!!", UVM_MEDIUM)
  //todo:reset signal?????
  while (!vif.rst_n) @(posedge vif.clk);
  @(negedge vif.clk);
  while (1) begin
    `uvm_info("${name}_driver", "driver start drive", UVM_MEDIUM)
    seq_item_port.get_next_item(req);
    drive(req);
    seq_item_port.item_done();
  end
endtask : main_phase

task ${name}_in_driver::drive(${name}_in_trans tr);
  //todo:add driver action
endtask : drive
`endif
