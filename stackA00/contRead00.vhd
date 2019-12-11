LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY CONTREAD00 IS 
    PORT(
        CLKCR, RESETCR, RWCR: IN STD_LOGIC;
        INCONTWCR: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        OUTCONTCR: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
END CONTREAD00;

ARCHITECTURE A_CONTREAD00 OF CONTREAD00 IS 
SIGNAL SCONTROLC: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    SCONTROLC <= (RESETCR)&(RWCR);
    PREAD: PROCESS(CLKCR)
    BEGIN
        IF(CLKCR'EVENT AND CLKCR='1')THEN
            CASE SCONTROLC IS
                WHEN "00" =>
                    OUTCONTCR <= "00000";
                WHEN "10" =>
                    OUTCONTCR <= INCONTWCR;               --Para Stack A
                WHEN "11" =>
                    IF(OUTCONTCR > "00000")THEN         --Cambiar la desigualdad para Stack A
                        OUTCONTCR <= OUTCONTCR - '1';     --Para Stack A
                    ELSE
                        OUTCONTCR <= OUTCONTCR;
                    END IF;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PREAD;
END A_CONTREAD00;