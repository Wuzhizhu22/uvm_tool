`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV

class ${name}_sequencer extends uvm_sequencer #(${name}_in_trans);
  `uvm_component_utils(${name}_sequencer);

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new

endclass : ${name}_sequencer
`endif
