library verilog;
use verilog.vl_types.all;
entity Memory is
    generic(
        DATA_WIDTH      : integer := 32;
        ADDRESS_WIDTH   : integer := 4
    );
    port(
        iClk            : in     vl_logic;
        iReset_n        : in     vl_logic;
        iChipSelect_n   : in     vl_logic;
        iRead_n         : in     vl_logic;
        iWrite_n        : in     vl_logic;
        iAddress        : in     vl_logic_vector;
        iData           : in     vl_logic_vector;
        oData           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDRESS_WIDTH : constant is 1;
end Memory;
