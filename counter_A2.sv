`timescale 1ns / 1ps


module counter_A2 #(parameter n = 8 , parameter count_cond = 159)(
input logic clk,
input logic reset_n,
input logic en,
input logic another_reset,
output logic [n-1:0]count
    );
    
//logic res_cond;
//assign res_cond = (count > count_cond);
always @ (posedge clk , negedge reset_n)//, posedge res_cond)
begin
    if (!reset_n | another_reset) //| res_cond )
        count = 'b0;
    else if (en)
        count = count + 1;    
end 
endmodule
