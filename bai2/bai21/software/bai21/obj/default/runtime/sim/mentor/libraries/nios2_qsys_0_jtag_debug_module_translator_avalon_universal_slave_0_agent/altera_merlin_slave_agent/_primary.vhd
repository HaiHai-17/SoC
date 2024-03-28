library verilog;
use verilog.vl_types.all;
entity altera_merlin_slave_agent is
    generic(
        PKT_BEGIN_BURST : integer := 81;
        PKT_DATA_H      : integer := 31;
        PKT_DATA_L      : integer := 0;
        PKT_SYMBOL_W    : integer := 8;
        PKT_BYTEEN_H    : integer := 71;
        PKT_BYTEEN_L    : integer := 68;
        PKT_ADDR_H      : integer := 63;
        PKT_ADDR_L      : integer := 32;
        PKT_TRANS_LOCK  : integer := 87;
        PKT_TRANS_COMPRESSED_READ: integer := 67;
        PKT_TRANS_POSTED: integer := 66;
        PKT_TRANS_WRITE : integer := 65;
        PKT_TRANS_READ  : integer := 64;
        PKT_SRC_ID_H    : integer := 74;
        PKT_SRC_ID_L    : integer := 72;
        PKT_DEST_ID_H   : integer := 77;
        PKT_DEST_ID_L   : integer := 75;
        PKT_BURSTWRAP_H : integer := 85;
        PKT_BURSTWRAP_L : integer := 82;
        PKT_BYTE_CNT_H  : integer := 81;
        PKT_BYTE_CNT_L  : integer := 78;
        PKT_PROTECTION_H: integer := 86;
        PKT_PROTECTION_L: integer := 86;
        PKT_RESPONSE_STATUS_H: integer := 89;
        PKT_RESPONSE_STATUS_L: integer := 88;
        PKT_BURST_SIZE_H: integer := 92;
        PKT_BURST_SIZE_L: integer := 90;
        ST_DATA_W       : integer := 93;
        ST_CHANNEL_W    : integer := 32;
        ADDR_W          : vl_notype;
        AVS_DATA_W      : vl_notype;
        AVS_BURSTCOUNT_W: integer := 4;
        PKT_SYMBOLS     : vl_notype;
        PREVENT_FIFO_OVERFLOW: integer := 0;
        SUPPRESS_0_BYTEEN_CMD: integer := 1;
        USE_READRESPONSE: integer := 0;
        USE_WRITERESPONSE: integer := 0;
        AVS_BE_W        : vl_notype;
        BURST_SIZE_W    : integer := 3;
        FIFO_DATA_W     : vl_notype
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        m0_address      : out    vl_logic_vector;
        m0_burstcount   : out    vl_logic_vector;
        m0_byteenable   : out    vl_logic_vector;
        m0_read         : out    vl_logic;
        m0_readdata     : in     vl_logic_vector;
        m0_waitrequest  : in     vl_logic;
        m0_write        : out    vl_logic;
        m0_writedata    : out    vl_logic_vector;
        m0_readdatavalid: in     vl_logic;
        m0_debugaccess  : out    vl_logic;
        m0_lock         : out    vl_logic;
        m0_response     : in     vl_logic_vector(1 downto 0);
        m0_writeresponserequest: out    vl_logic;
        m0_writeresponsevalid: in     vl_logic;
        rf_source_data  : out    vl_logic_vector;
        rf_source_valid : out    vl_logic;
        rf_source_startofpacket: out    vl_logic;
        rf_source_endofpacket: out    vl_logic;
        rf_source_ready : in     vl_logic;
        rf_sink_data    : in     vl_logic_vector;
        rf_sink_valid   : in     vl_logic;
        rf_sink_startofpacket: in     vl_logic;
        rf_sink_endofpacket: in     vl_logic;
        rf_sink_ready   : out    vl_logic;
        rdata_fifo_src_data: out    vl_logic_vector;
        rdata_fifo_src_valid: out    vl_logic;
        rdata_fifo_src_ready: in     vl_logic;
        rdata_fifo_sink_data: in     vl_logic_vector;
        rdata_fifo_sink_valid: in     vl_logic;
        rdata_fifo_sink_ready: out    vl_logic;
        cp_ready        : out    vl_logic;
        cp_valid        : in     vl_logic;
        cp_data         : in     vl_logic_vector;
        cp_channel      : in     vl_logic_vector;
        cp_startofpacket: in     vl_logic;
        cp_endofpacket  : in     vl_logic;
        rp_ready        : in     vl_logic;
        rp_valid        : out    vl_logic;
        rp_data         : out    vl_logic_vector;
        rp_startofpacket: out    vl_logic;
        rp_endofpacket  : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of PKT_BEGIN_BURST : constant is 1;
    attribute mti_svvh_generic_type of PKT_DATA_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_DATA_L : constant is 1;
    attribute mti_svvh_generic_type of PKT_SYMBOL_W : constant is 1;
    attribute mti_svvh_generic_type of PKT_BYTEEN_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_BYTEEN_L : constant is 1;
    attribute mti_svvh_generic_type of PKT_ADDR_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_ADDR_L : constant is 1;
    attribute mti_svvh_generic_type of PKT_TRANS_LOCK : constant is 1;
    attribute mti_svvh_generic_type of PKT_TRANS_COMPRESSED_READ : constant is 1;
    attribute mti_svvh_generic_type of PKT_TRANS_POSTED : constant is 1;
    attribute mti_svvh_generic_type of PKT_TRANS_WRITE : constant is 1;
    attribute mti_svvh_generic_type of PKT_TRANS_READ : constant is 1;
    attribute mti_svvh_generic_type of PKT_SRC_ID_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_SRC_ID_L : constant is 1;
    attribute mti_svvh_generic_type of PKT_DEST_ID_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_DEST_ID_L : constant is 1;
    attribute mti_svvh_generic_type of PKT_BURSTWRAP_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_BURSTWRAP_L : constant is 1;
    attribute mti_svvh_generic_type of PKT_BYTE_CNT_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_BYTE_CNT_L : constant is 1;
    attribute mti_svvh_generic_type of PKT_PROTECTION_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_PROTECTION_L : constant is 1;
    attribute mti_svvh_generic_type of PKT_RESPONSE_STATUS_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_RESPONSE_STATUS_L : constant is 1;
    attribute mti_svvh_generic_type of PKT_BURST_SIZE_H : constant is 1;
    attribute mti_svvh_generic_type of PKT_BURST_SIZE_L : constant is 1;
    attribute mti_svvh_generic_type of ST_DATA_W : constant is 1;
    attribute mti_svvh_generic_type of ST_CHANNEL_W : constant is 1;
    attribute mti_svvh_generic_type of ADDR_W : constant is 3;
    attribute mti_svvh_generic_type of AVS_DATA_W : constant is 3;
    attribute mti_svvh_generic_type of AVS_BURSTCOUNT_W : constant is 1;
    attribute mti_svvh_generic_type of PKT_SYMBOLS : constant is 3;
    attribute mti_svvh_generic_type of PREVENT_FIFO_OVERFLOW : constant is 1;
    attribute mti_svvh_generic_type of SUPPRESS_0_BYTEEN_CMD : constant is 1;
    attribute mti_svvh_generic_type of USE_READRESPONSE : constant is 1;
    attribute mti_svvh_generic_type of USE_WRITERESPONSE : constant is 1;
    attribute mti_svvh_generic_type of AVS_BE_W : constant is 3;
    attribute mti_svvh_generic_type of BURST_SIZE_W : constant is 1;
    attribute mti_svvh_generic_type of FIFO_DATA_W : constant is 3;
end altera_merlin_slave_agent;
