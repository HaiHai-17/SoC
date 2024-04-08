module bai92_tb();
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
bai92 DUT (
 clk,
 reset_n
 );
endmodule