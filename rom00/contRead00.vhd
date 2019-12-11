LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY CONTREAD00 IS 
    PORT(
        CLKCR, RESETCR: IN STD_LOGIC;
        OUTCONTCR: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
END CONTREAD00;

ARCHITECTURE A_CONTREAD00 OF CONTREAD00 IS
BEGIN
    PCONT: PROCESS(CLKCR)
    BEGIN
        IF(CLKCR'EVENT AND CLKCR='1')THEN
            CASE RESETCR IS
                WHEN '0' =>
                    OUTCONTCR <= (OTHERS => '0');
                WHEN '1' =>
                    IF(OUTCONTCR < "01001")THEN
                        OUTCONTCR <= OUTCONTCR + '1';
                    ELSE
                        OUTCONTCR <= OUTCONTCR;
                    END IF;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PCONT;
END A_CONTREAD00;