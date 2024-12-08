`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2024 04:31:07 PM
// Design Name: 
// Module Name: FPGA_top
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


module FPGA_top(
    input wire CLK100MHZ,    // using the same name as pin names
    input wire CPU_RESETN,
    input wire BTNC, 
    input wire BTNU,
    output wire [3:0] VGA_R,               // VGA red channel
    output wire [3:0] VGA_G,               // VGA green channel
    output wire [3:0] VGA_B,               // VGA blue channel
    output wire VGA_HS,                    // Horizontal sync
    output wire VGA_VS,                     // Vertical sync
    input wire [15:0] SW     
);


logic reset_n;
logic clk;
assign reset_n = CPU_RESETN;
assign clk = CLK100MHZ;

logic [7:0] count_x;
logic [6:0] count_y;
//logic [2:0] color;
logic plot;

vga_core dut(
.clk(clk),                        // Clock input
.resetn(reset_n),                      // resetn signal
.x(count_x),                    // X-coordinate (8 bits for 160)
.y(count_y),                    // Y-coordinate (7 bits for 120)
.color(SW[2:0]),                // Pixel color input (3 bits)
.plot(plot),                       // Write enable
.VGA_R(VGA_R),               // VGA red channel
.VGA_G(VGA_G),               // VGA green channel
.VGA_B(VGA_B),               // VGA blue channel
.VGA_HS(VGA_HS),                    // Horizontal sync
.VGA_VS(VGA_VS)                     // Vertical sync
);

//TOP_Black_and_colored BC (
//    .clk(CLK100MHZ),            
//    .reset_n(CPU_RESETN),         
//    .start_black(SW[15]),
//    .start_color(SW[14]),
//    .plot(plot),
//    .x(count_x),
//    .y(count_y),
//    .color(color)
//    );
    
circule_top(
.clk(clk),
.reset(reset_n),
.start_c(BTNC),
.r(SW[7:3]),
.color(SW[2:0]),
.plot(plot),
.x(count_x),
.y(count_y)
    );


endmodule
