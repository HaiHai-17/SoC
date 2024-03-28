module bai61 (input CLOCK_50, 
input [0:0]KEY, 
input UART_RXD, 
output UART_TXD, 
output UART_CTS, 
input UART_RTS);

system system(
	.clk_clk (CLOCK_50),
	.reset_reset_n (KEY[0]),
	.uart_0_external_connection_rxd (UART_RXD),
	.uart_0_external_connection_txd (UART_TXD)
);
endmodule
