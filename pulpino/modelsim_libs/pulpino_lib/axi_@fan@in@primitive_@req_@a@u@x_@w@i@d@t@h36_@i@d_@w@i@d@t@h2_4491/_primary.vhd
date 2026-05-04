library verilog;
use verilog.vl_types.all;
entity axi_FanInPrimitive_Req_AUX_WIDTH36_ID_WIDTH2_4491 is
    port(
        RR_FLAG         : in     vl_logic;
        data_AUX0_i     : in     vl_logic_vector(35 downto 0);
        data_AUX1_i     : in     vl_logic_vector(35 downto 0);
        data_req0_i     : in     vl_logic;
        data_req1_i     : in     vl_logic;
        data_ID0_i      : in     vl_logic_vector(1 downto 0);
        data_ID1_i      : in     vl_logic_vector(1 downto 0);
        data_gnt0_o     : out    vl_logic;
        data_gnt1_o     : out    vl_logic;
        data_AUX_o      : out    vl_logic_vector(35 downto 0);
        data_req_o      : out    vl_logic;
        data_ID_o       : out    vl_logic_vector(1 downto 0);
        data_gnt_i      : in     vl_logic;
        lock_EXCLUSIVE  : in     vl_logic;
        SEL_EXCLUSIVE   : in     vl_logic
    );
end axi_FanInPrimitive_Req_AUX_WIDTH36_ID_WIDTH2_4491;
