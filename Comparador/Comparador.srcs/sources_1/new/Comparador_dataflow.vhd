library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Modulo de comparador que compara piso actual y piso deseado, ambos en natural
-- Según las entradas se activa diferente salida:
-- PA > PD, PA < PD, PA = PD

entity Comparador is
    Port ( 
        PA          : in NATURAL;    -- Entrada de piso actual
        PD          : in NATURAL;    -- Entrada de piso deseado
        PA_MAYOR_PD : out STD_LOGIC; -- PA > PD
        PA_MENOR_PD : out STD_LOGIC; -- PA < PD
        PA_IGUAL_PD : out STD_LOGIC  -- PA = PD
    );
end Comparador;

architecture Dataflow of Comparador is

begin

	PA_MAYOR_PD <= '1' WHEN PA > PD ELSE '0';
	PA_MENOR_PD <= '1' WHEN PA < PD ELSE '0';
	PA_IGUAL_PD <= '1' WHEN PA = PD ELSE '0';

end Dataflow;
