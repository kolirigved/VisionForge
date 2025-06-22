  module parking_system(
             input clock_in,rst_in,
             input Front_Sensor, Back_Sensor,
             input [1:0]  pass_1, pass_2,
             output wire G_LED,R_LED,
             output reg [6:0] HEX_1, HEX_2
               );




   parameter IDLE = 3'b000, WAIT_PASSWORD = 3'b001, WRONG_PASS = 3'b010, RIGHT_PASS = 3'b011,STOP = 3'b100;
       reg[2:0] PS, NS;
       reg[31:0] cnt_wait;
       reg red_tmp,green_tmp;




         // Next state
         always @(posedge clock_in or negedge rst_in)
             begin
             if(~rst_in)
             PS = IDLE;
             else
             PS = NS;
         end




   // cnt_wait
   always @(posedge clock_in or negedge rst_in)
    begin
       if(~rst_in)
       cnt_wait <= 0;
       else if(PS==WAIT_PASSWORD)
       cnt_wait <= cnt_wait + 1;
       else
       cnt_wait <= 0;
    end




   // change state
     always @(*)
     begin
         case(PS)
           IDLE:
           begin
            if(Front_Sensor == 1)
              NS = WAIT_PASSWORD;
            else
              NS = IDLE;
            end


           WAIT_PASSWORD:
           begin
            if(cnt_wait <= 3)
              NS = WAIT_PASSWORD;
              else
            begin
             if((pass_1==2'b01)&&(pass_2==2'b10))
                 NS = RIGHT_PASS;
             else
               NS = WRONG_PASS;
             end
            end


           WRONG_PASS:
           begin
              if((pass_1==2'b01)&&(pass_2==2'b10))
              NS = RIGHT_PASS;
              else
              NS = WRONG_PASS;
              end


           RIGHT_PASS:
           begin
            if(Front_Sensor==1 && Back_Sensor == 1)
              NS = STOP;
            else if(Back_Sensor == 1)
              NS = IDLE;
            else
              NS = RIGHT_PASS;
            end


           STOP:
           begin
            if((pass_1==2'b01)&&(pass_2==2'b10))
              NS = RIGHT_PASS;
            else
              NS = STOP;
            end


           default: NS = IDLE;
      endcase
     end


   // LEDs and output, change the period of blinking LEDs here
       always @(posedge clock_in) begin


       case(PS)
         IDLE:
         begin
           green_tmp = 1'b0;
           red_tmp = 1'b0;
           HEX_1 = 7'b1111111; // off
           HEX_2 = 7'b1111111; // off
         end


         WAIT_PASSWORD:
         begin
           green_tmp = 1'b0;
           red_tmp = 1'b1;
           HEX_1 = 7'b000_0110; // E
           HEX_2 = 7'b010_1011; // n
         end


         WRONG_PASS:
         begin
           green_tmp = 1'b0;
           red_tmp = ~red_tmp;
           HEX_1 = 7'b000_0110; // E
           HEX_2 = 7'b000_0110; // E
         end


         RIGHT_PASS:
         begin
           green_tmp = ~green_tmp;
           red_tmp = 1'b0;
           HEX_1 = 7'b000_0010; // 6
           HEX_2 = 7'b100_0000; // 0
         end


         STOP:
         begin
           green_tmp = 1'b0;
           red_tmp = ~red_tmp;
           HEX_1 = 7'b001_0010; // 5
           HEX_2 = 7'b000_1100; // P
         end
      endcase
    end


      assign R_LED = red_tmp  ;


      assign G_LED = green_tmp;


  endmodule
