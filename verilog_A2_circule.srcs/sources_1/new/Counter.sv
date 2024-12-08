`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2024 01:02:35 PM
// Design Name: 
// Module Name: Counter
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


module Counter #(parameter n = 8)(
input logic clk,
input logic en,
input logic addsub,
input logic reset,
input logic [n-1:0] data,
input logic load,
output logic [n-1:0] count
    );
    
    always @(posedge clk, negedge reset) begin
       if(!reset)
            count <= 0;
       else if (load)
            count <= data;
       else if (en) begin
            if (addsub)
                count <= count + 1;
            else 
                count <= count - 1;
       end

    end
endmodule
