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
-- Seg?n las entradas se activa diferente salida:
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
-- Falta pasa por el testbench
    PA_MAYOR_PD <= '1'  when PA > PD else '0';
    PA_MENOR_PD <= '1'  when PA < PD else '0';
    PA_IGUAL_PD <= '1'  when PA = PD else '0';
    

end Dataflow;