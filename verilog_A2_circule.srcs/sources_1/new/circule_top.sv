`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 06:42:28 PM
// Design Name: 
// Module Name: circule_top
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


module circule_top(
input logic clk,
input logic reset,
input logic start_c,
input logic [5:0] r,
input logic [2:0] color,
output logic plot,
output logic [7:0] x,
output logic [6:0] y
    );
    
    wire ysel,done,loady , force_f;
    wire [8:0] d;
    
circule datapath(
.clk(clk),
.reset(reset),
.loady(loady),
.r(r),
.plot(plot),
.ysel(ysel),
.force_r(force_f),
.x(x),
.y(y),
.d(d),
.done(done)
);

FSM_circule cu(
.reset(reset),
.clk(clk),
.start_C(start_c),
.done(done),
.plot(plot),
.force_f(force_f),
.d(d),
.yload(loady),
.ysel(ysel)
    );

endmodule
