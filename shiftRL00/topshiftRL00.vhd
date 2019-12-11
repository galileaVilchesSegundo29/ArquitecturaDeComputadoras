LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE PACKAGESHIFTRL00.ALL;

ENTITY TOPSHIFTRL00 IS 
    PORT(
        CLK0: INOUT STD_LOGIC;
        CDIV00: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        RESET0: IN STD_LOGIC;
        INS0: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        OUTS0: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END TOPSHIFTRL00;

ARCHITECTURE A_TOPSHIFTRL00 OF TOPSHIFTRL00 IS 
BEGIN
    SR00: topdiv00 PORT MAP(
        OSCOUT0 => CLK0,
        CDIV0 => CDIV00);
    SR01: shiftRL00 PORT MAP(
        CLKRL => CLK0,
        RESETRL => RESET0,
        INRSRL => INS0,
        OUTRSRL => OUTS0);
END A_TOPSHIFTRL00;