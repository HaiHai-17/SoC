module clock(CLOCK_50, KEY, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, LEDR, LEDG, LCD_ON, LCD_BLON, LCD_EN, LCD_RW, LCD_RS, LCD_DATA);
input					CLOCK_50;
input    [17:0]   SW;
input 	[3:0]		KEY;
output	[17:0] 	LEDR;
output	[3:0]		LEDG;
output	[6:0]		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
output   [0:0] 	LCD_ON, LCD_BLON, LCD_EN, LCD_RW, LCD_RS;
output   [7:0]		LCD_DATA;




    nios_sys u0 (
        .clk_clk                           (CLOCK_50),                           //   clk.clk
        .reset_reset_n                     (KEY[0]),                    		   //   reset.reset_n
        .hex7_external_connection_export   (HEX7),   										//   hex7_external_connection.export
        .hex6_external_connection_export   (HEX6),   										//   hex6_external_connection.export
        .hex5_external_connection_export   (HEX5),   										//   hex5_external_connection.export
        .hex4_external_connection_export   (HEX4),   										//   hex4_external_connection.export
        .hex3_external_connection_export   (HEX3),   										//   hex3_external_connection.export
        .hex2_external_connection_export   (HEX2),   										//   hex2_external_connection.export
        .hex1_external_connection_export   (HEX1),   										//   hex1_external_connection.export
        .hex0_external_connection_export   (HEX0),   										//   hex0_external_connection.export
        .ledr_external_connection_export   (LEDR),   										//   ledr_external_connection.export
        .switch_external_connection_export (SW),      									//   switch_external_connection.export
        .ledg_external_connection_export   (LEDG),   										//   ledg_external_connection.export
        .key_external_connection_export    (KEY),     									//   key_external_connection.export
		  .lcd_rs_external_connection_export   (LCD_RS),   								//   lcd_rs_external_connection.export
        .lcd_rw_external_connection_export   (LCD_RW),   								//   lcd_rw_external_connection.export
        .lcd_en_external_connection_export   (LCD_EN),   								//   lcd_en_external_connection.export
        .lcd_blon_external_connection_export (LCD_BLON),									//   lcd_blon_external_connection.export
        .lcd_on_external_connection_export   (LCD_ON),   								//   lcd_on_external_connection.export
        .lcd_d_external_connection_export    (LCD_DATA)     							//   lcd_d_external_connection.export
    );
	 
endmodule
