LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY ANDA00 IS
    PORT(
            CLKA: IN STD_LOGIC;
            INFLAGA: IN STD_LOGIC;
            FUNCTA: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
            INRSA:  IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            INRTA:  IN STD_LOGIC_VECTOR (7 DOWNTO 0);           
            OUTRDA:  OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
            OUTFLAGA: OUT STD_LOGIC
        );
END ANDA00;

ARCHITECTURE A_ANDA00 OF ANDA00 IS
BEGIN 
    PAND: PROCESS(CLKA)
    VARIABLE AUX: BIT:='0';
    BEGIN 
        IF(CLKA'EVENT AND CLKA = '1') THEN
            IF (FUNCTA ="000000") THEN
                CASE INFLAGA IS
                    WHEN '0'  =>
                        OUTRDA <=(OTHERS => '0');
                        OUTFLAGA <= '0';
                    WHEN '1' =>
                        IF (AUX ='0') THEN
                            AUX:='1';
                            OUTRDA <= INRSA AND INRTA;
                            OUTFLAGA <='1';
                        END IF;
                    WHEN OTHERS => NULL;
                END CASE;
            ELSE
                AUX:='0';
                OUTRDA<=(OTHERS=>'Z');
                OUTFLAGA<='Z';
            END IF;
        END IF;
    END PROCESS PAND;
END A_ANDA00;

