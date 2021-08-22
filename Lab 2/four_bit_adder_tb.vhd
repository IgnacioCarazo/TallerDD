library IEEE;
use IEEE.std_logic_1164.all;

entity four_bit_adder_tb is
end four_bit_adder_tb;

architecture behavior of four_bit_adder_tb is

	component four_bit_adder
    	port (
        	A_4bit: in std_logic;
            B_4bit: in std_logic;
            Cin_4bit: in std_logic;
            Z_4bit: out std_logic;
            Cout_4bit: out std_logic
        );
    end component;
    
    
    --Inputs
    signal A_4bit: std_logic := '0000';
    signal B_4bit: std_logic := '0000';
    signal Cin_4bit: std_logic := '0';
    
    --Outputs
    signal Z_4bit: std_logic := '0000';
    signal Cout_4bit: std_logic := '0';
    
    
begin
    
    uut: one_bit_adder port map (
    	A_4bit => A_4bit,
        B_4bit => B_4bit,
        Cin_4bit => Cin_4bit,
        Z_4bit => Z_4bit,
        Cout_4bit => Cout_4bit
    );
    
    
    stim_proc: process
    begin
    	wait for 100 ns;
        --A<='0'; B<='0'; Cin<='1';
        --wait for 100 ns;
        --A<='0'; B<='1'; Cin<='0';
        --wait for 100 ns;
        --A<='0'; B<='1'; Cin<='1';
        --wait for 100 ns;
        --A<='1'; B<='0'; Cin<='0';
        --wait for 100 ns;
        --A<='1'; B<='0'; Cin<='1';
        --wait for 100 ns;
        --A<='1'; B<='1'; Cin<='0';
        --wait for 100 ns;
        --A<='1'; B<='1'; Cin<='1';
        
        
        wait;
    end process;
end;
    