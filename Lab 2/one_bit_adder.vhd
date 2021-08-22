library IEEE;
use IEEE.std_logic_1164.all;

entity one_bit_adder is
  port (
  	A, B, Cin : in std_logic;
    Z, Cout : out std_logic
  );
end one_bit_adder;

architecture behavior of one_bit_adder is
  begin
  	Z <= A xor B xor Cin;
    Cout <= (A and B) or (B and Cin) or (Cin and A);
 
end behavior;
