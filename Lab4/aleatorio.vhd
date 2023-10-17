library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LCG_PRNG_Decimal is
  Port ( clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         rand_out : out INTEGER range 0 to 7);
end LCG_PRNG_Decimal;

architecture Behavioral of LCG_PRNG_Decimal is
  signal seed : INTEGER range 0 to 7 := 2;  -- Inicialización con 2 (puede ser otro valor inicial)
begin
  process (clk, reset)
    variable next_seed : INTEGER range 0 to 7;
  begin
    if reset = '1' then
      seed <= 2;  -- Restablecer la semilla a 2 (puede ser otro valor inicial)
    elsif rising_edge(clk) then
      -- Algoritmo LCG
      next_seed := (seed * 5 + 3) mod 8;
      seed <= next_seed;
    end if;
  end process;

  rand_out <= seed;
end Behavioral;
