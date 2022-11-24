----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2022 20:02:06
-- Design Name: 
-- Module Name: Comparador - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Modulo de comparador que compara piso actual y piso deseado, ambos en natural
-- Según las entradas se activa diferente salida:
-- PA > PD, PA < PD, PA = PD

entity Comparador is
    Port ( PA          : in NATURAL;    -- Entrada de piso actual
           PD          : in NATURAL;    -- Entrada de piso deseado
           PA_MAYOR_PD : out STD_LOGIC; -- PA > PD
           PA_MENOR_PD : out STD_LOGIC; -- PA < PD
           PA_IGUAL_PD : out STD_LOGIC  -- PA = PD
    );
end Comparador;

architecture Behavioral of Comparador is

begin
-- Falta pasa por el testbench
comparator : process(PA,PD)
begin
-- Inicializar las salidas a cero
PA_MAYOR_PD <= '0';
PA_MENOR_PD <= '0';
PA_IGUAL_PD <= '0';

if PA > PD then --En caso de PA > PD
    PA_MAYOR_PD <= '1';
elsif PA < PD then  -- Sino en caso de PA < PD
    PA_MENOR_PD <= '1';
else    -- y por defecto
    PA_IGUAL_PD <= '1';

end if;        

end process;

end Behavioral;
