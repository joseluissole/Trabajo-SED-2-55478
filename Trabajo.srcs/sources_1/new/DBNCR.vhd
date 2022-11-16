library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity DBNCR is
    generic(
        N_CICLOS: positive := 32 --numero ciclos espera a validar senal
    );
    
    port(
        PRE_D : in std_logic;   --entrada de flanco
        POST_D : out std_logic; --flanco de salida;
        
        CLK : in std_logic;     --RELOJ EN flanco positivo
        CE: in std_logic;       --habilitacion de chip a '1'
        RST_N: in std_logic     --renincio asincrono con valor a '0'
    );
    
end DBNCR;

architecture Behavioral of DBNCR is
    type tipo_estado is (S0_ESPERA, S1_RECIBIENDO, S2_CONTANDO, S3_FIN); --estados de la maquina
    subtype tipo_cuenta is integer range 0 to N_CICLOS;                     --cuenta   

    signal cuenta_actual : tipo_cuenta;       --cuenta actual
    signal cuenta_siguiente : tipo_cuenta;    --cuenta siguiente
    
    signal estado_actual : tipo_estado;     --estado signal
    signal estado_siguiente : tipo_estado;  --estado siguiente
    
begin

    --actualiza estado con el siguiente
    ACT_ESTADO: process(CLK, RST_N) 
    begin
        if (RST_N = '0') then
            estado_actual <= S0_ESPERA;
            cuenta_actual <= 0;
        elsif rising_edge(CLK) then
            if CE = '1' then
                estado_actual <= estado_siguiente;
                cuenta_actual <= cuenta_siguiente;
            
            end if;
        end if;         
    
    end process;
    
    --actualiza estado siguiente con entradas
    ENT_ESTADO: process(estado_actual, cuenta_actual, PRE_D) 
    begin
        --evita el latch
        estado_siguiente <= estado_actual;
        cuenta_siguiente <= cuenta_actual;
    
        --entradas
        case estado_actual is
            when S0_ESPERA =>
                if PRE_D = '1' then
                    estado_siguiente <= S1_RECIBIENDO;
                end if;
            when S1_RECIBIENDO =>
                estado_siguiente <= S2_CONTANDO;
                cuenta_siguiente <= 0;
                
            when S2_CONTANDO =>
                if PRE_D = '1' then
                    estado_siguiente <= S1_RECIBIENDO;
                elsif cuenta_actual = N_CICLOS - 1 then
                    estado_siguiente <= S3_FIN;
                else
                    cuenta_siguiente <= cuenta_actual + 1;
                end if;   
                
            when S3_FIN =>
                estado_siguiente <= S0_ESPERA;
                
            when others =>
                estado_siguiente <= S0_ESPERA;
        
        end case;
    end process;
    
    --actualiza las salidas del estado
    POST_D <= '1' when estado_actual = S3_FIN else  '0';

end Behavioral;
