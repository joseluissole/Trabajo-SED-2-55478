----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.12.2022 21:02:31
-- Design Name: 
-- Module Name: DECODER - Behavioral
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

entity DECODER_OCTAL is
    port(
        OCTAL : in std_logic_vector (2 downto 0);   --entrada cuebnta
        LINEA : out std_logic_vector (7 downto 0)   --display activo a nivel bajo
    );
end DECODER_OCTAL;

architecture Behavioral of DECODER_OCTAL is

begin

    with OCTAl select
    LINEA <= "01111111" when "111",
             "10111111" when "110",
             "11011111" when "101",
             "11101111" when "100",
             "11110111" when "011",
             "11111011" when "010",
             "11111101" when "001",
             "11111110" when others; 
        


end Behavioral;
