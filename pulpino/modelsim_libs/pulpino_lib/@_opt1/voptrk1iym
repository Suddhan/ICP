library verilog;
use verilog.vl_types.all;
entity timer_5531 is
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
        irq_o           : out    vl_logic_vector(1 downto 0)
    );
end timer_5531;
