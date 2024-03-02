TITLE to generate and store the multiplication table of a number
    .MODEL SMALL
    .STACK 32
.DATA
    NUM1 DW 5
    TABL DW ?
.CODE
MAIN PROC FAR
             MOV  AX,@DATA
             MOV  DS,AX

             MOV  CX,0AH
             MOV  BX,00H
             MOV  AX,00

    MULTIPLY:ADD  AX,NUM1
             MOV  TABL[BX],AX
             INC  BX
             INC  BX
             LOOP MULTIPLY

             MOV  AX,4C00H
             INT  21H
MAIN ENDP
    END MAIN
