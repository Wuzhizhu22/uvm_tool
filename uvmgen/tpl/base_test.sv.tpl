`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV


class base_test extends uvm_test;
  `uvm_object_utils(base_test);
  ${name}_env env;
  ${name}_sequencer sqr;

  function new(string name = "base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void report_phase(uvm_phase phase);
endclass : base_test

function void base_test::build_phase(uvm_phase phase);
  super.build_phase(phase);
  env = ${name}_env::type_id::create("env", this);
  sqr = ${name}_sequencer::type_id::create("sqr", this);
endfunction : build_phase

function void base_test::connect_phase(uvm_phase phase);
endfunction : connect_phase

function void base_test::report_phase(uvm_phase phase);
  uvm_report_server server;
  int err_num, war_num, fatal_num;
  string test_name;
  super.report_phase(phase);

  server    = uvm_report_server::get_server();
  err_num   = server.get_severity_count(UVM_ERROR);
  fatal_num = server.get_severity_count(UVM_FATAL);
  war_num   = server.get_severity_count(UVM_WARNING);
  if (err_num != 0 || fatal_num != 0) begin
    $display("+-------------------[ TEST CASE FAILED ]-------------------+");
    $display("|  ..          ..                   ..         ..          |");
    $display("|  TEST_NAME   :                                           |");
    $display("|  UVM_FATAL   :%3d                                        |", fatal_num);
    $display("|  UVM_ERROR   :%3d                                        |", err_num);
    $display("|  UVM_WARNING :%3d                                        |", war_num);
    $display("|                                                          |");
    $display("|  ********          *             *****         *         |");
    $display("|  *               *   *             *           *         |");
    $display("|  ********       *     *            *           *         |");
    $display("|  *             *********           *           *         |");
    $display("|  *             *       *           *           *         |");
    $display("|  *             *       *         *****         ********  |");
    $display("+----------------------------------------------------------+");
    $display("+                    Simulation FAIL                       +");
  end else begin
    $display("+-------------------[ TEST CASE PASSED ]-------------------+");
    $display("|  ..          ..                   ..         ..          |");
    $display("|  TEST_NAME   :                                           |");
    $display("|  UVM_FATAL   :%3d                                        |", fatal_num);
    $display("|  UVM_ERROR   :%3d                                        |", err_num);
    $display("|  UVM_WARNING :%3d                                        |", war_num);
    $display("|                                                          |");
    $display("|  ********          *             *****         *****     |");
    $display("|  *       *       *   *          *             *          |");
    $display("|  ********       *     *          **            **        |");
    $display("|  *             *********           **            **      |");
    $display("|  *             *       *             *             *     |");
    $display("|  *             *       *        *****         *****      |");
    $display("+----------------------------------------------------------+");
    $display("+                    Simulation PASS                       +");
  end
endfunction : report_phase

`endif
