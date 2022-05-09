module instruction_memory(
	input [3:0]instruction_address,
	input clr,
	output [15:0]instruction_data);

reg [15:0]mem[15:0];

assign instruction_data=mem[instruction_address];

always@(*)
begin
if(clr==0)
	begin
	mem[0]<=16'h0000;
	mem[1]<=16'h0001;
	mem[2]<=16'h0002;
	mem[3]<=16'h0003;
	mem[4]<=16'h0004;
	mem[5]<=16'h0005;
	mem[6]<=16'h0006;
	mem[7]<=16'h0007;
	mem[8]<=16'h0008;
	mem[9]<=16'h0009;
	mem[10]<=16'h000a;
	mem[11]<=16'h000b;
	mem[12]<=16'h000c;
	mem[13]<=16'h000d;
	mem[14]<=16'h000e;
	mem[15]<=16'h000f;
	end
end
endmodule 



module test_instruction_memory();

reg [3:0]instruction_address;
reg clr;
wire [15:0]instruction_data;

instruction_memory i_im(instruction_address, clr, instruction_data);

initial begin
clr=0;
#10 clr=1;
#10 instruction_address=0;
#10 instruction_address=1;
#10 instruction_address=2;
end
endmodule

