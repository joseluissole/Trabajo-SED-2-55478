library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Comparador is
end tb_Comparador;

architecture tb of tb_Comparador is

    component Comparador
        port (PA          : in std_logic_vector (3 downto 0);
              PD          : in std_logic_vector (3 downto 0);
              PA_MAYOR_PD : out std_logic;
              PA_MENOR_PD : out std_logic;
              PA_IGUAL_PD : out std_logic);
    end component;

    signal PA          : std_logic_vector (3 downto 0);
    signal PD          : std_logic_vector (3 downto 0);
    signal PA_MAYOR_PD : std_logic;
    signal PA_MENOR_PD : std_logic;
    signal PA_IGUAL_PD : std_logic;

begin

    dut : Comparador
    port map (PA          => PA,
              PD          => PD,
              PA_MAYOR_PD => PA_MAYOR_PD,
              PA_MENOR_PD => PA_MENOR_PD,
              PA_IGUAL_PD => PA_IGUAL_PD);

    stimuli : process

    begin
        -- Inicializar las entradas
        PA <= (others => '0');
        PD <= (others => '1');

        -- Cambiar los valores de simulación
	for i in 1 to 15 loop
	    PA <= std_logic_vector(to_unsigned(i,PA'length));
        PD <= std_logic_vector(to_unsigned(16-i,PD'length));
        wait for 100 ns;
	end loop;

        wait;
	assert FALSE
        report "[SUCCESS] Testbench completed"
        severity FAILURE;
    end process;

end tb;

