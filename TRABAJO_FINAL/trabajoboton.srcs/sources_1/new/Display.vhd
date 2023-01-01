LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY DECODER IS

    GENERIC(
        RANGO_IN  : positive := 4;  --Rango del BCD
        RANGO_OUT : positive := 7   --Rango de display de 7 segmentos
    );
    PORT (
        code : IN std_logic_vector(RANGO_IN - 1 DOWNTO 0);  --Codigo BCD
        led : OUT std_logic_vector(RANGO_OUT -1 DOWNTO 0)   --Salida 7 segmentos
    );
END ENTITY DECODER;

ARCHITECTURE dataflow OF DECODER IS
BEGIN
    WITH code SELECT
        led <= "0000001" WHEN "0000",   -- '0' EN DISPLAY
               "1001111" WHEN "0001",   -- '1'
               "0010010" WHEN "0010",   -- '2'
               "0000110" WHEN "0011",   -- '3'
               "1001100" WHEN "0100",   -- '4'
               "0100100" WHEN "0101",   -- '5'
               "0100000" WHEN "0110",   -- '6'
               "0001111" WHEN "0111",   -- '7'
               "0000000" WHEN "1000",   -- '8'
               "0000100" WHEN "1001",   -- '9'
               "0001000" WHEN "1010",   -- 'A'
               "1100000" WHEN "1011",   -- 'b'
               "0110001" WHEN "1100",   -- 'C'
               "1000010" WHEN "1101",   -- 'd'
               "1111110" WHEN "1110",   -- '-, E'
               "1111111" WHEN others;   -- '-, F'
END ARCHITECTURE dataflow;