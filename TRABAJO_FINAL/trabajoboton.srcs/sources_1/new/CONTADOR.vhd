----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.12.2022 20:05:44
-- Design Name: 
-- Module Name: CONTADOR - Behavioral
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

entity CONTADOR is
    generic(
    
        ANCHO : natural := 3    --ancho del contador
    
    );
    
    port(
    
        CUENTA : out std_logic_vector (ANCHO -1 downto 0);
        
        RST_N : in std_logic;
        CE : in std_logic;
        CLK : in std_logic
    
    );
    
end CONTADOR;

architecture Behavioral of CONTADOR is
    
    signal CUENTA_I : unsigned (ANCHO - 1 downto 0);
    
begin

    conter: process(RST_N, CLK)
    begin
    
        if RST_N = '0' then
            CUENTA_I <= (others => '0');
        
        elsif rising_edge (CLK) then
            if CE = '1' then
                CUENTA_I <= CUENTA_I + 1;
            end if;
            
        end if;       
    
    end process;
    
    CUENTA <= std_logic_vector(CUENTA_I);

end Behavioral;
