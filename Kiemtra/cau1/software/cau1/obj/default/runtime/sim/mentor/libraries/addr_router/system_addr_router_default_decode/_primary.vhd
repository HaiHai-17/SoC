library verilog;
use verilog.vl_types.all;
entity system_addr_router_default_decode is
    generic(
        DEFAULT_CHANNEL : integer := 1;
        \DEFAULT_WR_CHANNEL\: integer := -1;
        \DEFAULT_RD_CHANNEL\: integer := -1;
        DEFAULT_DESTID  : integer := 2
    );
    port(
        default_destination_id: out    vl_logic_vector(1 downto 0);
        default_wr_channel: out    vl_logic_vector(3 downto 0);
        default_rd_channel: out    vl_logic_vector(3 downto 0);
        default_src_channel: out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DEFAULT_CHANNEL : constant is 1;
    attribute mti_svvh_generic_type of \DEFAULT_WR_CHANNEL\ : constant is 1;
    attribute mti_svvh_generic_type of \DEFAULT_RD_CHANNEL\ : constant is 1;
    attribute mti_svvh_generic_type of DEFAULT_DESTID : constant is 1;
end system_addr_router_default_decode;
