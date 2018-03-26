library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fa_tb is
end entity;

architecture fa_arch_tb of fa_tb is


component fa is
    port (
        A_i   : in  std_logic;
        B_i   : in  std_logic;
        C_i   : in  std_logic;
        S_o   : out std_logic;
        C_o   : out std_logic
          );
end component;


signal A_i   :  std_logic;
signal B_i   :  std_logic;
signal C_i   :  std_logic;
signal S_o   :  std_logic;
signal C_o   :  std_logic;

-- Declaro Tipo Vector de Test
type test_vector is record
    A_i   :  std_logic;
    B_i   :  std_logic;
    C_i   :  std_logic;
    S_o   :  std_logic;
    C_o   :  std_logic;
end record; 

-- Declaro Tipo Arreglo de Vectores de Test
type test_vector_array is array(natural range<>) of test_vector;

-- Declaro y Lleno el array con los valores de prueba
constant t_v : test_vector_array := (
    -- Formo todas las combinaciones posibles para las entradas/Salidas
    (A_i => '0', B_i => '0', C_i => '0', S_o => '0', C_O => '0'), -- 000 = 00
    (A_i => '0', B_i => '0', C_i => '1', S_o => '1', C_O => '0'), -- 001 = 10
    (A_i => '0', B_i => '1', C_i => '0', S_o => '1', C_O => '0'), -- 010 = 10 
    (A_i => '0', B_i => '1', C_i => '1', S_o => '0', C_O => '1'), -- 011 = 01
    (A_i => '1', B_i => '0', C_i => '0', S_o => '1', C_O => '0'), -- 100 = 10
    (A_i => '1', B_i => '0', C_i => '1', S_o => '0', C_O => '1'), -- 101 = 01
    (A_i => '1', B_i => '1', C_i => '0', S_o => '0', C_O => '1'), -- 110 = 01
    (A_i => '1', B_i => '1', C_i => '1', S_o => '1', C_O => '1')  -- 111 = 11
);

begin

-- Instanciar el componente fa
fa1: fa port map
    (
    A_i => A_i,
    B_i => B_i,
    C_i => C_i,
    S_o => S_o,
    C_o => C_o
    );


process 
    variable vector: test_vector;
begin
    for i in t_v'range loop
        -- Leer el valor del vector i
        vector := t_v(i);

        -- Leo los valores y se los asigno a las seniales correspondientes
        A_i <= vector.A_i;
        B_i <= vector.B_i;
        C_i <= vector.C_i;

        wait for 20 ns;

        
    end loop;

end process;

end architecture fa_arch_tb;

