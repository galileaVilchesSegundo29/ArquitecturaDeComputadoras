LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY LCDCONFIG00 IS
  PORT(
       CLKC: IN STD_LOGIC;
       RESETC: IN STD_LOGIC;
       INFLAGC: IN STD_LOGIC;
       INCONTC: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
       RWC: OUT STD_LOGIC;
       RSC: OUT STD_LOGIC;
       ENC: OUT STD_LOGIC;
       OUTCOMMANDC: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
       OUTFLAGC: OUT STD_LOGIC);
END LCDCONFIG00;

ARCHITECTURE A_LCDCONFIG00 OF LCDCONFIG00 IS
BEGIN
  PCONFIG: PROCESS(CLKC)
  BEGIN
    IF (CLKC'EVENT AND CLKC = '1') THEN
      CASE RESETC IS
        WHEN '0' =>
          OUTCOMMANDC <= (OTHERS => '0');
          OUTFLAGC <= '0';
        WHEN '1' =>
          IF (INFLAGC = '1') THEN
            CASE INCONTC IS
              WHEN "00001" =>
                OUTCOMMANDC <= "00000001";--SCREEN CLEAR
                RWC <= '0';
                RSC <= '0';
                ENC <= '1';
                OUTFLAGC <= '0';
------------------------------------------------------------                
              WHEN "00010" =>
                OUTCOMMANDC <= "00000001";--SCREEN CLEAR
                RWC <= '0';
                RSC <= '0';
                ENC <= '0';
                OUTFLAGC <= '0';
-------------------------------------------------
              WHEN "00011" =>
                OUTCOMMANDC <= "00000001";--SCREEN CLEAR
                RWC <= '0';
                RSC <= '0';
                ENC <= '1';
                OUTFLAGC <= '0';
-------------------------------------------------
              WHEN "00100" =>
                OUTCOMMANDC <= "00000001";--SCREEN CLEAR
                RWC <= '0';
                RSC <= '0';
                ENC <= '0';
                OUTFLAGC <= '0';
-----------------------------------------------------
              WHEN "00101" =>
                OUTCOMMANDC <= "00000010";--CURSOR RETURN
                RWC <= '0';
                RSC <= '0';
                ENC <= '1';
                OUTFLAGC <= '0';
-------------------------------------------------
              WHEN "00110" =>
                OUTCOMMANDC <= "00000010";--CURSOR RETURN
                RWC <= '0';
                RSC <= '0';
                ENC <= '0';
                OUTFLAGC <= '0';
-------------------------------------------------
              WHEN "00111" =>
                OUTCOMMANDC <= "00000110";--INPUT SET
                RWC <= '0';
                RSC <= '0';
                ENC <= '1';
                OUTFLAGC <= '0';
-------------------------------------------------
              WHEN "01000" =>
                OUTCOMMANDC <= "00000110";--INPUT SET
                RWC <= '0';
                RSC <= '0';
                ENC <= '0';
                OUTFLAGC <= '0';
-------------------------------------------------
              WHEN "01001" =>
                OUTCOMMANDC <= "00001111";--DISPLAY SWITCH
                RWC <= '0';
                RSC <= '0';
                ENC <= '1';
                OUTFLAGC <= '0';
-------------------------------------------------
              WHEN "01010" =>
                OUTCOMMANDC <= "00001111";--DISPLAY SWITCH
                RWC <= '0';
                RSC <= '0';
                ENC <= '0';
                OUTFLAGC <= '0';
-------------------------------------------------               
              WHEN "01011" =>
                OUTCOMMANDC <= "00011100";--SHIFT
                RWC <= '0';
                RSC <= '0';
                ENC <= '1';
                OUTFLAGC <= '0';
-------------------------------------------------               
              WHEN "01100" =>
                OUTCOMMANDC <= "00011100";--SHIFT
                RWC <= '0';
                RSC <= '0';
                ENC <= '0';
                OUTFLAGC <= '0';
-------------------------------------------------           
              WHEN "01101" =>
                OUTCOMMANDC <= "00111100";--FUNCTION SET
                RWC <= '0';
                RSC <= '0';
                ENC <= '1';
                OUTFLAGC <= '0';
-------------------------------------------------           
              WHEN "01110" =>
                OUTCOMMANDC <= "00111100";--FUNCTION SET
                RWC <= '0';
                RSC <= '0';
                ENC <= '0';
                OUTFLAGC <= '0';
-------------------------------------------------               
              WHEN "01111" =>
                OUTCOMMANDC <= "10101001";--DDRAM AD SET
                RWC <= '0';
                RSC <= '0';
                ENC <= '1';
                OUTFLAGC <= '0';
-------------------------------------------------               
              WHEN "10000" =>
                OUTCOMMANDC <= "10101001";--DDRAM AD SET
                RWC <= '0';
                RSC <= '0';
                ENC <= '0';
                OUTFLAGC <= '0';
-------------------------------------------------
              WHEN "10001" =>
                OUTCOMMANDC <= "10101001";--DDRAM AD SET
                RWC <= '0';
                RSC <= '0';
                ENC <= '1';
                OUTFLAGC <= '0';
-------------------------------------------------           
              WHEN "10010" =>
                OUTCOMMANDC <= "10101001";--DDRAM AD SET
                RWC <= '0';
                RSC <= '0';
                ENC <= '0';
                OUTFLAGC <= '1';
              WHEN OTHERS => NULL;
            END CASE;
          END IF;
        WHEN OTHERS => NULL;
      END CASE;
    END IF;
  END PROCESS PCONFIG;
END A_LCDCONFIG00;

