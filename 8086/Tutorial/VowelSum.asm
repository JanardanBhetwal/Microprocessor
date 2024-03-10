.MODEL SMALL 
.STACK
.DATA
    MAXLEN  DB 50
    ACTLEN  DB ?
    STR1    DB 50 DUP('$')
    VOWELNO DB ?
    BUFFER  DB 10 DUP('$')    ; Buffer for converting VOWELNO to string

.CODE
MAIN PROC FAR
                MOV  AX,@DATA
                MOV  DS,AX

    ; Prompt user to input a string
                LEA  DX,MAXLEN
                MOV  AH,0AH
                INT  21H

    ; Load actual length of the string
                MOV  SI, OFFSET MAXLEN + 1
                MOV  CL, [SI]
                MOV  AH, 00H

    ; Initialize VOWELNO count
                MOV  VOWELNO, 0

    ; Count vowels
                MOV  Cl, ACTLEN               ; Load loop counter
                LEA  SI, STR1                 ; Load string pointer
    REPEAT:     
                MOV  AL, [SI]                 ; Load character
                CMP  AL, '$'                  ; Check end of string
                JE   END_LOOP
                CALL CHECK_VOWEL
                INC  SI
                LOOP REPEAT

    END_LOOP:   
    ; Convert VOWELNO to string
                MOV  SI, OFFSET BUFFER
                MOV  CX, 10
                MOV  AL, '$'
                ADD  SI,CX
                MOV  [SI], AL
                SUB  SI,CX                    ; Terminating null character
                DEC  SI
    REPEAT1:    
                XOR  DX, DX
                MOV  Al, VOWELNO
                DIV  BX
                ADD  DL, '0'
                DEC  SI
                MOV  [SI], DL
                CMP  AX, 0
                JNZ  REPEAT1

    ; Print the string
                MOV  AH, 09H
                LEA  DX, BUFFER
                INT  21H

    STOP:       
                MOV  AH,4CH
                INT  21H

CHECK_VOWEL PROC
                CMP  AL,'a'
                JE   VOWEL_FOUND
                CMP  AL,'e'
                JE   VOWEL_FOUND
                CMP  AL,'i'
                JE   VOWEL_FOUND
                CMP  AL,'o'
                JE   VOWEL_FOUND
                CMP  AL,'u'
                JE   VOWEL_FOUND
                CMP  AL,'A'
                JE   VOWEL_FOUND
                CMP  AL,'E'
                JE   VOWEL_FOUND
                CMP  AL,'I'
                JE   VOWEL_FOUND
                CMP  AL,'O'
                JE   VOWEL_FOUND
                CMP  AL,'U'
                JE   VOWEL_FOUND
                JMP  NOT_VOWEL

    VOWEL_FOUND:
                INC  VOWELNO
                RET

    NOT_VOWEL:  
                RET
CHECK_VOWEL ENDP

MAIN ENDP
END MAIN
