----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.12.2022 20:42:19
-- Design Name: 
-- Module Name: MUX32 - Behavioral
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

entity MUX32 is
port(
    INPUT : in std_logic_vector (31 downto 0); --entrada BCD
    SELECCIONAR : in std_logic_vector (2 downto 0); 
    OUTPUT : out std_logic_vector (3 downto 0)
   
);
end MUX32;

architecture Behavioral of MUX32 is

begin

with SELECCIONAR select
    OUTPUT <= INPUT(31 downto 28) when "111",
              INPUT(27 downto 24)  when "110",
              INPUT(23 downto 20) when "101",
              INPUT(19 downto 16) when "100",
              INPUT(15 downto 12) when "011",
              INPUT(11 downto 8) when "010",
              INPUT(7 downto 4) when "001",
              INPUT(3 downto 0) when others; 


end Behavioral;
