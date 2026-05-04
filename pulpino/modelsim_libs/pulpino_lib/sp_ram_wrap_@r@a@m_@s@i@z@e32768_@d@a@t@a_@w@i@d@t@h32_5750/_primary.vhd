library verilog;
use verilog.vl_types.all;
entity sp_ram_wrap_RAM_SIZE32768_DATA_WIDTH32_5750 is
    port(
        clk             : in     vl_logic;
        rstn_i          : in     vl_logic;
        en_i            : in     vl_logic;
        addr_i          : in     vl_logic_vector(14 downto 0);
        wdata_i         : in     vl_logic_vector(31 downto 0);
        rdata_o         : out    vl_logic_vector(31 downto 0);
        we_i            : in     vl_logic;
        be_i            : in     vl_logic_vector(3 downto 0);
        bypass_en_i     : in     vl_logic
    );
end sp_ram_wrap_RAM_SIZE32768_DATA_WIDTH32_5750;
