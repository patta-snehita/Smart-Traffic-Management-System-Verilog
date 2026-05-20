`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller_tb(

    );


reg  clk,rst,sensor;
reg pedestrian;
reg emergency;
reg nightmode;
wire red,green,yellow;
wire [3:0]timer;
traffic_light_controller dut(clk,rst,sensor,pedestrian,emergency,nightmode,red,green,yellow,timer);
 
 
 initial begin   
 clk=0;
 rst=1;
 sensor=0;
 pedestrian=0;
 emergency=0;
 nightmode=0;
 
 end
 
 always
 begin
 #5 clk=~clk;
 end
 
 initial
 begin
$monitor("Time=%0t| rst=%b | sensor=%b | RED=%b | YELLOW=%b| GREEN=%b |timer=%d | pedestrian=%b |emergency=%b|nightmode=%b",
          $time,rst,sensor,red,yellow,green,timer,pedestrian,emergency,nightmode);
 
 #10;
 rst=0;
 #20;
 sensor=1;
 #20;
 sensor=0;
 pedestrian=1;
 #40;
 pedestrian=0;
 emergency=1;
 #20;
 emergency=0;
 nightmode=1;
 #20;
 nightmode=0;
 #50;
   
 $finish;
 end
 
 
 
 
 
 
   
endmodule
