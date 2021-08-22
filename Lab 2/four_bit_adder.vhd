library IEEE;
use IEEE.std_logic_1164.all;

entity four_bit_adder is
  port (
  	A_4bit[3:0], B_4bit[3:0], Cin_4bit : in std_logic;
    Z_4bit[3:0], Cout_4bit : out std_logic
  );
end four_bit_adder;

architecture behavior of four_bit_adder is
  begin
  component one_bit_adder
    	port (
        	A: in std_logic;
            B: in std_logic;
            Cin: in std_logic;
            Z: out std_logic;
            cout: out std_logic
        );
    end component;
    
    signal c: std_logic_vector(2 downto 0);
    
  	u1 : one_bit_adder port map(A=>A_4bit[0],B=>B_4bit[0],Cin=>Cin_4bit,Z_4bit[0],Cout=>c[0]);
    
    u2 : one_bit_adder port map(A=>A_4bit[1],B=>B_4bit[1],Cin=>c[0],Z_4bit[1],Cout=>c[1]);
    
    u3 : one_bit_adder port map(A=>A_4bit[2],B=>B_4bit[2],Cin=>c[1],Z_4bit[2],Cout=>c[2]);
    
    u4 : one_bit_adder port map(A=>A_4bit[3],B=>B_4bit[3],Cin=>c[2],Z_4bit[3],Cout=>Cout_4bit);
 
end behavior;
