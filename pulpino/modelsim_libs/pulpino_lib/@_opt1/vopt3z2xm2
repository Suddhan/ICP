library verilog;
use verilog.vl_types.all;
entity apb_i2c is
    port(
        HCLK            : in     vl_logic;
        HRESETn         : in     vl_logic;
        PADDR           : in     vl_logic_vector(11 downto 0);
        PWDATA          : in     vl_logic_vector(31 downto 0);
        PWRITE          : in     vl_logic;
        PSEL            : in     vl_logic;
        PENABLE         : in     vl_logic;
        PRDATA          : out    vl_logic_vector(31 downto 0);
        PREADY          : out    vl_logic;
        PSLVERR         : out    vl_logic;
        interrupt_o     : out    vl_logic;
        scl_pad_i       : in     vl_logic;
        scl_pad_o       : out    vl_logic;
        scl_padoen_o    : out    vl_logic;
        sda_pad_i       : in     vl_logic;
        sda_pad_o       : out    vl_logic;
        sda_padoen_o    : out    vl_logic
    );
end apb_i2c;
