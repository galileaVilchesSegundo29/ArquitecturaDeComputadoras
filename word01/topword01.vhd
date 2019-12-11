LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;
USE PACKAGEWORD00.ALL;

ENTITY TOPWORD00 IS
    PORT(
        CLK0: INOUT STD_LOGIC;
        CDIV00: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        RESET0: IN STD_LOGIC;
        OUTTRANSIST0: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTCODER0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END TOPWORD00;

ARCHITECTURE A_TOPWORD00 OF TOPWORD00 IS
BEGIN
    W00: topdiv00 PORT MAP(
        OSCOUT0 => CLK0,
        CDIV0 => CDIV00);

    W01: contring00 PORT MAP(
        CLKS => CLK0,
        RESETS => RESET0,
        OUTS => OUTTRANSIST0);

    W02: coder00 PORT MAP(
        INCONTC => OUTTRANSIST0,
        OUTCODERC => OUTCODER0);
END A_TOPWORD00;