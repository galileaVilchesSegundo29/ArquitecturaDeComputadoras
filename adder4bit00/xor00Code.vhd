LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY xor00 IS
    PORT(
        Ax, Bx: IN STD_LOGIC;
        Yx: OUT STD_LOGIC);
END xor00;

ARCHITECTURE A_xor00 of xor00 IS
BEGIN
    Yx <= Ax XOR Bx;
END A_xor00;