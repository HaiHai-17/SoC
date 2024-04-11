module vd1 (CLOCK_50, DRAM_CLK, DRAM_CKE,
					DRAM_ADDR, DRAM_BA_1, DRAM_BA_0, DRAM_CS_N, DRAM_CAS_N, DRAM_RAS_N,
					DRAM_WE_N, DRAM_DQ, DRAM_UDQM, DRAM_LDQM);
input CLOCK_50;
output [11:0] DRAM_ADDR;
output DRAM_BA_1, DRAM_BA_0, DRAM_CAS_N,DRAM_RAS_N, DRAM_CLK;
output DRAM_CKE, DRAM_CS_N, DRAM_WE_N, DRAM_UDQM,DRAM_LDQM;
inout [15:0] DRAM_DQ;
	system u0 (
		.clk_clk 	(CLOCK_50),
		.sdram_wire_addr (DRAM_ADDR),
		.sdram_wire_ba ({DRAM_BA_1, DRAM_BA_0}),
		.sdram_wire_cas_n (DRAM_CAS_N),
		.sdram_wire_cke (DRAM_CKE),
		.sdram_wire_cs_n (DRAM_CS_N),
		.sdram_wire_dq (DRAM_DQ),
		.sdram_wire_dqm ({DRAM_UDQM,DRAM_LDQM}),
		.sdram_wire_ras_n (DRAM_RAS_N),
		.sdram_wire_we_n (DRAM_WE_N)
	
	);
	
	assign DRAM_CLK = CLOCK_50;
endmodule