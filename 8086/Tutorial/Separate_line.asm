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

    ;FIRST LETTER CAPITAL
             CMP BYTE PTR [SI],'a'
             JB  CONTINUE
             CMP BYTE PTR [SI],'z'
             JA  CONTINUE
             SUB BYTE PTR [SI],'a'
             ADD BYTE PTR [SI],'A'
             JMP CONTINUE

      
    LUP:     CMP BYTE PTR [SI],'$'
             JZ  EXIT
             CMP BYTE PTR [SI],' '
             JNZ CONTINUE

             MOV DL,0AH
             MOV AH,02H
             INT 21H

             INC SI

             CMP BYTE PTR [SI],'a'
             JB  CONTINUE
             CMP BYTE PTR [SI],'z'
             JA  CONTINUE
             SUB BYTE PTR [SI],'a'
             ADD BYTE PTR [SI],'A'
    CONTINUE:MOV DL,[SI]
             MOV AH,02H
             INT 21H
             INC SI

             JMP LUP

      
                  

    EXIT:    MOV AX,4C00H
             INT 21H
MAIN ENDP
      END MAIN