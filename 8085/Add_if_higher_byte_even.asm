;<Program title>

LXI H,8340H
MVI C,03H
LXI D,0000H		;SECOND AND THIRD BYTES
MVI B,00H		;FIRST BYTE

LOOP: MOV A,M
INX H
MOV A,M
RRC
JC SKIP
DCX H
MOV A,M
ADD E
MOV E,A
INX H
MOV A,M
ADC D
MOV D,A
JNC SKIP
INR B
SKIP: INX H
DCR C
JNZ LOOP

MOV M,E
INX H
MOV M,D
INX H
MOV M,B

HLT