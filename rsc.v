module rsc(out1,out2,in,clk,reset);
input [7:0]in;
output [7:0] out1;
output [7:0] out2;
input reset;
reg a,b;
reg prev;
input clk;
integer i;
wire [7:0]in;
reg [7:0] out1;
reg [7:0] out2;
initial 
begin
out1 = 0;
out2 = 0;
i=0;
end
always @ (posedge clk)
begin
if (reset == 1)
begin
a = 1'b0;
b = 1'b0;
out1 = 8'b00000000;
out2 = 8'b00000000;

end
else
begin
for (i = 0; i<8; i=i+1)
begin
prev = in[i];
out1[i] = prev ^ b;
out2[i] = prev ^ a ^ b;
b = a;
a = prev;
end 
end
end
endmodule 

module tb_rsc();
reg [7:0]p;
reg q;
reg r;
wire [7:0]s;
wire [7:0]t;
rsc r1(.out1(s),.out2(t),.in(p),.clk(q),.reset(r));
initial
begin
r = 1'b1;
q = 1'b0;
p = 8'b11010101;
#6 r = 1'b0;
end
always 
#5 q = ~q;
endmodule