
?
Command: %s
1870*	planAhead2?
?read_checkpoint -auto_incremental -incremental C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/utils_1/imports/synth_1/BOTON2BCD.dcp2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2}
iC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/utils_1/imports/synth_1/BOTON2BCD.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
q
Command: %s
53*	vivadotcl2@
,synth_design -top TOP -part xc7a100tcsg324-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px? 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px? 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
56442default:defaultZ8-7075h px? 
?
%s*synth2?
wStarting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:08 . Memory (MB): peak = 1294.895 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
TOP2default:default2o
YC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/TOP.vhd2default:default2
372default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MAQ_ESTADOS2default:default2u
aC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/MAQ_ESTADOS.vhd2default:default2
52default:default2
maq_est2default:default2
MAQ_ESTADOS2default:default2o
YC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/TOP.vhd2default:default2
1092default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
MAQ_ESTADOS2default:default2w
aC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/MAQ_ESTADOS.vhd2default:default2
172default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
MAQ_ESTADOS2default:default2
02default:default2
12default:default2w
aC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/MAQ_ESTADOS.vhd2default:default2
172default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

Comparador2default:default2t
`C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/Comparador.vhd2default:default2
92default:default2
comp2default:default2

Comparador2default:default2o
YC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/TOP.vhd2default:default2
1202default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2

Comparador2default:default2v
`C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/Comparador.vhd2default:default2
232default:default8@Z8-638h px? 
V
%s
*synth2>
*	Parameter N bound to: 4 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2

