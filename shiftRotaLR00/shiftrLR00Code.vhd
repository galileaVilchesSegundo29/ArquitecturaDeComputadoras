LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHIFTRLR00 IS 
    PORT(
        CLKLR, RESETLR: IN STD_LOGIC;
        INRSLR: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        --INCONTROL: IN STD_LOGIC_VECTOR(2 DOWNTO 0);  ->En un proyecto diferente. Para barrido.
        OUTRSLR: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END SHIFTRLR00;

ARCHITECTURE A_SHIFTRLR00 OF SHIFTRLR00 IS 
    SIGNAL SSR: STD_LOGIC_VECTOR(7 DOWNTO 0);
    --SIGNAL SCONTROL: STD_LOGIC_VECTOR(2 DOWNTO 0);    ->En un proyecto diferente.
BEGIN
    PSR: PROCESS(CLKLR)
    BEGIN
        IF(CLKLR'EVENT AND CLKLR='1') THEN
            CASE RESETLR IS
                WHEN '0' => 
                    OUTRSLR <= (OTHERS => '0');
                    SSR <= INRSLR;
                WHEN '1' =>
                    SSR(7) <= SSR(0);
                    SSR(6 DOWNTO 0) <= SSR(7 DOWNTO 1);
                    OUTRSLR <= SSR;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PSR;
END A_SHIFTRLR00;