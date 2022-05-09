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

module ALU_1(a,b,cin,binv,slt,op,as,r,cout);
input a;
input b;
input cin;
input binv;
input slt;
input [1:0]op;
output as;
output r;
output cout;
wire x,y,z;
and a1(x,a,b);
or or1(y,a,b);
addsub as1(a,b,cin,binv,z,cout);
assign r=(op==0)?x:(op==1)?y:(op==2)?z:(op==3)?slt:0;
assign as=z;
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
wire q,s,p;
assign s=0;
assign q=0;
ALU_1 alu1_1(a[0],b[0],cin,binv,p,op,s,r[0],x);
ALU_1 alu1_2(a[1],b[1],x,binv,q,op,s,r[1],y);
ALU_1 alu1_3(a[2],b[2],y,binv,q,op,s,r[2],z);
ALU_1 alu1_4(a[3],b[3],z,binv,q,op,p,r[3],OF);
nor n1(ZF,r[0],r[1],r[2],r[3]);
assign SF=p;
endmodule

module test_ALU_4();
reg [3:0]a;
reg [3:0]b;
reg cin,binv;
reg[1:0]op;
wire [3:0]r;
wire CF,ZF,SF;
ALU_4 alu4(a,b,cin,binv,op,r,ZF,CF,SF);
initial begin
    a=3; b=4; cin=0; binv=0; op=0;
#30 a=4; b=9; cin=0; binv=0; op=0;
#30 a=3; b=6; cin=0; binv=0; op=0;
#30 a=5; b=7; cin=0; binv=0; op=0;
#30 a=3; b=6; cin=0; binv=0; op=1;
#30 a=2; b=3; cin=0; binv=0; op=1;
#30 a=6; b=5; cin=0; binv=0; op=1;
#30 a=5; b=7; cin=0; binv=0; op=1;

#30 a=3; b=6; cin=0; binv=0; op=2;
#30 a=5; b=5; cin=0; binv=0; op=2;
#30 a=7; b=6; cin=0; binv=0; op=2;
#30 a=9; b=3; cin=0; binv=0; op=2;

#30 a=10; b=5; cin=1; binv=1; op=2;
#30 a=9; b=3; cin=1; binv=1; op=2;
#30 a=8; b=4; cin=1; binv=1; op=2;
#30 a=4; b=1; cin=1; binv=1; op=2;

#30 a=10; b=5; cin=1; binv=1; op=3;
#30 a=9; b=3; cin=1; binv=1; op=3;
#30 a=3; b=10; cin=1; binv=1; op=3;
#30 a=2; b=9; cin=1; binv=1; op=3;

end
endmodule
