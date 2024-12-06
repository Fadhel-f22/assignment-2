`timescale 1ns / 1ps

module black_and_colored_screen #(
    parameter nx = 8, 
    parameter ny = 7, 
    parameter res_cond_x = 159,
    parameter res_cond_y = 119)(
    
    input logic clk,
    input logic reset_n,
//    input logic start,
    input logic sel_Black_Or_Color,
    input logic plot,
    output logic [2:0] color,
    output logic back,
    output logic [nx-1:0] count_x,
    output logic [ny-1:0] count_y
    );

//logic back;
logic w1;
logic w2;


//assign en_counter = start;

// counter x [0 <= x < 160]

counter_A2 #(.n(nx), .count_cond(res_cond_x)) counterX (
    .clk(clk), 
    .reset_n(reset_n), 
    .en(plot), 
    .another_reset(w1), 
    .count(count_x));

// counter y [0 <= y < 120]

counter_A2 #(.n(ny), .count_cond(res_cond_y)) counterY (
    .clk(clk), 
    .reset_n(reset_n), 
    .en(w1), 
    .another_reset(back), 
    .count(count_y));


// cpmparator for x

always @ (*)
begin
    if (count_x >= 158)
        w1 = 1'b1;
    else 
        w1 = 1'b0;
end

// cpmparator for y

always @ (*)
begin
    if (count_y >= 118)
        w2 = 1'b1;
    else 
        w2 = 1'b0;
end  


// and gate for comparators
 
assign back = w1 & w2; 

// Flip_Flop

//logic D;
//logic Q;

//always @ (posedge clk, negedge reset_n)
//begin
//    if (!reset_n)
//        Q <= 1'b0;
//    else if (back)
//        Q <= sel_Black_Or_Color;
                   
//end

// color conditions (MUX)

assign color = sel_Black_Or_Color ? count_y[2:0] : 3'b000;

     
//typedef enum logic [2:0] {
//IDLE,
//black,
//colored
//} state_t;

//state_t current_state, next_state;

//// State transition on clock edge
 
//always @ ( posedge clk, negedge reset_n) 
//begin
//    if (!reset_n)
//        current_state <= IDLE;
//    else
//        current_state <= next_state;
//end    

//// Next-state logic

//always @ (current_state, back, en_counter, sel_Black_Or_Color)
//begin
//    case (current_state)
    
//        IDLE: next_state = (en_counter & ~sel_Black_Or_Color) ? black :
//        (en_counter & sel_Black_Or_Color) ? colored : IDLE;
//        black: next_state = back ? IDLE : black;
//        colored: next_state = back ? IDLE : colored;
//        default: next_state = IDLE;
    
//    endcase
//end     

//// Output logic

//always_comb 
//begin
//    plot = ((current_state == black) | (current_state == colored));
//    sel_Black_Or_Color = (current_state == colored)? 1'b1: 1'b0;
//end
    
endmodule