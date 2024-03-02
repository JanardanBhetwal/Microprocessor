TITLE to find sum of the series
    .MODEL SMALL
    .STACK 32
.DATA
    SUM  DW ?
.CODE
MAIN PROC FAR
           MOV  AX,@DATA
           MOV  DS,AX

           MOV  CX,20
           MOV  DX,00
           MOV  BL,02
           MOV  BH,03

    SERIES:MOV  AL,BL
           MUL  BH
           ADD  DX,AX
           ADD  BH,2
           ADD  BL,2
           LOOP SERIES
           
           MOV  SUM,DX

           MOV  AX,4C00H
           INT  21H
MAIN ENDP
    END MAIN
