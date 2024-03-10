TITLE INPUT TEXT FROM USER AND CONVERT TO UPPERCASE IF IT IS IN LOWERCASE

    .MODEL SMALL
    .STACK 32H
.DATA
    MAXLEN DB 50
    ACTLEN DB ?
    STRING DB 50 DUP('$')
.CODE
MAIN PROC FAR
         MOV  AX,@DATA
         MOV  DS,AX

    ;STRING INPUT
         LEA  DX,MAXLEN
         MOV  AH,0AH
         INT  21H

    ;CONVERT TO UPPERCASE
         LEA  SI,STRING
         MOV  CL,ACTLEN
         MOV  CH,00H

    LUUP:MOV  AL,[SI]
         CMP  AL, 'a'      ;CHECKING IF LOWECASE
         JC   SKIP
         CMP  AL,'z'
         JE   DO
         JNC  SKIP

    DO:  SUB  AL,'a'       ;CONVERTING
         ADD  AL, 'A'
         MOV  [SI],AL
    SKIP:INC  SI
         LOOP LUUP

    ;NEWLINE
         MOV  AH,02H
         MOV  DL,0AH
         INT  21H

    ;DISPLAY
         MOV  AH,09H
         LEA  DX,STRING
         INT  21H
   

         MOV  AX,4C00H
         INT  21H
MAIN ENDP
    END MAIN