library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity rca_tb is
end entity;

architecture A1 of rca_tb is

component rca is
    generic (
        size : integer :=8 );
    port (
          A_i,B_i       : in std_logic_vector(size - 1 downto 0);
          C_i           : in std_logic;
		    S_o           : out std_logic_vector(size - 1 downto 0);
          C_o           : out std_logic);
		 
end component;

constant size: integer:=8;

signal A_s : std_logic_vector(size - 1 downto 0);
signal B_s : std_logic_vector(size - 1 downto 0);
signal C_i_s : std_logic;
signal S_s : std_logic_vector(size - 1 downto 0);
signal C_o_s : std_logic;


begin

test: rca
generic map (8) 
port map(
    A_i   => A_s,
    B_i   => B_s,
    C_i   => C_i_s,
	 S_o   =>  S_s,
	 C_o   =>  C_o_s);


testeo: process

variable suma : std_logic_vector(8 downto 0);


begin
for k in 0 to 1 loop
    for i in 0 to 2**8 -1 loop
        for j in 0 to 2**8 -1 loop
            A_s <= std_logic_vector(to_unsigned(i,8));
            B_s <= std_logic_vector(to_unsigned(j,8));
            
            if k = 1 then C_i_s <= '1';
            else C_i_s <= '0';
            end if;
            
            wait for 50 ns;

            suma := std_logic_vector(to_unsigned(i + j + k, (8 + 1)));
        
            end loop; 
        end loop; 

    end loop;

end process;
end architecture A1;
