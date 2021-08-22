// Code your design here
`timescale 1ns / 1ps


module bin2bcd(
  input clk,
  input [3:0] four_bit_value,
  output reg [3:0] ones = 0,
  output reg [3:0] tens = 0
  );
  
  
  reg[3:0] i = 0;
  reg[11:0] shift_register = 0;
  reg[3:0] temp_tens = 0;
  reg[3:0] temp_ones = 0;
  
  
  reg[3:0] OLD_four_bit_value = 0;
  
  always@ (posedge clk) 
    begin
      if (i==0 & (OLD_four_bit_value != four_bit_value)) begin
       
        shift_register = 12'd0;
        
        OLD_four_bit_value = four_bit_value;
        
        shift_register[3:0] = four_bit_value;
        
        
        temp_tens = shift_register[11:8];
        temp_ones = shift_register[7:4];
        
        i=i+1;
        
      end
      if (i<5 & i>0) begin
        
        
        if (temp_tens >= 5) temp_tens = temp_tens+3;
        if (temp_ones >= 5) temp_ones = temp_ones+3;
        
        shift_register[11:4] = {temp_tens,temp_ones};
        
        shift_register = shift_register<<1;
        
         temp_tens = shift_register[11:8];
        temp_ones = shift_register[7:4];
        
        i=i+1;
        
      end
      if (i==5) begin
       	i = 0;
        
        tens = temp_tens;
        ones = temp_ones;
        
      end
    end
endmodule