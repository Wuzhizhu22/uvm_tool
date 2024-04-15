`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV

package out_pkg;

  import uvm_pkg::*;
  import in_pkg::*;
  `include "uvm_macros.svh"
  `include "${name}_out_trans.sv"
  `include "${name}_out_monitor.sv"
  `include "${name}_out_agent.sv"
  `include "${name}_ref_mdl.sv"
  `include "${name}_scb.sv"

endpackage
`endif
