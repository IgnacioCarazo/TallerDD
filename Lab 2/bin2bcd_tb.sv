// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps


module testbench_bin2bcd;
  reg clk=0;
  reg[3:0] four_bit_value = 0;
 
  wire[3:0] tens;
  wire[3:0] ones;
  
  
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  end
  
  
  bin2bcd UUT (.clk(clk), .four_bit_value(four_bit_value), .tens(tens), .ones(ones));
  
  always #5 clk = ~clk;
  
  initial begin
    
    #100 four_bit_value = 4'b0000;
    #100 four_bit_value = 4'b0010;
    #100 four_bit_value = 4'b0011;
    #100 four_bit_value = 4'b0101;
    #100 four_bit_value = 4'b0111;
    #100 four_bit_value = 4'b1000;
    #100 four_bit_value = 4'b1100;
    #100 four_bit_value = 4'b1101;
    #100 four_bit_value = 4'b1111;
    #500
    $finish;

  end
endmodule
  
    