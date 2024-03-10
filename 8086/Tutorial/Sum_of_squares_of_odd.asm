TITLE TO ADD SUM OF N ODD NUMBERS GIVEN BY USER AND DISPLAY 
    .MODEL SMALL
    .STACK 32
.DATA
        STRING1 DB 'ENTER NUMBER LESS THAN 255: $'
        STRING2 DB 'THE RESULT OF SERIES IS: $'
        MAXLEN  DB 10
        ACTLEN  DB ?
        NUMSTR  DB 10 DUP ('$')
        INPUT   DW 0
        RESULT  DW 0


.CODE
MAIN PROC FAR
                MOV  AX,@DATA
                MOV  DS,AX

        ;INPUT STRING FROM USER
                MOV  AH,09H
                LEA  DX,STRING1        ;ENTER NUMBER
                INT  21H

                MOV  AH,0AH
                LEA  DX,MAXLEN         ;STORED IN NUMSTR
                INT  21H

        ;NEWLINE
                MOV  AH,02H
                MOV  DL,0AH
                INT  21H

        ;DISPLAY FINAL MESSAGE
                MOV  AH,09H
                LEA  DX,STRING2
                INT  21H

        ;EXTRACT NUMBER FROM NUMSTR
                MOV  CH,00H
                MOV  CL,ACTLEN         ;FOR LOOP
                LEA  SI,NUMSTR
                MOV  AX,0
       
        LOOP1:  MOV  BL,[SI]

                SUB  BL,30H
                MOV  BH, 00H
                MOV  AX,10
                MUL  INPUT
                MOV  INPUT,AX
                ADD  INPUT,BX
                INC  SI
                LOOP LOOP1

        ;SUM LOGIC
                MOV  CX,INPUT          ;FOR LOOP
                MOV  BX,01             ;STARTING NUMBER
        
        LOOP2:  MOV  AX,BX
                MUL  BX
                ADD  RESULT, AX
                ADD  BX,2
                LOOP LOOP2

        ;DISPLAY NUMBER
                MOV  CX,00
                MOV  AX,RESULT
                MOV  BX,10
        REPEAT2:CMP  AX,0
                JZ   NEXT2
                XOR  DX,DX
                DIV  BX
                PUSH DX
                INC  CX
            
                JMP  REPEAT2

        NEXT2:  CMP  CX,0
                JZ   NEXT3
                POP  DX
                ADD  DL,30H
                MOV  AH,02H
                INT  21H
                DEC  CX
                JMP  NEXT2

        NEXT3:  MOV  AX,4C00H
                INT  21H
MAIN ENDP
    END MAIN