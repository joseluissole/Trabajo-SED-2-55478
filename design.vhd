-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MAQ_ESTADOS is
	port(
    	CLK		: in std_logic;
        RST_N	: in std_logic;
        A_MAY_B	: in std_logic;
        A_MEN_B	: in std_logic;
        A_IGU_B	: in std_logic;
        MOTOR	: out std_logic_vector(1 downto 0);
        PUERTA	: out std_logic
    );
end entity MAQ_ESTADOS;

architecture BEHAVIORAL of MAQ_ESTADOS is
	type STATE_T is (S0_WAITING, S1_GOINGUP, S2_GOINGDN);
    signal state, nxt_state : STATE_T;
begin
	state_reg : process (CLK, RST_N)
    begin
    	if RST_N = '0' then
        	state <= S0_WAITING;
        elsif (rising_edge(CLK)) then
        	state <= nxt_state;
        end if;
    end process;
    
    nxtstate_dec : process (state, A_MAY_B, A_MEN_B, A_IGU_B)
    begin
    	nxt_state <= state;
        case state is
        	when S0_WAITING =>
            	if A_MAY_B = '1' then
                	nxt_state <= S1_GOINGUP;
                elsif A_IGU_B = '1' then
                	nxt_state <= S0_WAITING;
                elsif A_MEN_B = '1' then
                	nxt_state <= S2_GOINGDN;
                end if;
            when S1_GOINGUP =>
            	if A_MAY_B = '1' then
                	nxt_state <= S1_GOINGUP;
                elsif A_IGU_B = '1' then
                	nxt_state <= S0_WAITING;
                end if;
            when S2_GOINGDN =>
                if A_IGU_B = '1' then
                	nxt_state <= S0_WAITING;
                elsif A_MEN_B = '1' then
                	nxt_state <= S2_GOINGDN;
                end if;
            when others =>
            	nxt_state <= S0_WAITING;
        end case;
    end process;
    
    output_dec : process (state)
    begin
    	MOTOR(0) <= '0';
        MOTOR(1) <= '0';
        PUERTA <= '0';
    	case state is
        	when S0_WAITING =>
            	MOTOR(0) <= '0';
        		MOTOR(1) <= '0';
                PUERTA <= '1';
            when S1_GOINGUP =>
            	MOTOR(0) <= '1';
        		MOTOR(1) <= '0';
                PUERTA <= '0';
            when S2_GOINGDN =>
            	MOTOR(0) <= '0';
        		MOTOR(1) <= '1';
                PUERTA <= '0';
            when others =>
            	MOTOR(0) <= '0';
        		MOTOR(1) <= '0';
                PUERTA <= '0';
        end case;
    end process;
end architecture BEHAVIORAL;