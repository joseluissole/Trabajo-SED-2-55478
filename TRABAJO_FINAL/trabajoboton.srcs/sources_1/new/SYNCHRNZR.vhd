library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SYNCHRNZR is
    port (

        ASYNC_IN : in std_logic;    --Entrada asinctrcrona
        SYNC_OUT : out std_logic;   --Salida sincrona

        CLK : in std_logic;         --RELOJ EN flanco positivo
        CE: in std_logic;           --habilitacion de chip a '1'
        RST_N: in std_logic         --renincio asincrono con valor a '0'

    );
end SYNCHRNZR;

architecture BEHAVIORAL of SYNCHRNZR is
    signal sreg : std_logic_vector(1 downto 0);

begin

    process (CLK, RST_N)
    begin
        if RST_N = '0' then
            sreg <= (others => '0');
    
        elsif rising_edge(CLK) then
            if CE = '1' then
                sync_out <= sreg(1);
                sreg <= sreg(0) & async_in;
            end if;
        end if;
    end process;

end BEHAVIORAL;