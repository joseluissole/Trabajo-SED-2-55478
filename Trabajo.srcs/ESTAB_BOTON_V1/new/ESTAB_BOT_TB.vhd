----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2022 17:38:51
-- Design Name: 
-- Module Name: ESTAB_BOT_TB - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ESTAB_BOT_TB is
    --  Port ( );
end ESTAB_BOT_TB;

architecture Behavioral of ESTAB_BOT_TB is
    component ESTAB_BOT
        port(
            BOT_IN: in std_logic;   --emtrada de boton
            BOT_OUT: out std_logic; --salida de boton estable

            CLK : in std_logic;     --RELOJ EN flanco positivo
            CE: in std_logic;       --habilitacion de chip a '1'
            RST_N: in std_logic     --renincio asincrono con valor a '0'
        );
    end component;

    signal BOT_IN : std_logic := '1';   --entrada boton
    signal BOT_OUT: std_logic;          --salida signal

    signal CLK : std_logic := '0';      --signal
    signal RST_N : std_logic := '1';    --reinicio

begin

    PRUEBA_ESTABILIAZDOR: ESTAB_BOT 
        port map(
            BOT_IN => BOT_IN,
            BOT_OUT => BOT_OUT,
            CLK => CLK,
            CE => CLK,
            RST_N => RST_N
        );

end Behavioral;
