library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EDGEDTCTR is
    port (

        SYNC_IN : in std_logic; --entrada sincrona
        EDGE : out std_logic;   --salioda de marca de flanco negativa

        CLK : in std_logic;     --RELOJ EN flanco positivo
        CE: in std_logic;       --habilitacion de chip a '1'
        RST_N: in std_logic     --renincio asincrono con valor a '0'

    );
end EDGEDTCTR;

architecture BEHAVIORAL of EDGEDTCTR is
    signal sreg : std_logic_vector(2 downto 0);

begin

    process (CLK, RST_N)
    begin
        if RST_N = '0' then
            sreg <= (others => '0');
            
        elsif rising_edge(CLK) then
            if CE = '1' then
                sreg <= sreg(1 downto 0) & SYNC_IN;
            end if;
        end if;
    end process;

    with sreg select
 EDGE <= '1' when "100",
        '0' when others;

end BEHAVIORAL;