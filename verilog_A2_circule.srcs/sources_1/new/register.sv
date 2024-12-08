`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 01:04:16 PM
// Design Name: 
// Module Name: register
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


module register #(parameter n = 8)(
input logic clk,
input logic reset,
input logic en,
input logic [n-1:0] data,
output logic [n-1:0] out
    );
    
    always @(posedge clk, negedge reset) begin
        if (!reset)
            out <= 0;
        else if (en)
            out <= data;
    end
endmodule
