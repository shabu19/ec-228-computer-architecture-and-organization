module cep(
	input [3:0]a,
	input [3:0]b,
	output [3:0]aa,
	output [3:0]bb,
	output [3:0]c	);
	
assign aa=a&-1;
assign bb=b|aa;
assign c=(aa==bb)?aa+bb:aa-bb;
endmodule

module test_cep();

reg [3:0]a,b;
wire [3:0]aa,bb,c;

cep i_cep (a,b,aa,bb,c);

initial begin
a=-1;
b=2;
end
endmodule