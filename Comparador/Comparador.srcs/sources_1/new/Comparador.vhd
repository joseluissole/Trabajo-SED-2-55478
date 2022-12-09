library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Modulo de comparador que compara piso actual y piso deseado, ambos en natural
-- Según las entradas se activa diferente salida:
-- PA > PD, PA < PD, PA = PD

entity Comparador is
    GENERIC(
    DIM : positive := 4
    );
    Port (
        PA          : in STD_LOGIC_VECTOR(DIM-1 DOWNTO 0);    -- Entrada de piso actual
        PD          : in STD_LOGIC_VECTOR(DIM-1 DOWNTO 0);    -- Entrada de piso deseado
        PA_MAYOR_PD : out STD_LOGIC; -- PA > PD
        PA_MENOR_PD : out STD_LOGIC; -- PA < PD
        PA_IGUAL_PD : out STD_LOGIC  -- PA = PD
    );
end Comparador;

architecture Dataflow of Comparador is
    signal PA_i : unsigned(PA'RANGE);
    signal PD_i : unsigned(PD'RANGE);
begin

    PA_MAYOR_PD <= '1' WHEN PA_i > PD_i ELSE '0';
    PA_MENOR_PD <= '1' WHEN PA_i < PD_i ELSE '0';
    PA_IGUAL_PD <= '1' WHEN PA_i = PD_i ELSE '0';

end Dataflow;