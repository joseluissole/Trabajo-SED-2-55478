library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PRIOR_ENCODER is
    generic(
        RESET_VALUE : std_logic_vector (3 downto 0) := "0000"   --valor predeterminado al reiniciar
    );

    port(
        INPUT : in std_logic_vector (9 downto 0);   --entrada pulsadores codificador BCD 0-9
        RESET_N : in std_logic;                      --entrada reset
        CLK : in std_logic;                         --entrada reloj
        CE : in std_logic;                          --habilitacion de chip
        OUTPUT : out std_logic_vector (3 downto 0)  --salida digito BCD

    );
    
end PRIOR_ENCODER;

architecture Behaviorial of PRIOR_ENCODER is
    signal OUTPUT_I: std_logic_vector (3 downto 0);
begin

    proceso: process(RESET_N, CLK)
    begin
        if RESET_N = '0' then
            OUTPUT_I <= RESET_VALUE;

        elsif rising_edge (CLK) then
            if CE = '1'then
                
                if std_match(INPUT, "1---------") then
                    OUTPUT_I <= "1001";

                elsif std_match(INPUT,"01--------") then
                    OUTPUT_I <= "1000";

                elsif std_match(INPUT,"001-------") then
                    OUTPUT_I <= "0111";

                elsif std_match(INPUT,"0001------") then
                    OUTPUT_I <= "0110";

                elsif std_match(INPUT,"00001-----") then
                    OUTPUT_I <= "0101";

                elsif std_match(INPUT,"000001----") then
                    OUTPUT_I <= "0100";

                elsif std_match(INPUT,"0000001---") then
                    OUTPUT_I <= "0011";

                elsif std_match(INPUT,"00000001--") then
                    OUTPUT_I <= "0010";

                elsif std_match(INPUT,"000000001-") then
                    OUTPUT_I <= "0001";

                elsif std_match(INPUT,"0000000001") then
                    OUTPUT_I <= "0000";

                end if;

            end if;

        end if;

    end process;
    
    OUTPUT <= OUTPUT_I;

end Behaviorial;
