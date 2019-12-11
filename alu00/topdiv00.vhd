LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY LATTICE;
USE LATTICE.ALL;
USE PACKAGEDIV00.ALL;

ENTITY TOPDIV00 IS
	PORT(
		CDIV0:IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		CLK0:INOUT STD_LOGIC
	);
END ENTITY;
ARCHITECTURE A_TOPDIV00 OF TOPDIV00 IS
SIGNAL SCLK:STD_LOGIC;
BEGIN
	OS00: OSC00 PORT MAP(OSC_INT=>SCLK);
	OS01: DIV00 PORT MAP( 
		CLKDIV=>SCLK,
		INDIV=>CDIV0,
		OUTDIV=>CLK0
		);
END ARCHITECTURE;
