LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE PACKAGEDIV00.ALL;

ENTITY TOPDIV00 IS
    PORT(
        cdiv0: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        oscout0: INOUT STD_LOGIC);
END TOPDIV00;

ARCHITECTURE A_TOPDIV00 OF TOPDIV00 IS
SIGNAL SCLK: STD_LOGIC;
BEGIN
    D00: osc00 PORT MAP(
        OSC_INT => SCLK);
    D01: div00 PORT MAP(
        CLKDIV => SCLK,
        CDIV => cdiv0,
        OSCOUT => oscout0);
END A_TOPDIV00;