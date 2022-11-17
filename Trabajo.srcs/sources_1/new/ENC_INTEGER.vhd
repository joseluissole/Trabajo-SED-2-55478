library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ENC_INTEGER is
    generic(
        N_PISOS : positive := 4     --numero de pisos incluyendo el bajo
    );

    port(
        BOT_IN : in std_logic_vector (N_PISOS - 1 downto 0);   --botonera de entrada
        PISO : out natural              --salida de piso como natural, solo de 0 a n-1

    );

end ENC_INTEGER;

architecture Behavioral of ENC_INTEGER is
begin

    --bucle for para detectar el boton pulsado
    process(BOT_IN)
    begin
        for i in BOT_IN'reverse_range loop
            if BOT_IN(i) = '1' then
                PISO <= i;
            
            end if;
        end loop;
    end process;

end Behavioral;
