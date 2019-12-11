LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY ROM00 IS 
    PORT(
        CLKRO, RESETRO: IN STD_LOGIC;
        INDIRRO: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        OUTWORDRO: INOUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END ROM00;

ARCHITECTURE A_ROM00 OF ROM00 IS
TYPE ARRAYROM IS ARRAY(0 TO 63) OF STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL WORDROM: ARRAYROM:=("0110111",   --H
                           "1111110",   --O
                           "0001110",   --L
                           "1110111",   --A
                           "0000001",   --(-)
                           "0110000",   --1
                           "1101101",   --2
                           "1111001",   --3
                           "0110011",   --4
                           "1011011",   --5
                           OTHERS => "0000000");
BEGIN
    PROM: PROCESS(CLKRO)
    BEGIN
        IF(CLKRO'EVENT AND CLKRO='1')THEN
            CASE RESETRO IS
                WHEN '0' =>
                    OUTWORDRO <= (OTHERS => '0');
                WHEN '1' =>
                    OUTWORDRO <= WORDROM(CONV_INTEGER(INDIRRO));
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PROM;
END A_ROM00;