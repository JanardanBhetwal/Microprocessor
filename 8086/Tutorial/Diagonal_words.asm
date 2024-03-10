TITLE TO DISPLAY EACH WORD IN SEPARATE LINE
      .MODEL SMALL
      .STACK 32
.DATA
    MAXLEN DB 50
    ACTLEN DB ?
    STR1   DB 50 DUP ('$')
.CODE
MAIN PROC FAR
             MOV AX,@DATA
             MOV DS,AX

    ;INPUT
             LEA DX,MAXLEN
             MOV AH,0AH
             INT 21H

    ;NEWLINE
             MOV DL,0AH
             MOV AH,02H
             INT 21H


    ;CHECK AND PRINT
             LEA SI,STR1
             MOV CX,00

      
    LUP:     CMP BYTE PTR [SI],'$'
             JZ  EXIT
             CMP BYTE PTR [SI],' '
             JNZ CONTINUE

             MOV DL,0AH
             MOV AH,02H
             INT 21H

             MOV BX,CX

    LUP1:    MOV DL,' '
             MOV AH,02H
             INT 21H
             DEC BX
             CMP BX,0

             JNZ LUP1

             INC SI

               
    CONTINUE:MOV DL,[SI]
             MOV AH,02H
             INT 21H
             INC SI
             INC CX
             JMP LUP

      
                  

    EXIT:    MOV AX,4C00H
             INT 21H
MAIN ENDP
      END MAIN