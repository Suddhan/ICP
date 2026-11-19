//------------------------------------------------------------------------------
// apb_driver class
//
// This class represents the driver for the apb interface.
// The driver handles the generation of APB read and write transfers.
//
// The driver has the following functionality:
// - Wait the start delay number of clock cycles.
// - SETUP phase: set PSEL, PADDR, PWRITE and PWDATA.
// - ACCESS phase: set PENABLE and wait until PREADY is high.
// - Count the number of clock cycles PREADY was low (wait-states).
// - Capture PRDATA and PSLVERR and send the item back as a response.
//
// There is at least one idle clock cycle between two transfers.
//
//------------------------------------------------------------------------------
class apb_driver extends uvm_driver #(apb_seq_item);
    `uvm_component_param_utils(apb_driver)

    // APB uVC configuration object.
    apb_config  m_config;

    //------------------------------------------------------------------------------
    // The constructor for the component.
    //------------------------------------------------------------------------------
    function new(string name, uvm_component parent = null);
        super.new(name, parent);
        if (!uvm_config_db #(apb_config)::get(this,"","apb_config", m_config)) begin
            `uvm_fatal(get_name(),"Cannot find the VC configuration!")
        end
    endfunction

    //------------------------------------------------------------------------------
    // FUNCTION: build
    // The build phase for the component.
    //------------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    //------------------------------------------------------------------------------
    // FUNCTION: run_phase
    // The run phase for the component.
    // - Main loop
    // -  Wait for sequence item.
    // -  Perform the requested transfer
    // -  Send a response back.
    //------------------------------------------------------------------------------
    virtual task run_phase(uvm_phase phase);
        apb_seq_item seq_item;
        int unsigned wait_states;
        // Reset signals
        m_config.m_vif.psel <= 0;
        m_config.m_vif.penable <= 0;
        m_config.m_vif.pwrite <= 0;
        m_config.m_vif.paddr <= 0;
        m_config.m_vif.pwdata <= 0;
        // Loop forever
        forever begin
            // Wait for sequence item
            seq_item_port.get(seq_item);
            `uvm_info(get_name(),$sformatf("APB transfer write=%0d addr=%0d after %0d clock cycles", seq_item.write, seq_item.addr, seq_item.start_delay),UVM_HIGH)
            // Wait a number clocks
            repeat (seq_item.start_delay) begin
                @(posedge m_config.m_vif.clk);
            end
            // Wait until reset is released
            @(posedge m_config.m_vif.clk);
            while (m_config.m_vif.rst_n !== 1) begin
                @(posedge m_config.m_vif.clk);
            end
            // SETUP phase
            m_config.m_vif.psel <= 1;
            m_config.m_vif.penable <= 0;
            m_config.m_vif.pwrite <= seq_item.write;
            m_config.m_vif.paddr <= seq_item.addr;
            if (seq_item.write) begin
                m_config.m_vif.pwdata <= seq_item.wdata;
            end
            @(posedge m_config.m_vif.clk);
            // ACCESS phase
            m_config.m_vif.penable <= 1;
            wait_states = 0;
            @(posedge m_config.m_vif.clk);
            // Wait until the DUT is ready
            while (m_config.m_vif.pready !== 1) begin
                wait_states++;
                @(posedge m_config.m_vif.clk);
            end
            // Save the result of the transfer
            if (!seq_item.write) begin
                seq_item.rdata = m_config.m_vif.prdata;
            end
            seq_item.resp = m_config.m_vif.pslverr;
            seq_item.wait_states = wait_states;
            // End of transfer
            m_config.m_vif.psel <= 0;
            m_config.m_vif.penable <= 0;
            seq_item_port.put(seq_item);
        end
    endtask : run_phase
endclass : apb_driver
