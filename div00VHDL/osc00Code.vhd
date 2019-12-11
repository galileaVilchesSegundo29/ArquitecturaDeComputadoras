LIBRARY LATTICE;
USE LATTICE.ALL;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY osc00 IS 
    PORT(
        OSC_INT: OUT STD_LOGIC);
END osc00;

ARCHITECTURE A_osc00 OF osc00 IS
    --Reloj interno.
    COMPONENT OSCH
        GENERIC(NOM_FREQ: STRING := "2.08");   --Frecuencia deseada.
    PORT(
        STDBY: IN STD_LOGIC;       --NO MOVER
        OSC: OUT STD_LOGIC);       --NO MOVER
    END COMPONENT;

    ATTRIBUTE NOM_FREQ : STRING;
    ATTRIBUTE NOM_FREQ of OSCInst : LABEL IS "2.08";
BEGIN
    --Instancia del reloj.
    OSCInst: OSCH
        GENERIC MAP(NOM_FREQ => "2.08")
		PORT MAP (
            STDBY => '0',             --NO MOVER
            OSC => OSC_INT);          --NO MOVER
END A_osc00;