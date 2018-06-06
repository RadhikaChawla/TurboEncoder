module turbo(outmain,in1,clck,res);
input [7:0] in1;
output [23:0] outmain;
input clck;
input res;
integer i = 0;
reg [7:0] outa;
reg [7:0] outb;
wire [7:0] outc;
reg [7:0] outd;
reg [7:0] oute;
reg [23:0] outmain;
initial 
begin 
outa = 0;
outb = 0;
outd = 0;
oute = 0;
end
rsc rx(.out1(outa),.out2(outb),.in(in1),.clk(clck),.reset(res));
inter ix(.out(outc),.in(in1),.clk(clck),.reset(res));
rsc ry(.out1(outd),.out2(oute),.in(outc),.clk(clck),.reset(res));
always @(posedge clck)
begin
for (i = 0; i<8; i = i+1)
begin
outmain[i] = in1[i];
outmain[i+8] = outb[i];
outmain[i+16] = oute[i];
end
end
endmodule