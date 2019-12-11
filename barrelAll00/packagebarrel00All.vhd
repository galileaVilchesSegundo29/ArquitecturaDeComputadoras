LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

PACKAGE PACKAGEBARREL00ALL IS
    COMPONENT topdiv00
        PORT(
            cdiv0: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            oscout0: INOUT STD_LOGIC);
    END COMPONENT;

    COMPONENT barrel00All
        PORT(
            CLKBRL, RESETBRL: IN STD_LOGIC;
            INBRL: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            CONTROLBRL: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            INSELECTOR: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            OUTBRL: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
END PACKAGEBARREL00ALL;