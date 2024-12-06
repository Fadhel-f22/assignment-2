`timescale 1ns / 1ps

module tb_counter_A2 #(parameter n = 7 , parameter count_cond = 119);
logic clk;
logic reset_n;
logic en;
logic another_reset;
logic [n-1:0]count;

counter_A2 #(.n(n), .count_cond(count_cond)) C (.clk(clk), .reset_n(reset_n), .en(en), .another_reset(another_reset), .count(count)); 

always #5 clk = ~clk;

initial begin
#5
    clk = 1'b0;
    reset_n = 1'b0;
    en = 1'b1;
    another_reset = 1'b0;
#10
    reset_n = 1'b1; 
    another_reset = 1'b0;
#50
    another_reset = 1'b1;
#10
    another_reset = 1'b0;    
        

#3000
$finish;
end

endmodule
