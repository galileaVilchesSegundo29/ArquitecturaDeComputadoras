LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
LIBRARY LATTICE;
USE LATTICE.ALL;

ENTITY LCDDATA00 IS
  PORT(
       CLKD: IN STD_LOGIC;
       RESETD: IN STD_LOGIC;
       INFLAGD: IN STD_LOGIC;
       INCONTD: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
       OUTWORDD: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END LCDDATA00;

ARCHITECTURE A_LCDDATA00 OF LCDDATA00 IS
TYPE ARRAYDATA IS ARRAY(0 TO 63) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
CONSTANT WORDDATA: ARRAYDATA:=("00000000",--ESPACIO
                               "00100001",--�
                               "01001000",--H
                               "01001111",--O
                               "01001100",--L
                               "01000001",--A
                               "00100000",--ESPACIO
                               "01001101",--M
                               "01010101",--U
                               "01001110",--N
                               "01000100",--D
                               "01001111",--O
                               "00100001",--�
                               "00100001",--�
                               OTHERS => "00000000"); 
BEGIN
  PDATA: PROCESS(CLKD)
  BEGIN
    IF (CLKD'EVENT AND CLKD = '1') THEN
      IF (RESETD = '1') THEN
        CASE INFLAGD IS
          WHEN '0' =>
            OUTWORDD <= "00000000";
          WHEN '1' =>
            OUTWORDD <= WORDDATA(CONV_INTEGER(INCONTD));
          WHEN OTHERS => NULL;
        END CASE;
      END IF;
    END IF;
  END PROCESS PDATA;
END A_LCDDATA00;

