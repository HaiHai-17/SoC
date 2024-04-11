module lab7_part1_tb();
reg clk;
reg reset_n;
parameter PERIOD = 10;
initial
begin
clk <= 1'b0;
forever #(PERIOD) clk = ~ clk;
end
initial
begin
reset_n = 1'b1;
#20 reset_n = 1'b0;
#60 reset_n = 1'b1;
end
lab7_part1 DUT (
 clk,
 reset_n
 );
endmodule