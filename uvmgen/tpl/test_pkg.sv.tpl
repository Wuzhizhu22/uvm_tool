`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV

package test_pkg;
  import uvm_pkg::*;
  import in_pkg::*;
  import out_pkg::*;
  import env_pkg::*;
  import seq_pkg::*;

  `include "uvm_macros.svh"
  `include "test_lib.sv"

endpackage

`endif
