`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 08:43:46 AM
// Design Name: 
// Module Name: circule
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module circule #(parameter n = 8, parameter xc = 80, parameter yc = 60)(
input logic clk,
input logic reset,
input logic loady,
input logic [5:0] r,
input logic ysel,
input logic plot,
input logic force_r,
output logic signed [8:0] d,
output logic [7:0] x,
output logic [6:0] y,
output logic done
);

//localparameter xc = 80;
//localparameter yc = 60;


logic xen , XlessY, compD;
logic [n-1:0] counterxout, w1, w2;
logic [8:0]  w3, MUXrOrD;
logic [6:0] counteryout;
logic [5:0] compR;
logic [8:0] shift1out, subout1;
logic signed [8:0] shift2out;
logic [2:0] counter3;

Counter #(.n(8)) counterx(
.clk(clk),
.addsub(1'b1),
.en(xen),
.reset( force_r),
.data('b0),
.load(1'b0),
.count(counterxout)
    );

Counter #(.n(7)) countery(
.clk(clk),
.addsub(1'b0),
.en(~compD & den),
.reset(force_r),
.data({'b0,r}),
.load(loady),
.count(counteryout)
    );
    
    assign XlessY = (counterxout <= counteryout)? 1'b1 : 1'b0;
    
Counter #(.n(3)) counter3bit(
.clk(clk),
.addsub(1'b1),
.en(XlessY & plot),
.reset( force_r),
.data('b0),
.load(1'b0),
.count(counter3)
    );
    
    assign xen = (counter3 == 3'b110);
    assign den = (counter3 == 3'b111);
    
//Shift_reg #(.n(6))shift1(
//.clk(clk),
//.reset(reset),
//.en(loady),
//.data(r),
//.out(shift1out)
//    );

assign compR = (r > 59 )? 59 : r;

assign shift1out =  compR << 1'b1;

SUB #(.n(9)) s1(
.A(3),
.B(shift1out),
.sub(subout1)
    );
    
    assign MUXrOrD = (ysel)? w3 :subout1;
    
register #(.n(9)) regD(
.clk(clk),
.reset( force_r),
.en(den | loady),
.data(MUXrOrD),
.out(d)
    );

assign compD = (d < 0)? 1'b1:1'b0;

assign w1 = (counter3[1]) ? counterxout : counteryout;
assign w2 = (~counter3[1]) ? counterxout : counteryout;

ALU #(.n(8))ALUx(
.A(xc),
.B(w1),
.sel(counter3[0]),
.result(x)
    );
    
ALU #(.n(8))ALUy(
.A(yc),
.B(w2),
.sel(counter3[2]),
.result(y)
    );
    
assign shift2out = (compD) ? counterxout << 2'b10: ((counterxout-counteryout) << 2'b10);

always @(*) begin
    if(compD)
        w3 = d + shift2out + 6;
    else
        w3 = d + shift2out + 10;
end

assign done = ~XlessY;
    
endmodule

