library verilog;
use verilog.vl_types.all;
entity i2c_eeprom_model is
    generic(
        ADDRESS         : vl_logic_vector(0 to 6) := (Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0)
    );
    port(
        scl_io          : inout  vl_logic;
        sda_io          : inout  vl_logic;
        rst_ni          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDRESS : constant is 1;
end i2c_eeprom_model;
