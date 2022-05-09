////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////Program Counter/////////////////////////////////////////////////////////////////////////////

module program_counter (input clk, clr, output reg [3:0]address);

always@(posedge clk)
begin
	if(!clr)
	address<=0;
	else
	address<=address+1;
end
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////Register File////////////////////////////////////////////////////////////////////////////////

module reg_file(
		input [1:0]read_add1,read_add2,
		input [1:0]write_add,
		input wr,
		input clr,clk,
		input [3:0]write_data,
		output reg [3:0]read_data1,read_data2);

reg [3:0]register[3:0];

always@(posedge clk)
begin
	if(!clr)
	begin
		register[0]<=2;
		register[1]<=4;
		register[2]<=6;
		register[3]<=8;
	end
	else
	begin
		if(!wr)
		begin
			register[write_add]<=write_data;
		end
		else
		begin
			read_data1<=register[read_add1];
			read_data2<=register[read_add2];
		end
	end
end
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////4bit ALU////////////////////////////////////////////////////////////////////////////////

module adder(a,b,cin,s,c);
input a;
input b;
input cin;
output s;
output c;
wire x,y,z;
xor x1(x,a,b);
xor x2(s,x,cin);
and a1(y,x,cin);
and a2(z,a,b);
or o1(c,y,z);
endmodule

module addsub(a,b,cin,binv,s,c);
input a;
input b;
input cin;
input binv;
output s;
output c;
wire bb;
wire cin;
assign bb=(binv==1)?~b:b;
adder add1(a,bb,cin,s,c);
endmodule

module ALU_1(a,b,cin,binv,slt,op,r,cout);
input a;
input b;
input cin;
input binv;
input slt;
input [1:0]op;
output r;
output cout;
wire x,y,z;
and a1(x,a,b);
or or1(y,a,b);
addsub as1(a,b,cin,binv,z,cout);
assign r=(op==0)?x:(op==1)?y:(op==2)?z:(op==3)?slt:0;
endmodule

module ALU_4(a,b,cin,binv,op,r,ZF,OF,SF);
input [3:0]a;
input [3:0]b;
input cin;
input binv;
input [1:0]op;
output [3:0]r;
output ZF,OF,SF;
wire x,y,z;
wire q;
assign q=0;
ALU_1 alu1_1(a[0],b[0],cin,binv,z,op,r[0],x);
ALU_1 alu1_2(a[1],b[1],x,binv,q,op,r[1],y);
ALU_1 alu1_3(a[2],b[2],y,binv,q,op,r[2],z);
ALU_1 alu1_4(a[3],b[3],z,binv,q,op,r[3],OF);
nor n1(ZF,r[0],r[1],r[2],r[3]);
assign SF=z;
endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////Data Path/////////////////////////////////////////////////////////////////////////////////

module data_path(
		input clk,
		input clr,
		input wr,
		input cin,
		input binv,
		input [1:0]op,
		output [3:0]address_pc,
		input [15:0]instruction,
		output [3:0]address_alu);

wire [3:0]rf_alu_a;
wire [3:0]rf_alu_b;
wire ZF,OF,SF;

program_counter i_pc(clk,clr,address_pc);
reg_file i_rf(instruction[7:6],instruction[5:4],instruction[3:2],wr,clr,clk,address_alu,rf_alu_a,rf_alu_b);
ALU_4 i_alu4(rf_alu_a,rf_alu_b,cin,binv,op,address_alu,ZF,OF,SF);

endmodule

module test_data_path();
reg clk;
reg clr;
reg wr;
reg cin;
reg binv;
reg [1:0]op;
wire [3:0]address_pc;
reg [15:0]instruction;
wire [3:0]address_alu;

data_path i_dp(clk,clr,wr,cin,binv,op,address_pc,instruction,address_alu);

initial 
clk=0;
always
#5 clk=~clk;

initial begin
clr=0;
#6 clr=1; 
#1 instruction=16'b0000000000000000; cin=0; binv=0; wr=1; op=2;
#9 instruction=16'b0000000010101000; cin=1; binv=1; wr=1; op=2;


end

endmodule
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
