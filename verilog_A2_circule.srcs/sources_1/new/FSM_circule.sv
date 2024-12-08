`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 03:59:05 PM
// Design Name: 
// Module Name: FSM_circule
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


module FSM_circule(
input logic reset,
input logic clk,
input logic start_C,
input logic done,
input logic [5:0] d,
output logic plot,
output logic yload,
output logic ysel
    );
    
    
    typedef enum logic [2:0] {
IDLE,
S1,
S2
} state_t;

state_t current_state, next_state;

// State transition on clock edge
 
always @ ( posedge clk, negedge reset) 
begin
    if (!reset)
        current_state <= IDLE;
    else
        current_state <= next_state;
end    

// Next-state logic

always @ (*)
begin
    case (current_state)
        IDLE: next_state = (start_C == 1'b1) ? S1 : IDLE;
        S1: next_state = (d != 0) ? S2 : S1;
        S2: next_state = (done == 1'b1) ? IDLE : S2;
        default: next_state = IDLE;
    endcase
end     

// Output logic

always_comb 
begin
    plot = (current_state == S2)? 1'b1 : 1'b0;
    yload = (current_state == S1)? 1'b1 : 1'b0;
    ysel = (current_state == S2)? 1'b1 : 1'b0;

end

endmodule
