LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE PACKAGEMULT4BIT00.ALL;

ENTITY MULT4BIT00CODE IS 
    PORT(
        Ami, Bmi: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Rmo: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END MULT4BIT00CODE;

ARCHITECTURE A_MULT4BIT00 OF MULT4BIT00CODE is
SIGNAL S0, S3, S6, S8: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL S1, S2, S4, S5, S7: STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    --PRIMER ARREGLO.
    MU00: and00 PORT MAP(
        Aa => Ami(0),
        Ba => Bmi(0),
        Ya => Rmo(0));
    MU01: and00 PORT MAP(
        Aa => Ami(1),
        Ba => Bmi(0),
        Ya => S0(0));
    MU02: and00 PORT MAP(
        Aa => Ami(2),
        Ba => Bmi(0),
        Ya => S0(1));
    MU03: and00 PORT MAP(
        Aa => Ami(3),
        Ba => Bmi(0),
        Ya => S0(2));

    --SEGUNDO ARREGLO.
    MU04: and00 PORT MAP(
        Aa => Ami(0),
        Ba => Bmi(1),
        Ya => S1(0));
    MU05: and00 PORT MAP(
        Aa => Ami(1),
        Ba => Bmi(1),
        Ya => S1(1));
    MU06: and00 PORT MAP(
        Aa => Ami(2),
        Ba => Bmi(1),
        Ya => S1(2));
    MU07: and00 PORT MAP(
        Aa => Ami(3),
        Ba => Bmi(1),
        Ya => S1(3));
        
    --TERCER ARREGLO.
    MU08: fa00 PORT MAP(
        C00 => '0',
        A00 => S0(0),
        B00 => S1(0),
        C01 => S2(0),
        S00 => Rmo(1));
    MU09: fa00 PORT MAP(
        C00 => S2(0),
        A00 => S0(1),
        B00 => S1(1),
        C01 => S2(1),
        S00 => S3(0));
    MU10: fa00 PORT MAP(
        C00 => S2(1),
        A00 => S0(2),
        B00 => S1(2),
        C01 => S2(2),
        S00 => S3(1));
    MU11: fa00 PORT MAP(
        C00 => S2(2),
        A00 => '0',
        B00 => S1(3),
        C01 => S2(3),
        S00 => S3(2));

    --CUARTO ARREGLO.
    MU12: and00 PORT MAP(
        Aa => Ami(0),
        Ba => Bmi(2),
        Ya => S4(0));
    MU13: and00 PORT MAP(
        Aa => Ami(1),
        Ba => Bmi(2),
        Ya => S4(1));
    MU14: and00 PORT MAP(
        Aa => Ami(2),
        Ba => Bmi(2),
        Ya => S4(2));
    MU15: and00 PORT MAP(
        Aa => Ami(3),
        Ba => Bmi(2),
        Ya => S4(3));

    --QUINTO ARREGLO.
    MU16: fa00 PORT MAP(
        C00 => '0',
        A00 => S3(0),
        B00 => S4(0),
        C01 => S5(0),
        S00 => Rmo(2));
    MU17: fa00 PORT MAP(
        C00 => S5(0),
        A00 => S3(1),
        B00 => S4(1),
        C01 => S5(1),
        S00 => S6(0));
    MU18: fa00 PORT MAP(
        C00 => S5(1),
        A00 => S3(2),
        B00 => S4(2),
        C01 => S5(2),
        S00 => S6(1));
    MU19: fa00 PORT MAP(
        C00 => S5(2),
        A00 => S2(3),
        B00 => S4(3),
        C01 => S5(3),
        S00 => S6(2));

    --SEXTO ARREGLO.
    MU20: and00 PORT MAP(
        Aa => Ami(0),
        Ba => Bmi(3),
        Ya => S7(0));
    MU21: and00 PORT MAP(
        Aa => Ami(1),
        Ba => Bmi(3),
        Ya => S7(1));
    MU22: and00 PORT MAP(
        Aa => Ami(2),
        Ba => Bmi(3),
        Ya => S7(2));
    MU23: and00 PORT MAP(
        Aa => Ami(3),
        Ba => Bmi(3),
        Ya => S7(3));

    MU24: fa00 PORT MAP(
        C00 => '0',
        A00 => S6(0),
        B00 => S7(0),
        C01 => S8(0),
        S00 => Rmo(3));
    MU25: fa00 PORT MAP(
        C00 => S8(0),
        A00 => S6(1),
        B00 => S7(1),
        C01 => S8(1),
        S00 => Rmo(4));
    MU26: fa00 PORT MAP(
        C00 => S8(1),
        A00 => S6(2),
        B00 => S7(2),
        C01 => S8(2),
        S00 => Rmo(5));
    MU27: fa00 PORT MAP(
        C00 => S8(2),
        A00 => S5(3),
        B00 => S7(3),
        C01 => Rmo(7),
        S00 => Rmo(6));
END A_MULT4BIT00;