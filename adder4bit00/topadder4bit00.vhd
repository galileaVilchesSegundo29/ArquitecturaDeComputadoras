LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE PACKAGEADDER4BIT00.ALL;

ENTITY TOPADDER4BIT00 IS
    PORT(
        Ai, Bi: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        SL: IN STD_LOGIC;
        So: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        LED: OUT STD_LOGIC);
END TOPADDER4BIT00;

ARCHITECTURE A_TOPADDER4BIT00 OF TOPADDER4BIT00 IS
SIGNAL SB: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL SC: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL SA: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Sx: STD_LOGIC;
BEGIN 
    --PRIMER SUMADOR.
    AD00: xor00 PORT MAP(
        Ax => SL,
        Bx => Bi(0),
        Yx => SB(0));
    AD01: xor00 PORT MAP(
        Ax => SL,
        Bx => Bi(1),
        Yx => SB(1));
    AD02: xor00 PORT MAP(
        Ax => SL,
        Bx => Bi(2),
        Yx => SB(2));
    AD03: xor00 PORT MAP(
        Ax => SL,
        Bx => Bi(3),
        Yx => SB(3));

    --SEGUNDO SUMADOR.
    AD04: fa00 PORT MAP(
        C00 => SL,
        A00 => Ai(0),
        B00 => SB(0),
        C01 => SC(0),
        S00 => SA(0));
    AD05: fa00 PORT MAP(
        C00 => SC(0),
        A00 => Ai(1),
        B00 => SB(1),
        C01 => SC(1),
        S00 => SA(1));
    AD06: fa00 PORT MAP(
        C00 => SC(1),
        A00 => Ai(2),
        B00 => SB(2),
        C01 => SC(2),
        S00 => SA(2));
    AD07: fa00 PORT MAP(
        C00 => SC(2),
        A00 => Ai(3),
        B00 => SB(3),
        C01 => SC(3),
        S00 => SA(3));

    --TERCER SUMADOR.
    AD08: and00 PORT MAP(
        Aa => Sx,
        Ba => SA(0),
        Ya => So(0));
    AD09: and00 PORT MAP(
        Aa => Sx,
        Ba => SA(1),
        Ya => So(1));
    AD10: and00 PORT MAP(
        Aa => Sx,
        Ba => SA(2),
        Ya => So(2));
    AD11: and00 PORT MAP(
        Aa => Sx,
        Ba => SA(3),
        Ya => So(3));

    --CUARTO SUMADOR.
    AD12: xnor00 PORT MAP(
        Anx => SC(2),
        Bnx => SC(3),
        Ynx => Sx);
    AD13: xor00 PORT MAP(
        Ax => SC(2),
        Bx => SC(3),
        Yx => LED);
END A_TOPADDER4BIT00;