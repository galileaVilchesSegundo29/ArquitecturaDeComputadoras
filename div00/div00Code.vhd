LIBRARY LATTICE;
USE LATTICE.ALL;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY DIV00 IS 
    PORT(
        CLKDIV : IN STD_LOGIC;
        CDIV: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        OSCOUT: INOUT STD_LOGIC);
END DIV00;

ARCHITECTURE A_DIV00 OF DIV00 IS
    SIGNAL SDIV : STD_LOGIC_VECTOR(21 DOWNTO 0);
BEGIN
    PDIV: PROCESS(CLKDIV)
    BEGIN
        IF(CLKDIV'EVENT AND CLKDIV='1') THEN
            CASE CDIV IS 
                WHEN "00000" => 
                    IF(SDIV> "1000000000000000000000") THEN
                        SDIV <= (OTHERS => '0');
                        OSCOUT <= NOT(OSCOUT);
                    ELSE
                        SDIV <= SDIV+'1';
                        OSCOUT <= OSCOUT;
                    END IF;
                WHEN "00001" => 
                    IF(SDIV> "0100000000000000000000") THEN
                        SDIV <= (OTHERS => '0');
                        OSCOUT <= NOT(OSCOUT);
                    ELSE
                        SDIV <= SDIV+'1';
                        OSCOUT <= OSCOUT;
                    END IF;
                WHEN "00011" => 
                    IF(SDIV> "0010000000000000000000") THEN
                        SDIV <= (OTHERS => '0');
                        OSCOUT <= NOT(OSCOUT);
                    ELSE
                        SDIV <= SDIV+'1';
                        OSCOUT <= OSCOUT;
                    END IF;
                WHEN "00010" => 
                    IF(SDIV> "0001000000000000000000") THEN
                        SDIV <= (OTHERS => '0');
                        OSCOUT <= NOT(OSCOUT);
                    ELSE
                        SDIV <= SDIV+'1';
                        OSCOUT <= OSCOUT;
                    END IF;
                WHEN "00110" => 
                    IF(SDIV> "0000100000000000000000") THEN
                        SDIV <= (OTHERS => '0');
                        OSCOUT <= NOT(OSCOUT);
                    ELSE
                        SDIV <= SDIV+'1';
                        OSCOUT <= OSCOUT;
                    END IF;
                WHEN "00111" => 
                    IF(SDIV> "0000010000000000000000") THEN
                        SDIV <= (OTHERS => '0');
                        OSCOUT <= NOT(OSCOUT);
                    ELSE
                        SDIV <= SDIV+'1';
                        OSCOUT <= OSCOUT;
                    END IF;
                WHEN "00101" => 
                    IF(SDIV> "0000001000000000000000") THEN
                        SDIV <= (OTHERS => '0');
                        OSCOUT <= NOT(OSCOUT);
                    ELSE
                        SDIV <= SDIV+'1';
                        OSCOUT <= OSCOUT;
                    END IF;
                WHEN "00100" => 
                    IF(SDIV> "0000000100000000000000") THEN
                        SDIV <= (OTHERS => '0');
                        OSCOUT <= NOT(OSCOUT);
                    ELSE
                        SDIV <= SDIV+'1';
                        OSCOUT <= OSCOUT;
                    END IF;
                WHEN "01100" => 
                    IF(SDIV> "0000000010000000000000") THEN
                        SDIV <= (OTHERS => '0');
                        OSCOUT <= NOT(OSCOUT);
                    ELSE
                        SDIV <= SDIV+'1';
                        OSCOUT <= OSCOUT;
                    END IF;
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PDIV;
END A_DIV00;