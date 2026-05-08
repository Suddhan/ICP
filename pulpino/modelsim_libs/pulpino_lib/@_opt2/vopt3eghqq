library verilog;
use verilog.vl_types.all;
entity i2c_master_bit_ctrl is
    port(
        clk             : in     vl_logic;
        nReset          : in     vl_logic;
        ena             : in     vl_logic;
        clk_cnt         : in     vl_logic_vector(15 downto 0);
        cmd             : in     vl_logic_vector(3 downto 0);
        cmd_ack         : out    vl_logic;
        busy            : out    vl_logic;
        al              : out    vl_logic;
        din             : in     vl_logic;
        dout            : out    vl_logic;
        scl_i           : in     vl_logic;
        scl_o           : out    vl_logic;
        scl_oen         : out    vl_logic;
        sda_i           : in     vl_logic;
        sda_o           : out    vl_logic;
        sda_oen         : out    vl_logic
    );
end i2c_master_bit_ctrl;
