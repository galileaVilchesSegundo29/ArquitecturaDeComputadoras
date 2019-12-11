LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY BARREL00ALL IS 
    PORT(
        CLKBRL, RESETBRL: IN STD_LOGIC;
        INBRL: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        CONTROLBRL: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        INSELECTOR: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        OUTBRL: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END BARREL00ALL ;

ARCHITECTURE A_BARREL00ALL  OF BARREL00ALL  IS 
    SIGNAL BRL: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL BCONT: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    PBRL: PROCESS(CLKBRL)
    BEGIN
        IF(CLKBRL'EVENT AND CLKBRL='1') THEN
            CASE INSELECTOR IS
                WHEN "00" =>    --barrelRL
                    CASE RESETBRL IS
                        WHEN '0' => 
                            OUTBRL <= (OTHERS => '0');
                            BRL <= INBRL;
                            BCONT <= "0000";
                        WHEN '1' =>
                            IF(BCONT <= CONTROLBRL)THEN
                                BCONT <= BCONT+1;
                                BRL(0) <= '0';
                                BRL(7 DOWNTO 1) <= BRL(6 DOWNTO 0);
                                OUTBRL <= BRL;
                            END IF;
                        WHEN OTHERS => NULL;
                    END CASE;
                WHEN "01" =>    --barrelLR
                    CASE RESETBRL IS
                        WHEN '0' => 
                            OUTBRL <= (OTHERS => '0');
                            BRL <= INBRL;
                            BCONT <= "0000";
                        WHEN '1' =>
                            IF(BCONT <= CONTROLBRL)THEN
                                BCONT <= BCONT+1;
                                BRL(7) <= '0';
                                BRL(6 DOWNTO 0) <= BRL(7 DOWNTO 1);
                                OUTBRL <= BRL;
                            END IF;
                        WHEN OTHERS => NULL;
                    END CASE;
                WHEN "10" =>    --barrelrRL
                    CASE RESETBRL IS
                        WHEN '0' => 
                            OUTBRL <= (OTHERS => '0');
                            BRL <= INBRL;
                            BCONT <= "0000";
                        WHEN '1' =>
                            IF(BCONT <= CONTROLBRL)THEN
                                BCONT <= BCONT+1;
                                BRL(0) <= BRL(7);
                                BRL(7 DOWNTO 1) <= BRL(6 DOWNTO 0);
                                OUTBRL <= BRL;
                            END IF;
                        WHEN OTHERS => NULL;
                    END CASE;
                WHEN "11" =>    --barrelrLR
                    CASE RESETBRL IS
                        WHEN '0' => 
                            OUTBRL <= (OTHERS => '0');
                            BRL <= INBRL;
                            BCONT <= "0000";
                        WHEN '1' =>
                            IF(BCONT <= CONTROLBRL)THEN
                                BCONT <= BCONT+1;
                                BRL(7) <= BRL(0);
                                BRL(6 DOWNTO 0) <= BRL(7 DOWNTO 1);
                                OUTBRL <= BRL;
                            END IF;
                        WHEN OTHERS => NULL;
                    END CASE;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PBRL;
END A_BARREL00ALL ;