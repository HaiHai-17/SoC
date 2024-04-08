library verilog;
use verilog.vl_types.all;
entity bai92_tb is
    generic(
        PERIOD          : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of PERIOD : constant is 1;
end bai92_tb;