Comparador2default:default2
02default:default2
12default:default2v
`C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/Comparador.vhd2default:default2
232default:default8@Z8-256h px? 
\
%s
*synth2D
0	Parameter N_PISOS bound to: 4 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter RESET_VALUE bound to: 4'b1110 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	BOTON2BCD2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
342default:default2
actual2default:default2
	BOTON2BCD2default:default2o
YC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/TOP.vhd2default:default2
1302default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	BOTON2BCD2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
492default:default8@Z8-638h px? 
\
%s
*synth2D
0	Parameter N_PISOS bound to: 4 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter RESET_VALUE bound to: 4'b1110 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
42default:default2#
sincronizador_I2default:default2
	SYNCHRNZR2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
852default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
	SYNCHRNZR2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
172default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	SYNCHRNZR2default:default2
02default:default2
12default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
172default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
42default:default2#
sincronizador_I2default:default2
	SYNCHRNZR2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
852default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
42default:default2#
sincronizador_I2default:default2
	SYNCHRNZR2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
852default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
42default:default2#
sincronizador_I2default:default2
	SYNCHRNZR2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
852default:default8@Z8-3491h px? 
V
%s
*synth2>
*	Parameter RESET_VALUE bound to: 4'b1110 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
PRIOR_ENCODER2default:default2w
cC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PRIOR_ENCODER.vhd2default:default2
52default:default2
ENC_BCD2default:default2!
PRIOR_ENCODER2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
962default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
PRIOR_ENCODER2default:default2y
cC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PRIOR_ENCODER.vhd2default:default2
212default:default8@Z8-638h px? 
V
%s
*synth2>
*	Parameter RESET_VALUE bound to: 4'b1110 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
PRIOR_ENCODER2default:default2
02default:default2
12default:default2y
cC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PRIOR_ENCODER.vhd2default:default2
212default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	BOTON2BCD2default:default2
02default:default2
12default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
492default:default8@Z8-256h px? 
\
%s
*synth2D
0	Parameter N_PISOS bound to: 4 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter RESET_VALUE bound to: 4'b0000 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	BOTON2BCD2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
342default:default2
deseado2default:default2
	BOTON2BCD2default:default2o
YC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/TOP.vhd2default:default2
1442default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2-
BOTON2BCD__parameterized12default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
492default:default8@Z8-638h px? 
\
%s
*synth2D
0	Parameter N_PISOS bound to: 4 - type: integer 
2default:defaulth p
x
? 
V
%s
*synth2>
*	Parameter RESET_VALUE bound to: 4'b0000 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
42default:default2#
sincronizador_I2default:default2
	SYNCHRNZR2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
852default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
42default:default2#
sincronizador_I2default:default2
	SYNCHRNZR2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
852default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
42default:default2#
sincronizador_I2default:default2
	SYNCHRNZR2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
852default:default8@Z8-3491h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	SYNCHRNZR2default:default2s
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/SYNCHRNZR.vhd2default:default2
42default:default2#
sincronizador_I2default:default2
	SYNCHRNZR2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
852default:default8@Z8-3491h px? 
V
%s
*synth2>
*	Parameter RESET_VALUE bound to: 4'b0000 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
PRIOR_ENCODER2default:default2w
cC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PRIOR_ENCODER.vhd2default:default2
52default:default2
ENC_BCD2default:default2!
PRIOR_ENCODER2default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
962default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys21
PRIOR_ENCODER__parameterized12default:default2y
cC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PRIOR_ENCODER.vhd2default:default2
212default:default8@Z8-638h px? 
V
%s
*synth2>
*	Parameter RESET_VALUE bound to: 4'b0000 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys21
PRIOR_ENCODER__parameterized12default:default2
02default:default2
12default:default2y
cC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PRIOR_ENCODER.vhd2default:default2
212default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2-
BOTON2BCD__parameterized12default:default2
02default:default2
12default:default2u
_C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/BOTON2BCD.vhd2default:default2
492default:default8@Z8-256h px? 
^
%s
*synth2F
2	Parameter MODULO bound to: 5000 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter ANCHO bound to: 3 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
PTOP2default:default2n
ZC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PTOP.vhd2default:default2
342default:default2#
cidificador7seg2default:default2
PTOP2default:default2o
YC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/TOP.vhd2default:default2
1602default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
PTOP2default:default2p
ZC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PTOP.vhd2default:default2
512default:default8@Z8-638h px? 
^
%s
*synth2F
2	Parameter MODULO bound to: 5000 - type: integer 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	Parameter ANCHO bound to: 3 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter MODULO bound to: 5000 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DESCONTADOR2default:default2u
aC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/DESCONTADOR.vhd2default:default2
342default:default2
desc2default:default2
DESCONTADOR2default:default2p
ZC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PTOP.vhd2default:default2
1212default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
DESCONTADOR2default:default2w
aC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/DESCONTADOR.vhd2default:default2
492default:default8@Z8-638h px? 
^
%s
*synth2F
2	Parameter MODULO bound to: 5000 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
DESCONTADOR2default:default2
02default:default2
12default:default2w
aC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/DESCONTADOR.vhd2default:default2
492default:default8@Z8-256h px? 
Z
%s
*synth2B
.	Parameter ANCHO bound to: 3 - type: integer 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
CONTADOR2default:default2r
^C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/CONTADOR.vhd2default:default2
342default:default2
cont2default:default2
CONTADOR2default:default2p
ZC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PTOP.vhd2default:default2
1352default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
CONTADOR2default:default2t
^C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/CONTADOR.vhd2default:default2
532default:default8@Z8-638h px? 
Z
%s
*synth2B
.	Parameter ANCHO bound to: 3 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
CONTADOR2default:default2
02default:default2
12default:default2t
^C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/CONTADOR.vhd2default:default2
532default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2!
DECODER_OCTAL2default:default2q
]C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/DECODER.vhd2default:default2
342default:default2
DEC8BIN2default:default2!
DECODER_OCTAL2default:default2p
ZC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PTOP.vhd2default:default2
1522default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2!
DECODER_OCTAL2default:default2s
]C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/DECODER.vhd2default:default2
412default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
DECODER_OCTAL2default:default2
02default:default2
12default:default2s
]C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/DECODER.vhd2default:default2
412default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
MUX322default:default2o
[C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/MUX32.vhd2default:default2
342default:default2
M322default:default2
MUX322default:default2p
ZC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PTOP.vhd2default:default2
1592default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
MUX322default:default2q
[C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/MUX32.vhd2default:default2
432default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
MUX322default:default2
02default:default2
12default:default2q
[C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/MUX32.vhd2default:default2
432default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
DECODER2default:default2q
]C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/Display.vhd2default:default2
52default:default2
DEC2default:default2
DECODER2default:default2p
ZC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PTOP.vhd2default:default2
1682default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2
DECODER2default:default2s
]C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/Display.vhd2default:default2
172default:default8@Z8-638h px? 
]
%s
*synth2E
1	Parameter RANGO_IN bound to: 4 - type: integer 
2default:defaulth p
x
? 
^
%s
*synth2F
2	Parameter RANGO_OUT bound to: 7 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
DECODER2default:default2
02default:default2
12default:default2s
]C:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/Display.vhd2default:default2
172default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
PTOP2default:default2
02default:default2
12default:default2p
ZC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/PTOP.vhd2default:default2
512default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
TOP2default:default2
02default:default2
12default:default2o
YC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.srcs/sources_1/new/TOP.vhd2default:default2
372default:default8@Z8-256h px? 
?
%s*synth2?
wFinished RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1294.895 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1294.895 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:12 . Memory (MB): peak = 1294.895 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0062default:default2
1294.8952default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2\
FC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/Nexys4DDR_Master.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2\
FC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/Nexys4DDR_Master.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2Z
FC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/Nexys4DDR_Master.xdc2default:default2)
.Xil/TOP_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1336.9802default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0092default:default2
1336.9802default:default2
0.0002default:defaultZ17-268h px? 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:18 ; elapsed = 00:00:22 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:18 ; elapsed = 00:00:22 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:18 ; elapsed = 00:00:22 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2default:default2
MAQ_ESTADOS2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_              s0_waiting |                              001 |                               00
2default:defaulth p
x
? 
?
%s
*synth2s
_              s1_goingup |                              010 |                               01
2default:defaulth p
x
? 
?
%s
*synth2s
_              s2_goingdn |                              100 |                               10
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2default:default2
one-hot2default:default2
MAQ_ESTADOS2default:defaultZ8-3354h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:19 ; elapsed = 00:00:23 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   31 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   14 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 9     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   31 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   14 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   8 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	  10 Input    4 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    3 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	  10 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:23 ; elapsed = 00:00:27 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:30 ; elapsed = 00:00:34 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Timing Optimization : Time (s): cpu = 00:00:30 ; elapsed = 00:00:34 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Technology Mapping : Time (s): cpu = 00:00:30 ; elapsed = 00:00:34 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
uFinished IO Insertion : Time (s): cpu = 00:00:36 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:36 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:36 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:36 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:36 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:00:36 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |    39|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |    21|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |    49|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |    60|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |    38|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |    23|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |    36|
2default:defaulth px? 
D
%s*synth2,
|9     |FDCE   |    38|
2default:defaulth px? 
D
%s*synth2,
|10    |FDPE   |     3|
2default:defaulth px? 
D
%s*synth2,
|11    |FDRE   |     8|
2default:defaulth px? 
D
%s*synth2,
|12    |IBUF   |    10|
2default:defaulth px? 
D
%s*synth2,
|13    |OBUF   |    18|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:36 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:25 ; elapsed = 00:00:37 . Memory (MB): peak = 1336.980 ; gain = 0.000
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Complete : Time (s): cpu = 00:00:36 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.980 ; gain = 42.086
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0062default:default2
1336.9802default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
392default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1336.9802default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
c036793a2default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
712default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:412default:default2
00:00:472default:default2
1336.9802default:default2
42.0862default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2g
SC:/Users/sed/Downloads/TRABAJO_SED_3_B-secuecnial/trabajoboton.runs/synth_1/TOP.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2p
\Executing : report_utilization -file TOP_utilization_synth.rpt -pb TOP_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Dec 15 18:16:11 20222default:defaultZ17-206h px? 


End Record