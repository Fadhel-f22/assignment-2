`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 01:02:56 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter n = 8)(
input logic [n-1:0] A,
input logic [n-1:0] B,
input logic sel,
output logic [n-1:0] result
    );
    
    always @(*) begin
        if (sel)
            result = A + B;
       else if (!sel)
            result = A - B;
    end
    
endmodule
