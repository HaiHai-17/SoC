module bai91_tb();
reg clk;
reg reset_n;
reg chipSelect_n;
reg write_n;
reg read_n;
reg address;
reg idata;
reg odata;

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
bai91 BAI91 (
iclk (clk),
ireset_n (reset_n),
iChipSelect_n(chipSelect_n),
iWrite_n(write_n),
iRead_n(read_n),
iAddress(address),
iData(idata),
oData(odata),
);
endmodule