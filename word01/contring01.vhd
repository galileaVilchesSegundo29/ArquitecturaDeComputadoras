LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY CONTRING00 IS
    PORT(
        CLKS: IN STD_LOGIC;
        RESETS: IN STD_LOGIC;
        OUTS: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END CONTRING00;

ARCHITECTURE A_CONTRING00 OF CONTRING00 IS 
SIGNAL SSR: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    PRING: PROCESS(CLKS)
    BEGIN
        IF(CLKS'EVENT AND CLKS='1') THEN
            CASE RESETS IS
                WHEN '0' => 
                    OUTS <= "0000";
                    SSR <= "0001";
                WHEN '1' => 
                    SSR(0) <= SSR(3);
                    SSR(3 DOWNTO 1) <= SSR(2 DOWNTO 0);
                    OUTS <= SSR;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PRING;
END A_CONTRING00;