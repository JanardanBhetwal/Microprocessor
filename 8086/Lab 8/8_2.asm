    .MODEL SMALL
    .STACK 32
.DATA
    STRNG DB 'PROGRAM IS FUN'
    LEN   DW $-STRNG
.CODE
MAIN PROC FAR
         MOV  AX,@DATA
         MOV  DS,AX

         MOV  CX,LEN
         MOV  BX,OFFSET STRNG

    SHOW:MOV  DL,[BX]
         MOV  AH,02H
         INT  21H
         INC  BX
         LOOP SHOW

         MOV  AX,4C00H
         INT  21H
MAIN ENDP
    END MAIN