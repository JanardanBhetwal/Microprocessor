;Ten 16 bit Data is stored at 8550H, if higher byte is greater subtract lower byte from higher byte and store it in 3rd      table 8660H else, store 00H


LXI H,8050H
LXI D,8660H
MVI C,04H

LOOP: MOV A, M
MOV B, M
INX H
MOV A, M
XCHG
SUB B
JC LOWER
JMP SKIP
LOWER: MVI A, 00H
SKIP:MOV M, A
XCHG
INX H
INX D
DCR C
JNZ LOOP


hlt