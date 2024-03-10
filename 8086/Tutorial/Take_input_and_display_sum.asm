;Input the number from user and display sum of natural numbers

    .MODEL SMALL
    .STACK 32
.DATA
    STRING1  DB ('ENTER NUMBER: $')
    MAXLEN   DB 10
    ACTLEN   DB ?
    INPUTSTR DB 10 ('$')
    NUM      DW 0
    SUM      DW ?
.CODE
MAIN PROC FAR
         MOV  AX,@DATA
         MOV  DS,AX

         MOV  AH,0AH
         LEA  DX,MAXLEN
         INT  21H

         MOV  CL,ACTLEN
         MOV  CH,00
         LEA  SI,INPUTSTR
    LUP1:MOV  BL,[SI]
         MOV  BH,0
         SUB  BL,30H
         MOV  AX,10
         MUL  NUM
         MOV  NUM,AX
         ADD  NUM,BX
         INC  SI
         LOOP LUP1

         MOV  CX,10
         MOV  BX,01
    LUP2:ADD  NUM,BX
         INC  BX
         LOOP LUP2

         MOV  AX,4C00H
         INT  21H
MAIN ENDP
    END MAIN