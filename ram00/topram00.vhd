LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;
USE PACKAGERAM00.ALL;

ENTITY TOPRAM00 IS
    PORT(
        CLK0: INOUT STD_LOGIC;
        CDIV00: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        RESET0: IN STD_LOGIC;
        INKEY0: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        RW0: IN STD_LOGIC;
        OUTR0: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTWORD0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        OUTTRANSIST0: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTCONTW0: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0);
        OUTCONTR0: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0);
        OUTFLAG0: INOUT STD_LOGIC
    );
END TOPRAM00;

ARCHITECTURE A_TOPRAM00 OF TOPRAM00 IS
SIGNAL SWORDW, SWORDR: STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
    OUTTRANSIST0 <= "0001";

    RA00: topdiv00 PORT MAP(
            OSCOUT0 => CLK0,
            CDIV0 => CDIV00);

    RA01: contring00 PORT MAP(
            CLKR => CLK0,
            RESETR => RESET0,
            OUTR => OUTR0);

    RA02: coder00 PORT MAP(
            CLKC => CLK0,
            RESETC => RESET0,
            RWC => RW0,
            INKEYC => INKEY0,
            INCONTC => OUTR0,
            OUTWORDC => SWORDW,
            OUTCONTC => OUTCONTW0,
            OUTFLAGC => OUTFLAG0);

    RA03: ram00 PORT MAP(
            CLKMRA => CLK0,
            RESETMRA => RESET0,
            RWMRA => RW0,
            INDIRWMRA => OUTCONTW0,
            INDIRRMRA => OUTCONTR0,
            INWORDMRA => SWORDW,
            INFLAGMRA => OUTFLAG0,
            OUTWORDMRA =>SWORDR);

    RA04: contRead00 PORT MAP(
            CLKCR => CLK0,
            RESETCR => RESET0,
            RWCR => RW0,
            INCONTWCR => OUTCONTW0,
            OUTCONTCR => OUTCONTR0);

    RA05: muxRam00 PORT MAP(
            RESETM => RESET0,
            RWM => RW0,
            INWORDCM => SWORDW,
            INWORDRM => SWORDR,
            OUTWORDM => OUTWORD0);
END A_TOPRAM00;