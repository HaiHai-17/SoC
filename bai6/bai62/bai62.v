module bai62 (input CLOCK_50, 
input [1:0]KEY,
input UART_RXD, 
output UART_TXD, 
output UART_CTS, 
input UART_RTS);

system system(
	.clk_clk	(KEY[0]),
	.reset_reset_n (KEY[0]),
	.key_external_connection_export 	(KEY[1]),
	.uart_0_external_connection_rxd	(UART_RXD),
	.uart_0_external_connection_txd	(UART_TXD)
);

endmodule