class conv_reg_adapter extends uvm_reg_adapter;
    `uvm_object_utils(conv_reg_adapter);

    function new(string name = "conv_reg_adapter");
        super.new(name);
    endfunction

    virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
        apb_seq_item = apb_seq_item::type_id::create("item");

        item.write = (rw.kind == UVM_WRITE);
        item.addr = rw.addr;
        item.wdata = (rw.kind == UVM_WRITE) ? rw.data[31:0] : '0;
        return item
    endfunction

    virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
        apb_seq_item item;
        if (!$cast(item, bus_item))
        `uvm_fatal("ADAPT", "bus_item is not an apb_seq_item")

        rw.kind = item.write ? UVM_WRITE : UVM_READ;
        rw.addr = item.addr;
        rw.data = item.write ? item.wdata : item.rdata;
        rw.n_bits = 32;
        rw.status = item.resp ? UVM_NOT_OK : UVM_IS_OK;


    endfunction

endclass
