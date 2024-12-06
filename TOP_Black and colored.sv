`timescale 1ns / 1ps



module TOP_Black_and_colored(
    input logic clk,            
    input logic reset_n,         
    input logic start_black,
    input logic start_color,
    output logic plot,
    output logic [7:0] x,
    output logic [6:0] y,
    output logic [2:0] color
    );
    
    
logic w1; // sel_Black_Or_Color
logic w2; // plot 
logic w3; // back

 //Flip_Flop 1

logic D;
logic Q;

always @ (posedge clk, negedge reset_n)
begin
    if (!reset_n)
        Q <= 1'b0;
    else if (w3)
        Q <= start_color;
                   
end

 //Flip_Flop 2

logic d;
logic q;

always @ (posedge clk, negedge reset_n)
begin
    if (!reset_n)
        q <= 1'b0;
    else if (start_black | start_color)
        q <= 1'b1;
                   
end
  
black_and_colored_screen BCS (
    .clk(clk),
    .reset_n(reset_n),
    .count_x(x),
    .count_y(y),
    .sel_Black_Or_Color(Q),
    .plot(q),
    .back(w3),
    .color(color)
    );
    
    
FSM_A2 fsm (
    .clk(clk),
    .reset_n(reset_n),
    .start_black(start_black),
    .start_color(start_color),
    .back(w3),
    .plot(plot)
//    .sel_Black_Or_Color(w1)
    );        
    
endmodule
