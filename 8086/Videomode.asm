    .MODEL SMALL
    .STACK 32
.DATA
    
.CODE
MAIN PROC FAR
         MOV AX,@DATA
         MOV DS,AX

         MOV AH,02H
         MOV BL,00H
         MOV DH,30H
         MOV DL,30H
         INT 10H

         MOV AX,4C00H
         INT 21H
MAIN ENDP
    END MAIN