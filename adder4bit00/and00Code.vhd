LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY and00 IS
    PORT(
        Aa, Ba: IN STD_LOGIC;
        Ya: OUT STD_LOGIC);
END and00;

ARCHITECTURE A_and00 of and00 IS
BEGIN
    Ya <= Aa AND Ba;
END A_and00;