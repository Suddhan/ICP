library verilog;
use verilog.vl_types.all;
entity tb_ps is
    generic(
        SPI             : string  := "QUAD";
        BAUDRATE        : integer := 781250;
        CLK_USE_FLL     : integer := 0;
        TEST            : string  := "";
        USE_ZERO_RISCY  : integer := 0;
        RISCY_RV32F     : integer := 0;
        ZERO_RV32M      : integer := 1;
        ZERO_RV32E      : integer := 0
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SPI : constant is 1;
    attribute mti_svvh_generic_type of BAUDRATE : constant is 1;
    attribute mti_svvh_generic_type of CLK_USE_FLL : constant is 1;
    attribute mti_svvh_generic_type of TEST : constant is 1;
    attribute mti_svvh_generic_type of USE_ZERO_RISCY : constant is 1;
    attribute mti_svvh_generic_type of RISCY_RV32F : constant is 1;
    attribute mti_svvh_generic_type of ZERO_RV32M : constant is 1;
    attribute mti_svvh_generic_type of ZERO_RV32E : constant is 1;
end tb_ps;
