library verilog;
use verilog.vl_types.all;
entity adbg_tap_top is
    port(
        tms_pad_i       : in     vl_logic;
        tck_pad_i       : in     vl_logic;
        trstn_pad_i     : in     vl_logic;
        tdi_pad_i       : in     vl_logic;
        tdo_pad_o       : out    vl_logic;
        tdo_padoe_o     : out    vl_logic;
        test_mode_i     : in     vl_logic;
        test_logic_reset_o: out    vl_logic;
        run_test_idle_o : out    vl_logic;
        shift_dr_o      : out    vl_logic;
        pause_dr_o      : out    vl_logic;
        update_dr_o     : out    vl_logic;
        capture_dr_o    : out    vl_logic;
        extest_select_o : out    vl_logic;
        sample_preload_select_o: out    vl_logic;
        mbist_select_o  : out    vl_logic;
        debug_select_o  : out    vl_logic;
        tdi_o           : out    vl_logic;
        debug_tdo_i     : in     vl_logic;
        bs_chain_tdo_i  : in     vl_logic;
        mbist_tdo_i     : in     vl_logic
    );
end adbg_tap_top;
