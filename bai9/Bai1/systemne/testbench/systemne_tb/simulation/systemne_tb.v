// systemne_tb.v

// Generated using ACDS version 13.0sp1 232 at 2024.04.09.10:18:27

`timescale 1 ps / 1 ps
module systemne_tb (
	);

	wire    systemne_inst_clk_bfm_clk_clk;       // systemne_inst_clk_bfm:clk -> [systemne_inst:clk_clk, systemne_inst_reset_bfm:clk]
	wire    systemne_inst_reset_bfm_reset_reset; // systemne_inst_reset_bfm:reset -> systemne_inst:reset_reset_n

	systemne systemne_inst (
		.clk_clk       (systemne_inst_clk_bfm_clk_clk),       //   clk.clk
		.reset_reset_n (systemne_inst_reset_bfm_reset_reset)  // reset.reset_n
	);

	altera_avalon_clock_source #(
		.CLOCK_RATE (50000000),
		.CLOCK_UNIT (1)
	) systemne_inst_clk_bfm (
		.clk (systemne_inst_clk_bfm_clk_clk)  // clk.clk
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (0),
		.INITIAL_RESET_CYCLES (50)
	) systemne_inst_reset_bfm (
		.reset (systemne_inst_reset_bfm_reset_reset), // reset.reset_n
		.clk   (systemne_inst_clk_bfm_clk_clk)        //   clk.clk
	);

endmodule