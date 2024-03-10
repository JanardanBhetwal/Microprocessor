    MODEL SMALL
    .STACK 32H
.DATA
    MAXLEN DB 50
    ACTLEN DB ?
    STRING DB 50 DUP ('$')
    ROW    DB 10
    COL    DB 20
.CODE
MAIN PROC FAR
         MOV AX,@DATA
         MOV DS,AX

    ;INPUT STRING
         LEA DX,MAXLEN
         MOV AH,0AH
         INT 21H

    ;CLEAR VIDEOMODE
         MOV AH,00H
         MOV AL,03H
         INT 10H

    ;CURSOR AT 10 20
         MOV AH,02H
         MOV DH,ROW
         MOV DL,COL
         INT 10H

    ;DISPLAY STRING
         LEA DX,STRING
         MOV AH,09H
         INT 21H

         MOV AX,4C00H
         INT 21H
MAIN ENDP
    END MAIN