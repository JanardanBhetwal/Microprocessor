;Transfer a table of ten 8-bit numbers stored at 8050 to 8160 
;if D2 = 1 and D6 = 0 else store by inverting the bits.

LXI H,8050H
LXI D,8160H
MVI C,02H

LOOP:MOV A,M
ANI 44H
CPI 04H
MOV A,M
JZ TRUE
XRI FFH
TRUE:XCHG
MOV M,A
XCHG
INX H
INX D
DCR C
JNZ LOOP

HLT