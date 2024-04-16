`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV


module top_tb;
  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import in_pkg::*;
  import out_pkg::*;
  import env_pkg::*;
  import seq_pkg::*;
  import test_pkg::*;


  logic clk;
  logic rst_n;

  initial begin
    rst_n = 'b0;
    #20ns;
    `uvm_info("top_tb", "rst_n == 1", UVM_LOW)
    rst_n = 'b1;
  end

  initial begin
    clk = 'b0;
    forever begin
      #2ns clk = ~clk;
    end
  end


  ${name}_intf ${name}_intf (
      clk,
      rst_n
  );

  ${name} #(
      // parameter
  ) dut (
      .clk (clk),   //i
      .rstn(rst_n),  //i
      
      // interface pins
  );

  initial begin
    run_test("");
  end

  initial begin
    uvm_config_db#(virtual ${name}_intf)::set(null, "uvm_test_top.env.i_agt.drv", "vif", ${name}_intf);
    uvm_config_db#(virtual ${name}_intf)::set(null, "uvm_test_top.env.i_agt.mon", "vif", ${name}_intf);
    uvm_config_db#(virtual ${name}_intf)::set(null, "uvm_test_top.env.o_agt.mon", "vif", ${name}_intf);
    uvm_config_db#(virtual ${name}_intf)::set(null, "uvm_test_top.env.mdl", "${name}_intf", ${name}_intf);
  end

  initial begin
`ifdef DUMP_FSDB
    $timeformat(-12, 2, "ps", 10);
    $fsdbDumpfile("{fsdbfile}.fsdb");
    $fsdbDumpvars();
    $fsdbDumpSVA();
    $fsdbDumpMDA();
`endif
  end

endmodule
`endif
