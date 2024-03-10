TITLE TO DISPLAY ADDITION OF 10 NUMBERS
.MODEL SMALL
.STACK 32H
.DATA
    NUM  DB 200
    SUM  DW 0
.CODE
MAIN PROC FAR
            MOV  AX, @DATA
            MOV  DS, AX

            MOV  CL,NUM
            MOV  CH,00
            MOV  DX,0001

    LUP:    ADD  SUM,DX
            INC  DX
            LOOP LUP

    ;DISPLAY NUMBER
            MOV  CX,00
            MOV  AX,SUM
            MOV  BX,10
    REPEAT1:CMP  AX,0
            JZ   NEXT
            XOR  DX,DX
            DIV  BX
            PUSH DX
            INC  CX
            
            JMP  REPEAT1

    NEXT:   CMP  CX,0
            JZ   EXIT
            POP  DX
            ADD  DL,30H
            MOV  AH,02H
            INT  21H
            DEC  CX
            JMP  NEXT
        




    EXIT:   MOV  AX,4C00H
            INT  21H
MAIN ENDP
    END MAIN 