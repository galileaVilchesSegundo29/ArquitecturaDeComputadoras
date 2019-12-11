LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY CODER00 IS 
    PORT(
        CLKC: IN STD_LOGIC;
        INKEYC: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        INCONTC: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTCODERC: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END CODER00;

ARCHITECTURE A_CODER00 OF CODER00 IS
BEGIN
    PCODER: PROCESS(CLKC)
    VARIABLE AUX: BIT:='0';
    BEGIN
        IF(CLKC'EVENT AND CLKC='1')THEN
            CASE INCONTC IS
                WHEN "1000" =>
                    CASE INKEYC IS
                        WHEN "0000" =>
                            AUX:='0';
                        WHEN "0001" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="0110000";  --1
                            END IF;
                        WHEN "0010" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1101101";  --2
                            END IF;
                        WHEN "0100" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1111001";  --3
                            END IF;
                        WHEN "1000" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1110111";  --A
                            END IF;
                        WHEN OTHERS => NULL;
                    END CASE;
    ---------------------------------------------------------                
                WHEN "0100" =>
                    CASE INKEYC IS
                        WHEN "0000" =>
                            AUX:='0';
                        WHEN "0001" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="0110011";  --4
                            END IF;
                        WHEN "0010" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1011011";  --5
                            END IF;
                        WHEN "0100" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1011111";  --6
                            END IF;
                        WHEN "1000" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="0011111";  --b
                            END IF;
                        WHEN OTHERS => NULL;
                    END CASE;
    ---------------------------------------------------------                
                WHEN "0010" =>
                    CASE INKEYC IS
                        WHEN "0000" =>
                            AUX:='0';
                        WHEN "0001" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1110000";  --7
                            END IF;
                        WHEN "0010" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1111111";  --8
                            END IF;
                        WHEN "0100" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1110011";  --9
                            END IF;
                        WHEN "1000" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1001110";  --C
                            END IF;
                        WHEN OTHERS => NULL;
                    END CASE;
    ---------------------------------------------------------                
                WHEN "0001" =>
                    CASE INKEYC IS
                        WHEN "0000" =>
                            AUX:='0';
                        WHEN "0001" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1100011"; -- *
                            END IF;
                        WHEN "0010" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="1111110"; -- 0
                            END IF;
                        WHEN "0100" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="0011101";  --+
                            END IF;
                        WHEN "1000" =>
                            IF(AUX = '0')THEN
                                AUX:='1';
                                OUTCODERC <="0000001";  --(-)
                            END IF;
                        WHEN OTHERS => NULL;
                    END CASE;
    --------------------------------------------------------- 
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PCODER;
END A_CODER00;