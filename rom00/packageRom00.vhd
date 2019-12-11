LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

PACKAGE PACKAGEROM00 IS
    COMPONENT topdiv00
        PORT(
            cdiv0: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            oscout0: INOUT STD_LOGIC);
    END COMPONENT;

    COMPONENT rom00
        PORT(
            CLKRO, RESETRO: IN STD_LOGIC;
            INDIRRO: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            OUTWORDRO: INOUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT contRead00
        PORT(
            CLKCR, RESETCR: IN STD_LOGIC;
            OUTCONTCR: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0)
        );
    END COMPONENT;
END PACKAGEROM00;