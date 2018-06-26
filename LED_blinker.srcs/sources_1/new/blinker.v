`timescale 1ns / 1ps
module blinker(clk,reset,select,pause,led);
     
 input clk,reset,pause;     // Default clock = 125MHz, Reset and Pause inputs for obeservation.
 input [2:0] select;        // Select modes
 output [3:0] led;          // LEDs on-board
 reg internal_rst;          // Internal Reset during mode selection
 reg [3:0] led;
 reg [26:0] counter;        // Counter for delay
 reg [2:0] sel_delay;   
 wire rst;
 parameter delay = 7812500; // delay of 0.0625 Sec. delay = {125,62.5,31.25} * 10^6 for varied time delay.
 assign rst = internal_rst | reset; 
 always @ (posedge clk)
 case (select)
      3'b000 : begin        //up-Counter
                    if  (rst == 1)
                         begin
                         led <= 4'b0;
                         counter <= 0;
                         end
                    else begin
                         if  (counter == delay-1 && pause == 0)
                              begin                                 
                              led <= led + 4'b0001;
                              counter <= 0;
                              end
                         else if  (pause == 0)
                                   begin // Counter increments from 0 to (delay-1)
                                   counter <= counter + 1;
                                   end
                         end
               end
      3'b001 : begin        //down-Counter
                    if  (rst == 1)
                         begin
                         led <= 4'b1111;
                         counter <= 0;
                         end
                    else begin
                         if  (counter == delay-1 && pause == 0)
                              begin
                              led <= led - 4'b0001;
                              counter <= 0;
                              end
                         else if  (pause == 0)
                                   begin // Counter increments from 0 to (delay-1)
                                   counter <= counter + 1;
                                   end
                         end
               end
      3'b010 : begin        //left-shifter
                    if  (rst == 1)
                         begin
                         led <= 4'b0001;
                         counter <= 0;
                         end
                    else begin
                         if  (counter == delay-1 && pause == 0)
                              begin
                              led <=  led<<1; 
                              led[0] <=led[3];
                              counter <= 0;
                              end
                         else if  (pause == 0)
                                   begin // Counter increments from 0 to (delay-1)
                                   counter <= counter + 1;
                                   end
                         end
               end			   
      3'b011 : begin        //right-shifter
                    if  (rst == 1)
                         begin
                         led <= 4'b1000;
                         counter <= 0;
                         end
                    else begin
                         if  (counter == delay-1 && pause == 0)
                              begin
                              led <=  led>>1; 
                              led[3] <=led[0];
                              counter <= 0;
                              end
                         else if  (pause == 0)
                                   begin // Counter increments from 0 to (delay-1)
                                   counter <= counter + 1;
                                   end
                         end
               end                                                         
     default : begin
               led <= 4'b0; 
               end
 endcase
 always @ (posedge clk)
       begin                // Change in mode triggers internal_reset.
       sel_delay <= select;   
       internal_rst <= (sel_delay[2] ^ select[2]) | (sel_delay[1] ^ select[1]) | (sel_delay[0] ^ select[0]);
       end
            
 endmodule