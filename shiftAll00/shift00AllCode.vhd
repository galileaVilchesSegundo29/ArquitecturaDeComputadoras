LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHIFT00ALL IS 
    PORT(
        CLKSFT, RESETSFT: IN STD_LOGIC;
        INRSSFT: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        INSELECTOR: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        OUTRSSFT: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END SHIFT00ALL;

ARCHITECTURE A_SHIFT00ALL OF SHIFT00ALL IS 
    SIGNAL SSR: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    PSR: PROCESS(CLKSFT)
    BEGIN
        IF(CLKSFT'EVENT AND CLKSFT='1') THEN
            CASE INSELECTOR IS
                WHEN "00" =>    --shiftRL
                    CASE RESETSFT IS
                        WHEN '0' => 
                            OUTRSSFT <= (OTHERS => '0');
                            SSR <= INRSSFT;
                        WHEN '1' =>
                            SSR(0) <= '0';
                            SSR(7 DOWNTO 1) <= SSR(6 DOWNTO 0);
                            OUTRSSFT <= SSR;
                        WHEN OTHERS => NULL;
                    END CASE;
                WHEN "01" =>    --shiftLR
                    CASE RESETSFT IS
                        WHEN '0' => 
                            OUTRSSFT <= (OTHERS => '0');
                            SSR <= INRSSFT;
                        WHEN '1' =>
                            SSR(7) <= '0';
                            SSR(6 DOWNTO 0) <= SSR(7 DOWNTO 1);
                            OUTRSSFT <= SSR;
                        WHEN OTHERS => NULL;
                    END CASE;
                WHEN "10" =>    --shiftrRL
                    CASE RESETSFT IS
                        WHEN '0' => 
                            OUTRSSFT <= (OTHERS => '0');
                            SSR <= INRSSFT;
                        WHEN '1' =>
                            SSR(0) <= SSR(7);
                            SSR(7 DOWNTO 1) <= SSR(6 DOWNTO 0);
                            OUTRSSFT <= SSR;
                        WHEN OTHERS => NULL;
                    END CASE;
                WHEN "11" =>    --shiftrLR
                    CASE RESETSFT IS
                        WHEN '0' => 
                            OUTRSSFT <= (OTHERS => '0');
                            SSR <= INRSSFT;
                        WHEN '1' =>
                            SSR(7) <= SSR(0);
                            SSR(6 DOWNTO 0) <= SSR(7 DOWNTO 1);
                            OUTRSSFT <= SSR;
                        WHEN OTHERS => NULL;
                    END CASE;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PSR;
END A_SHIFT00ALL;