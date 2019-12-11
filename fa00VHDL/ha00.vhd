LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE PACKAGEHA00.ALL;

ENTITY HA00 IS
    PORT(
        A0, B0: IN STD_LOGIC;
        S0, C0: OUT STD_LOGIC);
END HA00;

ARCHITECTURE A_HA00 OF HA00 IS
BEGIN 
    HA0: and00 port map(
        Aa => A0,
        Ba => B0,
        Ya => C0);
    HA1: xor00 port map(
        Ax => A0,
        Bx => B0,
        Yx => S0);
END A_HA00;