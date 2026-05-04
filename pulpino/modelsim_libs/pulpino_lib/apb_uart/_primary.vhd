library verilog;
use verilog.vl_types.all;
entity apb_uart is
    port(
        CLK             : in     vl_logic;
        RSTN            : in     vl_logic;
        PSEL            : in     vl_logic;
        PENABLE         : in     vl_logic;
        PWRITE          : in     vl_logic;
        PADDR           : in     vl_logic_vector(2 downto 0);
        PWDATA          : in     vl_logic_vector(31 downto 0);
        PRDATA          : out    vl_logic_vector(31 downto 0);
        PREADY          : out    vl_logic;
        PSLVERR         : out    vl_logic;
        INT             : out    vl_logic;
        OUT1N           : out    vl_logic;
        OUT2N           : out    vl_logic;
        RTSN            : out    vl_logic;
        DTRN            : out    vl_logic;
        CTSN            : in     vl_logic;
        DSRN            : in     vl_logic;
        DCDN            : in     vl_logic;
        RIN             : in     vl_logic;
        SIN             : in     vl_logic;
        SOUT            : out    vl_logic
    );
end apb_uart;
