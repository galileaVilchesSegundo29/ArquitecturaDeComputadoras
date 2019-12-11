LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;
USE PACKAGEKEY00.ALL;

ENTITY TOPKEY00 IS
    PORT(
        CLK0: INOUT STD_LOGIC;
        CDIV00: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        RESET0: IN STD_LOGIC;
        INKEY0: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTR0: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTTRANSIST0: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTCODER0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END TOPKEY00;

ARCHITECTURE A_TOPKEY00 OF TOPKEY00 IS
SIGNAL SOUTCR: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL SOUTCODER: STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN
    OUTTRANSIST0 <= "0001";
    OUTR0 <= SOUTCR;
    OUTCODER0 <= SOUTCODER;

    K00: topdiv00 PORT MAP(
        OSCOUT0 => CLK0,
        CDIV0 => CDIV00);

    K01: contring00 PORT MAP(
        CLKR => CLK0,
        RESETR => RESET0,
        OUTR => SOUTCR);

    K02: coder00 PORT MAP(
        CLKC => CLK0,
        INKEYC => INKEY0,
        INCONTC => SOUTCR,
        OUTCODERC => SOUTCODER);
END A_TOPKEY00;