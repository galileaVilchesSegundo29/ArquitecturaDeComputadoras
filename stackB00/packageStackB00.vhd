LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

PACKAGE PACKAGESTACKB00 IS
    COMPONENT topdiv00
        PORT(
            cdiv0: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            oscout0: INOUT STD_LOGIC);
    END COMPONENT;

    COMPONENT contring00 
        PORT(
            CLKR: IN STD_LOGIC;
            RESETR: IN STD_LOGIC;
            OUTR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    COMPONENT coder00
        PORT(
            CLKC: IN STD_LOGIC;
            RESETC: IN STD_LOGIC;
            RWC: IN STD_LOGIC;
            INKEYC: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            INCONTC: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            OUTWORDC: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            OUTCONTC: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0);
            OUTFLAGC: OUT STD_LOGIC;
            OUTCONTCR: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT stackB00
        PORT(
            CLKMRA: IN STD_LOGIC;
            RESETMRA: IN STD_LOGIC;
            RWMRA: IN STD_LOGIC;
            INDIRWMRA: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            INDIRRMRA: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            INWORDMRA: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            INFLAGMRA: IN STD_LOGIC;
            OUTWORDMRA: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT;

    COMPONENT contRead00
        PORT(
            CLKCR, RESETCR, RWCR: IN STD_LOGIC;
            INCONTWCR: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            OUTCONTCR: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0);
            OUTCONTC: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT muxStackB00
        PORT(
            RESETM, RWM: IN STD_LOGIC;
            INWORDCM, INWORDRM: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            OUTWORDM: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT;
END PACKAGESTACKB00;

