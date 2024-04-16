`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV

//
class exp_seq extends uvm_sequence #(${name}_in_trans);
  ${name}_in_trans m_trans;
  //todo:add seq declarations.
  `uvm_object_utils(exp_seq)

  function new(string name = "exp_seq");
    super.new(name);
  endfunction

  virtual task body();
    if (starting_phase != null) starting_phase.raise_objection(this);
    // repeat () begin
    //todo:add do seq.
    // end
    if (starting_phase != null) starting_phase.drop_objection(this);
  endtask
endclass

//Class: test_exp_case
class test_exp_case extends base_test;
  `uvm_component_utils(test_exp_case);

  function new(string name = "test_exp_case", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  extern function void build_phase(uvm_phase phase);
endclass : test_exp_case

function void test_exp_case::build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db#(uvm_object_wrapper)::set(this, "env.i_agt.sqr.main_phase", "default_sequence",
                                          exp_seq::type_id::get());
endfunction : build_phase

`endif
