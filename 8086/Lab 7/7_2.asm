TITLE TO ADD TEN 16 BIT NUMBERS
        .MODEL SMALL
        .STACK 32
.DATA
        NUMS DW 10 DUP(1)
.CODE
MAIN PROC FAR
             MOV  AX,@DATA
             MOV  DS,AX

             MOV  AX,00H
             MOV  BX,00H
             MOV  CX,0AH

        NEXT:ADD  AX,NUMS[BX]
             INC  BX
             INC  BX
             LOOP NEXT

             MOV  AH,4CH
             INT  21H
MAIN ENDP
        END MAIN
