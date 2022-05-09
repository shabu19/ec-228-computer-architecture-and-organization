module program_counter (input clk, clr, output reg [3:0]address);

always@(posedge clk)
begin
	if(clr)
	address<=0;
	else
	address<=address+1;
end
endmodule


module test_program_counter();

reg clk,clr;
wire [3:0]address;

program_counter i_pc(clk,clr,address);

always
#20 clk=~clk;

initial begin
clk=0; clr=1;
#30 clr=0;
end

endmodule