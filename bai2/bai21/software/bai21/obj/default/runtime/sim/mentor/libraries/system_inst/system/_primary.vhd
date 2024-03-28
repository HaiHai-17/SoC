library verilog;
use verilog.vl_types.all;
entity system is
    port(
        clk_clk         : in     vl_logic;
        reset_reset_n   : in     vl_logic;
        switch_external_connection_export: in     vl_logic_vector(31 downto 0);
        led_external_connection_export: out    vl_logic_vector(31 downto 0)
    );
end system;
