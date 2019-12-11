LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY BARRELRL00 IS 
    PORT(
        CLKBRL, RESETBRL: IN STD_LOGIC;
        INBRL: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        CONTROLBRL: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTBRL: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END BARRELRL00 ;

ARCHITECTURE A_BARRELRL00  OF BARRELRL00  IS 
    SIGNAL BRL: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL BCONT: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    PBRL: PROCESS(CLKBRL)
    BEGIN
        IF(CLKBRL'EVENT AND CLKBRL='1') THEN
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
        END IF;
    END PROCESS PBRL;
END A_BARRELRL00 ;