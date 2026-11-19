//------------------------------------------------------------------------------
// apb_config class
//
// The configuration of apb.
// This class contains the configuration of apb, and the virtual interface.
//
// The configuration of apb includes:
//  is_active   - indicate whether the sequencer and driver are activated.
//  has_monitor - indicate whether the monitor is activated.
//
// The virtual interface includes:
//  m_vif - The apb uVC virtual apb_if interface.
//
//------------------------------------------------------------------------------
class apb_config extends uvm_object;

    // The Sequencer and driver are activated
    bit is_active = 1;
    // The monitor is active. 
    bit has_monitor = 1;
    // apb uVC virtual APB_IF interface.
    virtual apb_if m_vif;

    `uvm_object_utils_begin(apb_config)
    `uvm_field_int(is_active,UVM_ALL_ON|UVM_DEC)
    `uvm_field_int(has_monitor,UVM_ALL_ON|UVM_DEC)
    `uvm_object_utils_end

    //------------------------------------------------------------------------------
    // The constructor for the component.
    //------------------------------------------------------------------------------
    function new (string name = "apb_config");
        super.new(name);
    endfunction : new

endclass : apb_config
