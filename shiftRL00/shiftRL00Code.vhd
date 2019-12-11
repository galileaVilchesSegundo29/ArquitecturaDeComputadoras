LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHIFTRL00 IS 
    PORT(
        CLKRL, RESETRL: IN STD_LOGIC;
        INRSRL: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        --INCONTROL: IN STD_LOGIC_VECTOR(2 DOWNTO 0);  ->En un proyecto diferente. Para barrido.
        OUTRSRL: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END SHIFTRL00;

ARCHITECTURE A_SHIFTRL00 OF SHIFTRL00 IS 
    SIGNAL SSR: STD_LOGIC_VECTOR(7 DOWNTO 0);
    --SIGNAL SCONTROL: STD_LOGIC_VECTOR(2 DOWNTO 0);    ->En un proyecto diferente.
BEGIN
    PSR: PROCESS(CLKRL)
    BEGIN
        IF(CLKRL'EVENT AND CLKRL='1') THEN
            CASE RESETRL IS
                WHEN '0' => 
                    OUTRSRL <= (OTHERS => '0');
                    SSR <= INRSRL;
                WHEN '1' =>
                    SSR(0) <= '0';
                    SSR(7 DOWNTO 1) <= SSR(6 DOWNTO 0);
                    OUTRSRL <= SSR;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PSR;
END A_SHIFTRL00;