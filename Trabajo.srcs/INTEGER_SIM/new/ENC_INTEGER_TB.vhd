----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2022 20:32:35
-- Design Name: 
-- Module Name: ENC_INTEGER_TB - Behavioral
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

entity ENC_INTEGER_TB is
    --  Port ( );
end ENC_INTEGER_TB;

architecture Behavioral of ENC_INTEGER_TB is
    component ENC_INTEGER
        generic(
            N_PISOS : positive := 4     --numero de pisos incluyendo el bajo
        );

        port(
            BOT_IN : in std_logic_vector (N_PISOS - 1 downto 0) := (others => '0');   --botonera de entrada
            PISO : out natural              --salida de piso como natural, solo de 0 a n-1

        );
    end component;

    constant CLK_PERIOD : time := 10 ns;

    constant N_PISOS : integer := 15;

    signal BOT_IN : std_logic_vector (N_PISOS -1 downto 0);
    signal PISO : natural;

begin

    EI_PRUEBA: ENC_INTEGER
        generic map (
            N_PISOS => N_PISOS   --numero de pisos incluyendo el bajo
        )

        port map (
            BOT_IN => BOT_IN,    --botonera de entrada
            PISO => PISO        --salida de piso como natural, solo de 0 a n-1
        );

    EI_P: process
    begin
        wait for CLK_PERIOD;

        for i in BOT_IN'reverse_range loop
            BOT_IN(i) <= '1';
            wait for CLK_PERIOD;
            BOT_IN(i) <= '0';
            wait for 10*CLK_PERIOD;

            assert PISO = i
            report "[ERROR]: PISO vale " & integer'image(PISO) & "Cuando deberia ser " & integer'image(i)
            severity FAILURE;

        end loop;

        wait for CLK_PERIOD;

        for i in BOT_IN'range loop
            BOT_IN(i) <= '1';
            wait for CLK_PERIOD;
            BOT_IN(i) <= '0';
            wait for 10*CLK_PERIOD;
            
             assert PISO = i
            report "[ERROR]: PISO vale " & integer'image(PISO) & "Cuando deberia ser " & integer'image(i)
            severity FAILURE;

        end loop;
        
        for i in BOT_IN'reverse_range loop
            BOT_IN(i) <= '1';
            wait for 10*CLK_PERIOD;
                       
            end loop;

        for i in BOT_IN'reverse_range loop
            BOT_IN(i) <= '0';
            wait for 10*CLK_PERIOD;
                       
            end loop;
            
            for i in BOT_IN'range loop
            BOT_IN(i) <= '1';
            wait for 10*CLK_PERIOD;
                       
            end loop;

        for i in BOT_IN'range loop
            BOT_IN(i) <= '0';
            wait for 10*CLK_PERIOD;
                       
            end loop;
            
        wait for 10*CLK_PERIOD;

        assert FALSE
        report "[SUCCESS]: Simulacion correcta"
        severity FAILURE;

    end process;


end Behavioral;
