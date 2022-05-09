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
assign bb=(binv==1&&cin==1)?~b:b;
adder add1(a,bb,cin,s,c);
endmodule

module ALU_1(a,b,cin,binv,op,r,cout);
input a;
input b;
input cin;
input binv;
input [1:0]op;
output r;
output cout;
wire x,y,z;
and a1(x,a,b);
or or1(y,a,b);
addsub as1(a,b,cin,binv,z,cout);
assign r=(op==0)?x:(op==1)?y:(op==2)?z:0;
endmodule

module test_ALU_1();
reg a,b,cin,binv;
reg[1:0]op;
wire r,cout;
ALU_1 alu1(a,b,cin,binv,op,r,cout);
initial begin
    a=0; b=0; cin=0; binv=0; op=0;
#30 a=0; b=1; cin=0; binv=0; op=0;
#30 a=1; b=0; cin=0; binv=0; op=0;
#30 a=1; b=1; cin=0; binv=0; op=0;
#30 a=0; b=0; cin=0; binv=0; op=1;
#30 a=0; b=1; cin=0; binv=0; op=1;
#30 a=1; b=0; cin=0; binv=0; op=1;
#30 a=1; b=1; cin=0; binv=0; op=1;
#30 a=0; b=0; cin=0; binv=0; op=2;
#30 a=0; b=1; cin=0; binv=0; op=2;
#30 a=1; b=0; cin=0; binv=0; op=2;
#30 a=1; b=1; cin=0; binv=0; op=2;
#30 a=0; b=0; cin=1; binv=1; op=2;
#30 a=0; b=1; cin=1; binv=1; op=2;
#30 a=1; b=0; cin=1; binv=1; op=2;
#30 a=1; b=1; cin=1; binv=1; op=2;
end
endmodule