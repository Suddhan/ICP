library verilog;
use verilog.vl_types.all;
entity i2c_model_phy is
    port(
        scl_io          : inout  vl_logic;
        sda_io          : inout  vl_logic;
        rst_ni          : in     vl_logic;
        mode_i          : in     vl_logic_vector(1 downto 0);
        done_o          : out    vl_logic;
        send_ack_i      : in     vl_logic;
        start_o         : out    vl_logic;
        stop_o          : out    vl_logic;
        data_i          : in     vl_logic_vector(7 downto 0);
        data_o          : out    vl_logic_vector(7 downto 0)
    );
end i2c_model_phy;
