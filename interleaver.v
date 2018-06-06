module inter (out,in,clk,reset);
input [7:0] in;
input clk;
input reset;
output [7:0] out;
reg [3:0]a1;
reg [3:0]a2;
wire [7:0] in;
reg [7:0] out;
integer p,q;
initial 
begin
out = 0;
p = 0;
q = 0;
a1 = 0;
a2 = 0;
end

always @(negedge clk)
begin
 if (reset == 1)
begin
a1 = 0;
a2 = 0;
out = 0;
end 
 else 
begin
for (p = 0; p<4 ;p=p+1)
begin
a1[p] = in[p];
a2[p] = in[p+4];
end
for (q = 0; q < 4;q = q+1)
begin
out[(2*q)] = a1[q];
out[(2*q)+1] = a2[q];
end
end
end
endmodule

module tb_inter ();
reg [7:0]a;
reg b;
reg c;
wire [7:0]d;
inter i1(.out(d),.in(a),.clk(b),.reset(c));
initial 
begin 
a = 8'b10101010;
c = 1'b1;
b = 1'b0;
#6 c = 1'b0;
end
always 
#5 b = ~b;
endmodule 