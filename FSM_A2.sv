`timescale 1ns / 1ps


module FSM_A2(
    input logic clk,
    input logic reset_n,
    input logic start_black,
    input logic start_color,
    input logic back,
    output logic plot
//    output logic sel_Black_Or_Color
    );
    
         
typedef enum logic [2:0] {
IDLE,
black,
colored
} state_t;

state_t current_state, next_state;

// State transition on clock edge
 
always @ ( posedge clk, negedge reset_n) 
begin
    if (!reset_n)
        current_state <= IDLE;
    else
        current_state <= next_state;
end    

// Next-state logic

always @ (current_state, start_color, start_black)
begin
    case (current_state)
    
        IDLE: next_state = (start_black) ? black :
        (start_color) ? colored : IDLE;
        black: next_state = (back) ? IDLE : black;
        colored: next_state = (back) ? IDLE : colored;
        default: next_state = IDLE;
    
    endcase
end     

// Output logic

always_comb 
begin
    plot = ((current_state == black) | (current_state == colored))? 1'b1 : 1'b0;
//    sel_Black_Or_Color = (current_state == colored)? 1'b1: 1'b0;
end
endmodule
