-- Universidad Nacional de San Luis
-- Facultad de Ciencias Fisico Matematicas y Naturales
--
-- Carrera: Ingenieria Electronica c/OSD
-- Materia: Arquitectura de Computadoras
--
-- Trabajo Practico N°2
-- 
-- Ripple Carry Adder (RCA)
-- Version 1.0

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rca is
    generic (
        DATA_WIDTH : integer :=	8
    );
    port (
        A_i	: in  std_logic_vector(DATA_WIDTH-1 downto 0);
        B_i : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        C_i : in  std_logic;
        S_o : out std_logic_vector(DATA_WIDTH-1 downto 0);
        C_o : out std_logic
    );
end entity;

architecture rca_arch of rca is

	component fa is
		port(
			A_i	: in  std_logic;
			B_i 	: in  std_logic;
			C_i 	: in  std_logic;
			S_o 	: out std_logic;
			C_o 	: out std_logic
		);
	end component;

	signal carry : std_logic_vector(DATA_WIDTH downto 0);

begin

	C_o      <= carry(DATA_WIDTH);
	carry(0) <= C_i;

	RCA:	for i in 0 to DATA_WIDTH-1 generate
				FA0: fa port map(
					A_i => A_i(i),
					B_i => B_i(i),
					C_i => carry(i),
					S_o => S_o(i),
					C_o => carry(i+1)
				);
			end generate;

end architecture rca_arch;