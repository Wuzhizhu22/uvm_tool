`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV


class exp_seq extends uvm_sequence #(${name}_in_trans);
  ${name}_in_trans m_trans;
  `uvm_object_utils(exp_seq)

  function new(string name = "exp_seq");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_do_with(m_trans,
                {
                  //add decriptions
                })
  endtask
endclass
`endif
