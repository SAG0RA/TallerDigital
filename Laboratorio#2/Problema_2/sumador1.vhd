library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


--Declaracion del modulo
entity sumador1 is
	Port ( inA : in STD_LOGIC;
			 inB : in STD_LOGIC;
			 Cin : in STD_LOGIC;
			 Sum1: out STD_LOGIC;
			 Cout: out STD_LOGIC);
end sumador1;

architecture Structural of sumador1 is


-- Declaracion de las operaciones
begin

	Sum1 <= inA XOR inB XOR Cin;
	Cout <= (inA AND inB) OR (Cin AND inA) OR (Cin AND inB);

end Structural;