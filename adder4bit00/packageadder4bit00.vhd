LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

PACKAGE PACKAGEADDER4BIT00 IS
    COMPONENT xor00
        PORT(
            Ax, Bx: IN STD_LOGIC;
            Yx: OUT STD_LOGIC);   
    END COMPONENT;

    COMPONENT xnor00
        PORT(
            Anx, Bnx: IN STD_LOGIC;
            Ynx: OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT fa00
        PORT(
            C00, A00, B00: IN STD_LOGIC;
            S00, C01: OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT and00
        PORT(
            Aa, Ba: IN STD_LOGIC;
            Ya: OUT STD_LOGIC);
    END COMPONENT;
END PACKAGEADDER4BIT00;