LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY compuertasMUX IS 
    PORT( 
        A, B: IN STD_LOGIC_VECTOR(7 downto 0);
		SALIDA :OUT STD_LOGIC_VECTOR(7 downto 0);
	    SELECTOR: IN STD_LOGIC_VECTOR (2 downto 0));
END compuertasMUX;

ARCHITECTURE A_compuertasMUX of compuertasMUX IS
BEGIN
    COMPUERTAS: PROCESS(selector)
    BEGIN
        IF (SELECTOR = "000")THEN     --compuerta and
            SALIDA <= A AND B;
        ELSIF (SELECTOR = "001")THEN  --compuerta or
            SALIDA <= A OR B;
        ELSIF (SELECTOR = "010")THEN  --compuerta xor
            SALIDA <= A XOR B;
        ELSIF (SELECTOR = "011")THEN  --compuerta nand
            SALIDA <= A NAND B;
        ELSIF (SELECTOR = "100")THEN  --compuerta nor
            SALIDA <= A NOR B;
        ELSIF (SELECTOR = "101")THEN  --compuerta xnor
            SALIDA <= A XNOR B;
        ELSE                          --compuerta not
            SALIDA <= NOT A;
        END IF;
    END PROCESS COMPUERTAS;
END A_compuertasMUX;