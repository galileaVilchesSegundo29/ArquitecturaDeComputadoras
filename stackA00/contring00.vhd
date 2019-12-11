LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY CONTRING00 IS
    PORT(
        CLKR: IN STD_LOGIC;
        RESETR: IN STD_LOGIC;
        OUTR: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END CONTRING00;

ARCHITECTURE A_CONTRING00 OF CONTRING00 IS 
SIGNAL SRING: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    PRING: PROCESS(CLKR)
    BEGIN
        IF(CLKR'EVENT AND CLKR='1') THEN
            CASE RESETR IS
                WHEN '0' => 
                    OUTR <= (OTHERS => '0');
                    SRING <= "1000";
                WHEN '1' => 
                    SRING(3) <= SRING(0);
                    SRING(2 DOWNTO 0) <= SRING(3 DOWNTO 1);
                    OUTR <= SRING;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PRING;
END A_CONTRING00;