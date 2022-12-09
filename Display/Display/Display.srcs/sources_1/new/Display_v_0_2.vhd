LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY decoder IS

    GENERIC(
        RANGO_IN  : positive := 4;  --Rango del BCD
        RANGO_OUT : positive := 7   --Rango de display de 7 segmentos
    );
    PORT (
        code : IN std_logic_vector(RANGO_IN - 1 DOWNTO 0);  --Codigo BCD
        led : OUT std_logic_vector(RANGO_OUT -1 DOWNTO 0)   --Salidas de 7 segmentos
    );
END ENTITY decoder;

ARCHITECTURE dataflow OF decoder IS
BEGIN
    WITH code SELECT
        --    7SEGMENTOS     ENTRADA     --
        led <= "0000001" WHEN "0001",   -- '0' EN DISPLAY
               "1001111" WHEN "0010",   -- '1'
               "0010010" WHEN "0100",   -- '2'
               "0000110" WHEN "1000",   -- '3'
               --"1001100" WHEN "0101",   -- '4'
               --"0100100" WHEN "0110",   -- '5'
               --"0100000" WHEN "0111",   -- '6'
               --"0001111" WHEN "1000",   -- '7'
               --"0000000" WHEN "1001",   -- '8'
               --"0000100" WHEN "1010",   -- '9'
               "1111110" WHEN others;   -- '-'
END ARCHITECTURE dataflow;
