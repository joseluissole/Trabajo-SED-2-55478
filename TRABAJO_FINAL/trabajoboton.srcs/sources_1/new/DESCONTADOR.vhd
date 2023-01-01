----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.12.2022 19:22:33
-- Design Name: 
-- Module Name: DESCONTADOR - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DESCONTADOR is

    generic(
        MODULO : positive := 5000 --modulo de la cuenta
    );

    port(
        fin_cuenta : out std_logic; --llega a 0

        CLK : in std_logic;         --reloj
        RST_N : in std_logic        --RESET

    );
end DESCONTADOR;

architecture Behavioral of DESCONTADOR is
    signal COUNT : integer;
begin

    seq: process(RST_N, CLK)
    begin

        if(RST_N = '0') then
            COUNT <= 0;
            fin_cuenta <= '0';

        elsif rising_edge(CLK) then

            if(COUNT = 0) then
                fin_cuenta <= '1';
                
            else
                fin_cuenta <= '0';

            end if;
            
            COUNT <= (COUNT + 1) mod MODULO;
        end if;

    end process;



end Behavioral;
