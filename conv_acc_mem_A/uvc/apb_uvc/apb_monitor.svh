//------------------------------------------------------------------------------
// apb_monitor class
//
// This class is used to monitor the apb interface.
//
// A transfer is completed when PSEL, PENABLE and PREADY are all high.
// The monitor then creates a sequence item with the address, direction,
// write data or read data, PSLVERR and the number of wait-states.
//
// The object is then written to the analysis port.
//
//------------------------------------------------------------------------------
class apb_monitor  extends uvm_monitor;
    `uvm_component_param_utils(apb_monitor)

    // APB uVC configuration object.
    apb_config  m_config;
    // Monitor analysis port.
    uvm_analysis_port #(apb_seq_item)  m_analysis_port;

    //------------------------------------------------------------------------------
    // The constructor for the component.
    //------------------------------------------------------------------------------
    function new(string name, uvm_component parent = null);
        super.new(name, parent);
        if (!uvm_config_db #(apb_config)::get(this,"","apb_config", m_config)) begin
            `uvm_fatal(get_name(),"Cannot find the VC configuration!")
        end
        m_analysis_port = new("m_apb_analysis_port", this);
    endfunction

    //------------------------------------------------------------------------------
    // The build phase for the component.
    //------------------------------------------------------------------------------
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction : build_phase

    //------------------------------------------------------------------------------
    // The run phase for the monitor.
    //------------------------------------------------------------------------------
    task run_phase(uvm_phase phase);
        process check_process;

        `uvm_info(get_name(),$sformatf("Starting apb interface monitoring"),UVM_HIGH)
        forever begin
            // Wait for reset to be released
            `uvm_info(get_name(),$sformatf("Waiting for reset signal is released..."),UVM_HIGH)
            @(posedge m_config.m_vif.rst_n);
            `uvm_info(get_name(),$sformatf("Reset signal is released"),UVM_HIGH)
            fork
                // Detect reset during testing
                begin
                    @(negedge m_config.m_vif.rst_n);
                    `uvm_info(get_name(),$sformatf("Reset detected. Checking aborted!!"),UVM_HIGH)
                    if (check_process != null) begin
                        check_process.kill();
                    end
                end
                begin
                    apb_seq_item  seq_item;
                    int unsigned wait_states;
                    // Save process info to be able to kill the process
                    check_process = process::self();
                    wait_states = 0;
                    // Check the apb signals in every clock cycle
                    forever begin
                        @(negedge m_config.m_vif.clk);
                        if (m_config.m_vif.psel === 1 && m_config.m_vif.penable === 1) begin
                            if (m_config.m_vif.pready === 1) begin
                                // Create a new apb sequence item with the completed transfer
                                seq_item = apb_seq_item::type_id::create("seq_item");
                                seq_item.addr = m_config.m_vif.paddr;
                                seq_item.write = m_config.m_vif.pwrite;
                                if (seq_item.write) begin
                                    seq_item.wdata = m_config.m_vif.pwdata;
                                end
                                else begin
                                    seq_item.rdata = m_config.m_vif.prdata;
                                end
                                seq_item.resp = m_config.m_vif.pslverr;
                                seq_item.wait_states = wait_states;
                                `uvm_info(get_name(),$sformatf("Received APB transfer write=%0d addr=%0d wait_states=%0d resp=%0d", seq_item.write, seq_item.addr, seq_item.wait_states, seq_item.resp),UVM_HIGH)
                                m_analysis_port.write(seq_item);
                                wait_states = 0;
                            end
                            else begin
                                // The DUT inserts a wait-state
                                wait_states++;
                            end
                        end
                        else begin
                            wait_states = 0;
                        end
                    end
                end
            join_any
        end
    endtask : run_phase
endclass : apb_monitor
