LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

PACKAGE PACKAGEKEY00 IS
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
            INKEYC: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            INCONTC: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            OUTCODERC: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT;
END PACKAGEKEY00;