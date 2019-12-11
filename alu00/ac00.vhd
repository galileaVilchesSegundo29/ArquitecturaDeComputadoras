LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY AC00 IS
    PORT(
            CLKAC: IN STD_LOGIC;
            ENABLEAC: IN STD_LOGIC;
            INFLAGAC: IN STD_LOGIC;
            INAC: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            OUTAC: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            OUTFLAGAC: OUT STD_LOGIC
        );
END AC00;

ARCHITECTURE A_AC00 OF AC00 IS
BEGIN
    PAC: PROCESS (CLKAC)
    BEGIN
        IF(CLKAC'EVENT AND CLKAC ='1') THEN
            CASE ENABLEAC IS
                WHEN '0' =>
                    OUTAC <=(OTHERS => '0');
                    OUTFLAGAC <= '0';
                WHEN '1' =>
                    CASE INFLAGAC IS
                        WHEN '0' =>
                            OUTAC <=(OTHERS => '0');
                            OUTFLAGAC <= '1';
                        WHEN '1' =>
                            OUTAC <= INAC;
                            OUTFLAGAC <= '1';
                        WHEN OTHERS => NULL;
                    END CASE;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PAC;
END A_AC00;

