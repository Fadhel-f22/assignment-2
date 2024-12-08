`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 06:50:04 PM
// Design Name: 
// Module Name: tb_circule
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


module tb_circule;

logic clk;           // input
    logic reset;       // input
    logic start_c;   // input
    logic plot;
    logic [5:0] r;
    logic [7:0] x;
    logic [6:0] y;
    logic [2:0] color;

circule_top top (
    .clk(clk),
    .reset(reset),
    .start_c(start_c),
    .r(r),
    .color(color),
    .plot(plot),
    .x(x),
    .y(y)
);
always #5 clk = ~clk;
initial begin
#5
    clk = 1'b0;
    reset = 1'b0;
    start_c = 1'b0;  
#10
    reset = 1'b1;
    color = 3'b101;
    r = 6'b001010;
#10
    start_c = 1'b1;   
#10

#30000
$finish;
end
endmodule
