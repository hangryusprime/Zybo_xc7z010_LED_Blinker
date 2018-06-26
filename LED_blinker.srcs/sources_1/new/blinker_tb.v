`timescale 1ns / 1ps

module blinker_tb();

reg clk,rst;
wire [3:0] led;

blinker DUT( .clk(clk),
             .rst(rst),
             .led(led)
            );
initial begin
clk = 0;
rst = 0;

#20 rst = 1;
#10 rst = 0;

end

always #10 clk = !clk; 
             
endmodule
