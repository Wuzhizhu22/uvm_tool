`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV

class ${name}_model extends uvm_component;

  `uvm_component_utils(${name}_model)

  virtual ${name}_intf ${name}_intf;

  //todo:add parameter
  //todo:add signals

  uvm_blocking_get_port #(${name}_in_trans) port;
  uvm_analysis_port #(${name}_out_trans) ap;

  function new(string name = "${name}_model", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void update_output(${name}_out_trans tr_out);
  extern virtual task main_phase(uvm_phase phase);
endclass : ${name}_model

function void ${name}_model::build_phase(uvm_phase phase);
  super.build_phase(phase);

  if (!uvm_config_db#(virtual ${name}_intf)::get(this, "", "${name}_intf", ${name}_intf))
    `uvm_fatal("${name}_out_monitor", "virtual rfr_interface must be set for vif!!!")

  port = new("port", this);
  ap   = new("ap", this);

endfunction : build_phase

function void ${name}_model::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

task ${name}_model::main_phase(uvm_phase phase);

  ${name}_in_trans  tr_in;
  ${name}_out_trans tr_out;
  //todo:reset refsignal ep.   ${name}_intf.rm_state= 0;

  super.main_phase(phase);

  while (1) begin
    `uvm_info("${name}_model", "try to get one transaction", UVM_MEDIUM)
    port.get(tr_in);
    // `uvm_info("${name}_model", "get one transaction, copy and print it:", UVM_LOW)
    // tr_in.print();

  //todo:add refmdl action
  end
endtask : main_phase

function void ${name}_model::update_output(${name}_out_trans tr_out);
  `uvm_info("${name}_model", "UPDATE OUTPUT!", UVM_MEDIUM)
  nxt_sta = ${name}_intf.rst_n ? nxt_sta : SLEEP;
  cur_sta = nxt_sta;
  `uvm_info("${name}_model", $sformatf("CUR_STATE:%p NXT_STATE:%p", cur_sta, nxt_sta), UVM_MEDIUM)

  //todo:update refsignal ep.     ${name}_intf.rm_state     = cur_sta;
  tr_out                 = new("tr_out");
  //todo:update refsignal ep.     $ tr_out.state           = cur_sta;
  ap.write(tr_out);
endfunction : update_output
`endif
