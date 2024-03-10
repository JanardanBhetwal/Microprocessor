    .MODEL SMALL
    .STACK 32
.DATA
    MAXLEN DB 50
    ACTLEN DB ?
    STRING DB 50 DUP('$')
.CODE
MAIN PROC FAR
         MOV  AX,@DATA
         MOV  DS,AX

    ;INPUT STRING
         LEA  DX,MAXLEN
         MOV  AH,0AH
         INT  21H

    ;TO LOWERCASE
         LEA  SI,STRING
         MOV  CL,ACTLEN
         MOV  CX,00

    LUUP:MOV  AL,[SI]
         CMP  AL,'A'       ;CHECK IF UPPERCASE
         JC   SKIP
         CMP  AL,'Z'
         JE   DO
         JNC  SKIP
    DO:  SUB  AL,'A'       ;CONVERT
         ADD  AL,'a'
         MOV  [SI],AL
    SKIP:INC  SI
         LOOP LUUP

    ;NEWLINE
         MOV  AH,02H
         MOV  DL,0AH
         INT  21H

    ;DISPLAY STRING
         LEA  DX,STRING
         MOV  AH,09H
         INT  21H

         MOV  AX,4C00H
         INT  21H
MAIN ENDP
    END MAIN