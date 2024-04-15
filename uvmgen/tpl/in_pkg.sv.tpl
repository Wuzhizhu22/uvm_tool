`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV

package in_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  `include "${name}_in_trans.sv"
  `include "${name}_sequencer.sv"
  `include "${name}_in_driver.sv"
  `include "${name}_in_monitor.sv"
  `include "${name}_in_agent.sv"

endpackage

`endif
