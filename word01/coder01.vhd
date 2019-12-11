LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY CODER00 IS 
    PORT(
        INCONTC: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTCODERC: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END CODER00;

ARCHITECTURE A_CODER00 OF CODER00 IS
BEGIN
    WITH INCONTC SELECT 
        OUTCODERC <= "0110111" WHEN "0001",
                     "1111110" WHEN "0010",
                     "0001110" WHEN "0100",
                     "1110111" WHEN "1000",
                     "0000000" WHEN OTHERS;
END A_CODER00;