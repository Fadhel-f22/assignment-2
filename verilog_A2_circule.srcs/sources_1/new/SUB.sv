`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 01:03:19 PM
// Design Name: 
// Module Name: SUB
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


module SUB #(parameter n = 8)(
input logic [n-1:0] A,
input logic [n-1:0] B,
output logic [n-1:0] sub
    );
    
    always @(*) begin
        sub = A - B;
    end 
endmodule
