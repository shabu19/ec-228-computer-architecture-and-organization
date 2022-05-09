module data_memory(
		input [3:0]address,
		input [3:0]write_data,
		input clk,
		input clr,
		input mrd,
		input mwr,
		output reg [3:0]read_data);

reg [3:0]mem[15:0];

always@(posedge clk)
begin
	if(!clr)
	begin
		mem[0]<=0;
		mem[1]<=1;
		mem[2]<=2;
		mem[3]<=3;
		mem[4]<=4;
		mem[5]<=5;
		mem[6]<=6;
		mem[7]<=7;
		mem[8]<=8;
		mem[9]<=9;
		mem[10]<=10;
		mem[11]<=11;
		mem[12]<=12;
		mem[13]<=13;
		mem[14]<=14;
		mem[15]<=15;

	end
	else
	begin
		if(!mrd)
		read_data<=mem[address];
		else if(!mwr)
		mem[address]<=write_data;
	end
end

endmodule

module test_data_memory();
reg clk,clr,mrd,mwr;
reg [3:0]address;
reg [3:0]write_data;
wire [3:0]read_data;

data_memory i_dm(address,write_data,clk,clr,mrd,mwr,read_data);

initial 
clk=0;
always
#5 clk=~clk;

initial
begin
clr=0;
#30 clr=1;mrd=1;mwr=1;
#30 mrd=0; address=7;
#30 mrd=1; mwr=0; write_data=11; address=5;
#30 mrd=0; mwr=1; address=5;

end

endmodule