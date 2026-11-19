//------------------------------------------------------------------------------
// apb_seq class
//
// This sequence is used to generate an APB read or write transfer.
//
// The sequence has one constraint on the start delay.
// After the transfer the response of the DUT is saved in rdata, resp
// and wait_states.
//
//------------------------------------------------------------------------------
class apb_seq extends uvm_sequence #(apb_seq_item);
    `uvm_object_utils(apb_seq)

    // Random start delay
    rand int unsigned start_delay;
    // Random address
    rand bit [11:0] addr;
    // Random write or read
    rand bit write;
    // Random write data
    rand bit [31:0] wdata;

    // Read data from the DUT
    bit [31:0] rdata;
    // Error response from the DUT
    bit resp;
    // Number of wait-states
    int unsigned wait_states;

    // Random constraint start delay should be less than 256
    constraint delay_c {
        start_delay < 256;
    }

    //------------------------------------------------------------------------------
    // The constructor for the sequence.
    //------------------------------------------------------------------------------
    function new(string name="apb_seq");
        super.new(name);
    endfunction : new

    //------------------------------------------------------------------------------
    // The main task to be executed within the sequence.
    //------------------------------------------------------------------------------
    task body();
        // Create sequence
        req = apb_seq_item::type_id::create("req");
        // Wait for sequencer ready
        start_item(req);
        // Randomize sequence item
        if (!(req.randomize() with {
            req.start_delay == local::start_delay;
            req.addr == local::addr;
            req.write == local::write;
            req.wdata == local::wdata;
        })) `uvm_fatal(get_name(), "Failed to randomize")
        // Send to sequencer
        finish_item(req);
        // Wait until request is completed
        get_response(rsp, req.get_transaction_id());
        // Save the result of the transfer
        rdata = rsp.rdata;
        resp = rsp.resp;
        wait_states = rsp.wait_states;
    endtask : body

endclass : apb_seq
