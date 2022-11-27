-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MAQ_ESTADOS_TB is
end entity MAQ_ESTADOS_TB;

architecture Test of MAQ_ESTADOS_TB is
	component MAQ_ESTADOS is
		port(
    		CLK		: in std_logic;
        	RST_N	: in std_logic;
        	A_MAY_B	: in std_logic;
        	A_MEN_B	: in std_logic;
        	A_IGU_B	: in std_logic;
        	MOTOR	: out std_logic_vector(1 downto 0);
        	PUERTA	: out std_logic
    	);
	end component MAQ_ESTADOS;
    
    constant ClkPeriod : time := 100 ns;
    
    --Inputs
    signal CLK		: std_logic;
    signal RST_N	: std_logic;
    signal A_MAY_B 	: std_logic;
    signal A_IGU_B 	: std_logic;
    signal A_MEN_B 	: std_logic;
    
    --Outputs
    signal MOTOR : std_logic_vector (1 downto 0);
    signal PUERTA : std_logic;
    
begin
	
    uut: MAQ_ESTADOS
    port map(
    	CLK => CLK,
        RST_N => RST_N,
        A_MAY_B	=> A_MAY_B,
        A_MEN_B	=> A_MEN_B,
        A_IGU_B	=> A_IGU_B,
        MOTOR => MOTOR,
        PUERTA => PUERTA
    );
    
    clkgen:process
    begin
    	wait for 0.5*ClkPeriod;
        CLK <= '0';
        wait for 0.5*ClkPeriod;
        CLK <= '1';
    end process;
    
    RST_N <= '0' after 0.25 * ClkPeriod, '1' after 0.75 * ClkPeriod;
    
    entradas: process
    begin
    	wait for ClkPeriod + 10 ns;
        A_MAY_B <= '0';
        A_IGU_B <= '1';
        A_MEN_B <= '0';
        wait for ClkPeriod + 10 ns;
        A_MAY_B <= '1';
        A_IGU_B <= '0';
        A_MEN_B <= '0';
        wait for ClkPeriod + 10 ns;
        A_MAY_B <= '0';
        A_IGU_B <= '1';
        A_MEN_B <= '0';
        wait for ClkPeriod + 10 ns;
        A_MAY_B <= '0';
        A_IGU_B <= '0';
        A_MEN_B <= '1';
    end process;
    
    stingen: process
    begin
    	--Test Reset
        wait until RST_N = '0';
    	
        wait for 50 * ClkPeriod;
    	assert false
        	report "[PASS]: FIIIIIIIIIINNNNNNNNNN"
            severity failure;
    end process;
end architecture Test;
