`ifndef ${fname_prefix}__SV
`define ${fname_prefix}__SV
//  Class: ${name}_out_trans
class ${name}_out_trans #(
  // parameter
) extends uvm_sequence_item;

// typedef enum {READ, WRITE } kinds_e;
// rand kinds_e kind;
// typedef enum {IS_OK, ERROR} status_e;
// rand status_e status;
// rand byte sa;

// ToDo: Add constraint blocks to prevent error injection
// ToDo: Add relevant class properties to define all transactions
// ToDo: Modify/add symbolic transaction identifiers to match

constraint out_trans_valid {
   // ToDo: Define constraint to make descriptor valid
   status == IS_OK;
}
`uvm_object_utils_begin(out_trans) 

  //  ToDo: add properties using macros here

  //  `uvm_field_enum(kinds_e,kind,UVM_ALL_ON)
  //  `uvm_field_enum(status_e,status, UVM_ALL_ON)
`uvm_object_utils_end

extern function new(string name = "${name}_out_trans");
endclass : ${name}_out_trans

function ${name}_out_tran::new(string name = "${name}_out_trans");
  super.new(name);
endfunction : new
`endif

