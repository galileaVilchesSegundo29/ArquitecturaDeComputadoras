LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY CODER00 IS 
    PORT(
        CLKC: IN STD_LOGIC;
        RESETC: IN STD_LOGIC;
        RWC: IN STD_LOGIC;
        INKEYC: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        INCONTC: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        OUTWORDC: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        OUTCONTC: INOUT STD_LOGIC_VECTOR(4 DOWNTO 0);
        OUTFLAGC: OUT STD_LOGIC);
END CODER00;

ARCHITECTURE A_CODER00 OF CODER00 IS
SIGNAL SCONTROLCODER: STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
    SCONTROLCODER <= (RESETC)&(RWC);
    PCODER: PROCESS(CLKC)
    VARIABLE AUX1: BIT:='0';
    VARIABLE AUX2: BIT:='0';
    VARIABLE AUX3: BIT:='0';
    VARIABLE AUX4: BIT:='0';
    BEGIN
        IF(CLKC'EVENT AND CLKC='1')THEN
            CASE SCONTROLCODER IS
                WHEN "00" =>
                    OUTCONTC <= (OTHERS => '0');
                    OUTWORDC <= (OTHERS => '0');
                    OUTFLAGC <= '0';
                WHEN "10" =>
                    CASE INCONTC IS
                        WHEN "1000" =>
                            CASE INKEYC IS
                                WHEN "0000" =>
                                    AUX1:='0';
                                    OUTCONTC <= OUTCONTC;
                                    OUTFLAGC <= '0';
                                WHEN "0001" =>
                                    IF(AUX1 = '0')THEN
                                        AUX1:='1';
                                        OUTWORDC <= "0110000";  --1
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "0010" =>
                                    IF(AUX1 = '0')THEN
                                        AUX1:='1';
                                        OUTWORDC <= "1101101";  --2
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "0100" =>
                                    IF(AUX1 = '0')THEN
                                        AUX1:='1';
                                        OUTWORDC <= "1111001";  --3
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "1000" =>
                                    IF(AUX1 = '0')THEN
                                        AUX1:='1';
                                        OUTWORDC <= "1110111";  --A
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
                                WHEN OTHERS => NULL;
                            END CASE;
--*************************************************************--
                        WHEN "0100" =>
                            CASE INKEYC IS
                                WHEN "0000" =>
                                    AUX2:='0';
                                    OUTCONTC <= OUTCONTC;
                                    OUTFLAGC <= '0';
                                WHEN "0001" =>
                                    IF(AUX2 = '0')THEN
                                        AUX2:='1';
                                        OUTWORDC <= "0110011";  --4
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "0010" =>
                                    IF(AUX2 = '0')THEN
                                        AUX2:='1';
                                        OUTWORDC <= "1011011";  --5
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "0100" =>
                                    IF(AUX2 = '0')THEN
                                        AUX2:='1';
                                        OUTWORDC <= "1011111";  --6
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "1000" =>
                                    IF(AUX2 = '0')THEN
                                        AUX2:='1';
                                        OUTWORDC <= "0011111";  --b
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
                                WHEN OTHERS => NULL;
                            END CASE;
--*************************************************************--
                        WHEN "0010" =>
                            CASE INKEYC IS
                                WHEN "0000" =>
                                    AUX3:='0';
                                    OUTCONTC <= OUTCONTC;
                                    OUTFLAGC <= '0';
                                WHEN "0001" =>
                                    IF(AUX3 = '0')THEN
                                        AUX3:='1';
                                        OUTWORDC <= "1110000";  --7
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "0010" =>
                                    IF(AUX3 = '0')THEN
                                        AUX3:='1';
                                        OUTWORDC <= "1111111";  --8
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "0100" =>
                                    IF(AUX3 = '0')THEN
                                        AUX3:='1';
                                        OUTWORDC <= "1110011";  --9
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "1000" =>
                                    IF(AUX3 = '0')THEN
                                        AUX3:='1';
                                        OUTWORDC <= "1001110";  --C
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
                                WHEN OTHERS => NULL;
                            END CASE;
--*************************************************************--
                        WHEN "0001" =>
                            CASE INKEYC IS
                                WHEN "0000" =>
                                    AUX4:='0';
                                    OUTCONTC <= OUTCONTC;
                                    OUTFLAGC <= '0';
                                WHEN "0001" =>
                                    IF(AUX4 = '0')THEN
                                        AUX4:='1';
                                        OUTWORDC <= "1111110";  --0
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "0010" =>
                                    IF(AUX4 = '0')THEN
                                        AUX4:='1';
                                        OUTWORDC <= "1100011";  --*
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "0100" =>
                                    IF(AUX4 = '0')THEN
                                        AUX4:='1';
                                        OUTWORDC <= "0011101";  --+
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
        ---------------------------------------------------------
                                WHEN "1000" =>
                                    IF(AUX4 = '0')THEN
                                        AUX4:='1';
                                        OUTWORDC <= "0000001";  --(-)
                                        OUTCONTC <= OUTCONTC + '1';
                                        OUTFLAGC <= '1';
                                    ELSE
                                        OUTCONTC <= OUTCONTC;
                                        OUTFLAGC <= '0';
                                    END IF;
                                WHEN OTHERS => NULL;
                            END CASE;
--*************************************************************--
                        WHEN OTHERS => NULL;
                    END CASE;                    
                WHEN OTHERS => NULL;
            END CASE;
        END IF;
    END PROCESS PCODER;
END A_CODER00;