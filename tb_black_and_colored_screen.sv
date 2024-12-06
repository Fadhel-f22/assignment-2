`timescale 1ns / 1ps


module tb_black_and_colored_screen;

    logic clk;           // input
    logic reset_n;       // input
    logic start_black;   // input
    logic start_color;   // input
    logic plot;
    logic [7:0] x;
    logic [6:0] y;
    logic [2:0] color;

TOP_Black_and_colored top (
    .clk(clk),
    .reset_n(reset_n),
    .start_black(start_black),
    .start_color(start_color),
    .plot(plot),
    .x(x),
    .y(y),
    .color(color));

always #5 clk = ~clk;
initial begin
#5
    clk = 1'b0;
    reset_n = 1'b0;
    start_black = 1'b0;
    start_color = 1'b0;    
#10
    reset_n = 1'b1;
#10
    start_black = 1'b1;
    start_color = 1'b0;    
#10
    start_black = 1'b1;
    start_color = 1'b0;    
#10
    start_black = 1'b0;
    start_color = 1'b0;    
#1500
    start_black = 1'b0;
    start_color = 1'b1;    
#10
    start_black = 1'b0;
    start_color = 1'b1;    
        
#3000
$finish;
end
endmodule








//module tb_black_and_colored_screen #(
//    parameter nx = 8, 
//    parameter ny = 7, 
//    parameter res_cond_x = 159,
//    parameter res_cond_y = 119);
    
//    logic clk;
//    logic reset_n;
//    logic start;
//    logic sel_Black_Or_Color;
//    logic plot;
//    logic [2:0] color;
//    logic [nx-1:0] count_x;
//    logic back;
//    logic [ny-1:0] count_y;

//black_and_colored_screen #(
//    .nx(nx),
//    .ny(ny),
//    .res_cond_x(res_cond_x),
//    .res_cond_y(res_cond_y)) test (
//    .back(back),
//    .clk(clk), 
//    .reset_n(reset_n),
//    .start(start),
//    .sel_Black_Or_Color(sel_Black_Or_Color),
//    .plot(plot),
//    .color(color),
//    .count_x(count_x),
//    .count_y(count_y));
    
    
    
//always #5 clk = ~clk;    
//initial begin
//#5    
//    clk = 1'b0;
//    reset_n = 1'b0;
//    sel_Black_Or_Color = 1'b0;
//    start = 1'b0;
//#10
//    reset_n = 1'b1;
//#10 
//    start = 1'b1;    

//#1500
//   sel_Black_Or_Color = 1'b1;  

//#300000    
//$finish;
//end    
//endmodule
