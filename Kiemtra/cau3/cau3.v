module cau3 (
input 		   CLOCK_50,
input  [0:0]   KEY,
output [7:0]   HEX0,
output [7:0]   HEX1,
output [7:0]   HEX2,
output [7:0]   HEX3,
output [7:0]   HEX4,
output [7:0]   HEX5,
output [7:0]   HEX6,
output [7:0]   HEX7
);

system Nios_system(
		.clk_clk		(CLOCK_50),
		.reset_reset_n	(KEY[0]),
		.hex_0_external_connection_export     ({7'd0, HEX0}),
		.hex_1_external_connection_export     ({7'd0, HEX1}),
		.hex_2_external_connection_export     ({7'd0, HEX2}),
		.hex_3_external_connection_export     ({7'd0, HEX3}),
		.hex_4_external_connection_export     ({7'd0, HEX4}),
		.hex_5_external_connection_export     ({7'd0, HEX5}),
		.hex_6_external_connection_export     ({7'd0, HEX6}),
		.hex_7_external_connection_export     ({7'd0, HEX7})
	);
	
endmodule