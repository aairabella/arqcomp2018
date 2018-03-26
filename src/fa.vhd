library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fa is
    port (
        A_i   : in  std_logic;
        B_i   : in  std_logic;
        C_i   : in  std_logic;
        S_o   : out std_logic;
        C_o   : out std_logic
          );
end entity;

architecture fa_arch of fa is

begin
    -- Suma
    S_o <=  A_i xor B_i xor C_i;
    -- Carry Out
    C_o <= (A_i and B_i) or (C_i and (A_i or B_i));

end architecture fa_arch;
