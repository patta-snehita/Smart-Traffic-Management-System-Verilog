`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller(
    input clk,rst,sensor,
    input pedestrian,
    input emergency,
    input nightmode,
    output reg red,green,yellow,
    output reg [3:0]timer
    );
    parameter s0=3'b000, //red
             s1=3'b001, //red_yellow
             s2=3'b010,  //green
             s3=3'b011, //yellow
             s4=3'b100, //pedestrian
             s5=3'b101;
    reg [2:0] ps,ns;
    reg [3:0]count;
     //state register+counter
     //sequnetial logic
    always@(posedge clk or posedge rst )
    begin
    if(rst) begin
    ps<=s0;
    count<=0;
    end
    else
    begin
    ps<=ns;
    
    //reset counter when state changes
    if(ps!=ns)
      count<=0;
    else
     count<=count+1;
    end
    end
     //next state logic
     //combinational logic
    always@(*)
    begin
    case(ps)
    s0:begin                 //red
         if(nightmode)
         ns<=s5;
         else if(emergency)
         ns<=s2;
         else if(count<5)
         ns<=s0;
         else
         ns=s1;
       end
    s1:begin                  //red+yellow
       if(nightmode)
       ns<=s5;
       else if(emergency)
       ns<=s2;
       else if(count<2)
       ns<=s1;
       else
       ns<=s2;
       end
    s2:begin              //green
       if(nightmode)
       ns<=s5;
       else if(emergency)
       ns<=s2;
       else if(pedestrian)
       ns<=s3;
       else if(sensor)
       begin
         if(count<8)
          ns<=s2;
         else
          ns<=s3;
       end
       else
       begin
         if(count<5)
         ns=s2;
         else
         ns=s3;
       end
     end
    s3:begin              //yellow
        if(nightmode)
        ns=s5;
        else if(count<2)
        ns=s3;
        else if(pedestrian)
        ns=s4;
        else
        ns=s0; 
        end
   s4:begin   //pedestrian
      if(nightmode)
        ns=s5;
      else if(count<5)
        ns=s4;
      else
       ns=s0;
      end
   s5:begin     //nightmode
      if(nightmode)
       ns=s5;
       else
       ns=s0;
      end
   default:ns=s0;
    endcase
    end
    //output logic
    always@(*)
    begin
    red=0;
    yellow=0;
    green=0;
    timer=0;
    case(ps)
    
    s0:begin           //red
         red=1;
         timer=5-count;
       end
    s1:begin           //red+yellow
      red=1;
      yellow=1;
      timer=2-count;
      end
    s2:begin            //green
         green=1;
         if(sensor)
           timer=8-count;
         else
           timer=5-count;
       end
    s3:begin           //yellow
         yellow=1;
         timer=2-count;
       end
   s4:begin       //pedestrain    
        red=1;
        timer=5-count;
      end
   s5:begin      //blinking yellow
       yellow=count[0];
       timer=0;
       end
    default:begin
            red=0;
            yellow=0;
            green=0;
            end
    endcase
    end
    
    
    
    
endmodule
