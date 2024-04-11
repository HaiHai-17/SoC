module vd2(
input CLOCK_50,
output [17:0]DRAM1_ADDR,
output DRAM1_BA_1, DRAM1_BA_0, DRAM1_CAS_N, DRAM1_RAS_N, DRAM1_CLK,
output DRAM1_CKE, DRAM1_CS_N, DRAM1_WE_N, DRAM1_UDQM, DRAM1_LDQM,
inout [15:0]DRAM1_DQ,
output [11:0]DRAM2_ADDR,
output DRAM2_BA_1,DRAM2_BA_0,DRAM2_CAS_N,DRAM2_RAS_N,DRAM2_CLK,
output DRAM2_CKE,DRAM2_CS_N,DRAM2_WE_N,DRAM2_UDQM,DRAM2_LDQM,
inout [15:0]DRAM2_DQ
);

system u0 (
        .clk_clk           (CLOCK_50),           //         clk.clk
        .sdram1_wire_addr  (DRAM1_ADDR),  // sdram1_wire.addr
        .sdram1_wire_ba    ({DRAM1_BA_1,DRAM1_BA_0}),    //            .ba
        .sdram1_wire_cas_n (DRAM1_CAS_N), //            .cas_n
        .sdram1_wire_cke   (DRAM1_CKE),   //            .cke
        .sdram1_wire_cs_n  (DRAM1_CS_N),  //            .cs_n
        .sdram1_wire_dq    (DRAM1_DQ),    //            .dq
        .sdram1_wire_dqm   ({DRAM1_UDQM,DRAM1_LDQM}),   //            .dqm
        .sdram1_wire_ras_n (DRAM1_RAS_N), //            .ras_n
        .sdram1_wire_we_n  (DRAM1_WE_N),  //            .we_n
        .sdram2_wire_addr  (DRAM2_ADDR),  // sdram2_wire.addr
        .sdram2_wire_ba    ({DRAM2_BA_1,DRAM2_BA_0}),    //            .ba
        .sdram2_wire_cas_n (DRAM2_CAS_N), //            .cas_n
        .sdram2_wire_cke   (DRAM2_CKE),   //            .cke
        .sdram2_wire_cs_n  (DRAM2_CS_N),  //            .cs_n
        .sdram2_wire_dq    (DRAM2_DQ),    //            .dq
        .sdram2_wire_dqm   ({DRAM2_UDQM,DRAM2_LDQM}),   //            .dqm
        .sdram2_wire_ras_n (DRAM2_RAS_N), //            .ras_n
        .sdram2_wire_we_n  (DRAM2_WE_N),  //            .we_n

    );

endmodule