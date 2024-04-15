`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV
//  Class: ${name}_scb
class ${name}_scb extends uvm_scoreboard;
  `uvm_component_utils(${name}_scb);

  // todo:add parameter

  ${name}_out_trans expect_queue[$];
  ${name}_out_trans actual_queue[$];
  uvm_blocking_get_port #(${name}_out_trans) exp_port;
  uvm_blocking_get_port #(${name}_out_trans) act_port;
  //  Constructor: new
  function new(string name = "${name}_scb", uvm_component parent);
    super.new(name, parent);
  endfunction : new

  extern function void build_phase(uvm_phase phase);
  extern task main_phase(uvm_phase phase);
endclass : ${name}_scb


function void ${name}_scb::build_phase(uvm_phase phase);
  super.build_phase(phase);
  exp_port = new("exp_port", this);
  act_port = new("act_port", this);
endfunction : build_phase


task ${name}_scb::main_phase(uvm_phase phase);
  ${name}_out_trans get_expect, get_actual, chk_act, chk_exp;
  bit result;
  int sc_cnt = 0;
  int er_cnt = 0;

  super.main_phase(phase);
  fork
    while (1) begin
      exp_port.get(get_expect);
      act_port.get(get_actual);
      expect_queue.push_back(get_expect);
      actual_queue.push_back(get_actual);
      if ((expect_queue.size() > 0) && (actual_queue.size() > 0)) begin
        chk_exp = expect_queue.pop_front();
        chk_act = actual_queue.pop_front();
        // todo:add compare action
        // result  = chk_exp.compare(chk_act);
        // if (result) begin
        //   sc_cnt = sc_cnt + 1;
        //   if (sc_cnt % 50 == 0)
        //     `uvm_info("${name}_scb", $sformatf("Compare SUCCESSFULLY SC_CNT:%d", sc_cnt), UVM_LOW);
        // end else begin
        //   er_cnt = er_cnt + 1;
        //   `uvm_error("${name}_scb", $sformatf("Compare FAILED,ER_CNT:%d", er_cnt))
        //   $display("the expect pkt is");
        //   chk_exp.print();
        //   $display("the actual pkt is");
        //   chk_act.print();
        // end
      end
    end
  join
endtask : main_phase
`endif
