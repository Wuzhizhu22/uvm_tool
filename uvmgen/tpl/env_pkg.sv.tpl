`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV


package env_pkg;

  import uvm_pkg::*;
  import in_pkg::*;
  import out_pkg::*;

  `include "uvm_macros.svh"
  `include "${name}_env.sv"

endpackage
`endif
