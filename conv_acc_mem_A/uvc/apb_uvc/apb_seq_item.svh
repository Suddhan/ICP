//------------------------------------------------------------------------------
// apb_seq_item class
//
// This class represents a sequence item for an APB transfer
// 
// A sequence item contains:
// - start_delay: clock delay before the transfer starts
// - addr: APB address (PADDR)
// - write: 1 for a write transfer, 0 for a read transfer (PWRITE)
// - wdata: APB write data (PWDATA)
// - rdata: APB read data (PRDATA)
// - resp: APB error response (PSLVERR)
// - wait_states: number of clock cycles PREADY was low
// 
//------------------------------------------------------------------------------
class apb_seq_item extends uvm_sequence_item;

    // Clock delay before send the transfer
    rand int unsigned start_delay;
    // APB address
    rand bit [11:0] addr;
    // APB write or read
    rand bit write;
    // APB write data
    rand bit [31:0] wdata;
    // APB read data
    bit [31:0] rdata;
    // APB error response
    bit resp;
    // Number of wait-states
    int unsigned wait_states;

    // Specify how variables shall be printed out.
    `uvm_object_utils_begin(apb_seq_item)
    `uvm_field_int(start_delay,UVM_ALL_ON|UVM_DEC)
    `uvm_field_int(addr,UVM_ALL_ON|UVM_DEC)
    `uvm_field_int(write,UVM_ALL_ON|UVM_DEC)
    `uvm_field_int(wdata,UVM_ALL_ON|UVM_DEC)
    `uvm_field_int(rdata,UVM_ALL_ON|UVM_DEC)
    `uvm_field_int(resp,UVM_ALL_ON|UVM_DEC)
    `uvm_field_int(wait_states,UVM_ALL_ON|UVM_DEC)
    `uvm_object_utils_end

    //------------------------------------------------------------------------------
    // The constructor for the sequence item.
    //------------------------------------------------------------------------------
    function new (string name = "apb_seq_item");
        super.new(name);
    endfunction : new

endclass : apb_seq_item
