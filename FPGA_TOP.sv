`timescale 1ns / 1ps


module FPGA_TOP(
    
    input logic [15:0] SW,
    input logic BTNC,
    input logic CLK100MHZ,
    input logic CPU_RESETN,
    output logic [3:0] VGA_R,               // VGA red channel
    output logic [3:0] VGA_G,               // VGA green channel
    output logic [3:0] VGA_B,               // VGA blue channel
    output logic VGA_HS,                    // Horizontal sync
    output logic VGA_VS,
    output logic [3:0] LED    
    );
    
logic [7:0] count_x;
logic [6:0] count_y;
logic [2:0] color;
logic plot;

TOP_Black_and_colored BC (
    .clk(CLK100MHZ),            
    .reset_n(CPU_RESETN),         
    .start_black(SW[15]),
    .start_color(SW[14]),
    .plot(plot),
    .x(count_x),
    .y(count_y),
    .color(color));
    
    
    
vga_core VGA (
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B),
    .VGA_HS(VGA_HS),
    .VGA_VS(VGA_VS),
    .x(count_x),
    .y(count_y),
    .color(color),
    .plot(plot),
    .clk(CLK100MHZ),
    .resetn(CPU_RESETN));

    
assign LED[2:0] = color;
    
endmodule
