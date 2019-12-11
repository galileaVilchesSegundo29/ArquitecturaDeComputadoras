LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY DIV00 IS
  PORT(
       CLKDIV: IN STD_LOGIC;
       INDIV: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
       OUTDIV: INOUT STD_LOGIC);
END DIV00;

ARCHITECTURE A_DIV00 OF DIV00 IS
SIGNAL SDIV: STD_LOGIC_VECTOR(20 DOWNTO 0);
BEGIN
  PDIV: PROCESS(CLKDIV)
  BEGIN
    IF (CLKDIV'EVENT AND CLKDIV = '1') THEN
      CASE INDIV IS
        WHEN "00000" =>
          IF (SDIV > "100000000000000000000") THEN
              SDIV <= (OTHERS => '0');
              OUTDIV <= NOT(OUTDIV);
          ELSE
              SDIV <= SDIV + '1';
              OUTDIV <= OUTDIV;
          END IF;
        WHEN "00001" =>
          IF (SDIV > "010000000000000000000") THEN
              SDIV <= (OTHERS => '0');
              OUTDIV <= NOT(OUTDIV);
          ELSE
              SDIV <= SDIV + '1';
              OUTDIV <= OUTDIV;
          END IF;
        WHEN "00011" =>
          IF (SDIV > "001000000000000000000") THEN
              SDIV <= (OTHERS => '0');
              OUTDIV <= NOT(OUTDIV);
          ELSE
              SDIV <= SDIV + '1';
              OUTDIV <= OUTDIV;
          END IF;
        WHEN "00111" =>
          IF (SDIV > "000100000000000000000") THEN
              SDIV <= (OTHERS => '0');
              OUTDIV <= NOT(OUTDIV);
          ELSE
              SDIV <= SDIV + '1';
              OUTDIV <= OUTDIV;
          END IF;
        WHEN "01111" =>
          IF (SDIV > "000010000000000000000") THEN
              SDIV <= (OTHERS => '0');
              OUTDIV <= NOT(OUTDIV);
          ELSE
              SDIV <= SDIV + '1';
              OUTDIV <= OUTDIV;
          END IF;
        WHEN "11111" =>
          IF (SDIV > "000001000000000000000") THEN
              SDIV <= (OTHERS => '0');
              OUTDIV <= NOT(OUTDIV);
          ELSE
              SDIV <= SDIV + '1';
              OUTDIV <= OUTDIV;
          END IF;
        WHEN "11110" =>
          IF (SDIV > "000000010000000000000") THEN
              SDIV <= (OTHERS => '0');
              OUTDIV <= NOT(OUTDIV);
          ELSE
              SDIV <= SDIV + '1';
              OUTDIV <= OUTDIV;
          END IF;
        WHEN "11100" =>
          IF (SDIV > "000000000100000000000") THEN
              SDIV <= (OTHERS => '0');
              OUTDIV <= NOT(OUTDIV);
          ELSE
              SDIV <= SDIV + '1';
              OUTDIV <= OUTDIV;
          END IF;
        WHEN OTHERS => NULL;
      END CASE;
    END IF;
  END PROCESS PDIV;
END A_DIV00;

