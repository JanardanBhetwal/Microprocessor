    .MODEL SMALL
    .STACK 32
.DATA
    STRING  DB 20 DUP('$')
    NEWLINE DB 20 ,'$'
.CODE
MAIN PROC FAR
         MOV AX,@DATA
         MOV DS,AX

         MOV AH,0AH
         LEA DX,STRING
         INT 21H

        
         LEA DX, STRING
         ADD DX,2

         MOV AH,09H
         INT 21H

         MOV AX,4C00H
         INT 21H
MAIN ENDP
    END MAIN