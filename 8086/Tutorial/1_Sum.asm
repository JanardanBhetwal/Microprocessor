TITLE ADD ALL NUMBERS OF DATA BETWEEN 50 AND 150 OF THE TABLE OF 10 DATAS
    .MODEL SMALL
    .STACK 32
.DATA
        DAT    DW 30,60,70,80,120,140,160,190,220,20
        STRING DB 'The sum of the numbers is $'
        SUM    DW ?
   
.CODE
MAIN PROC FAR
                MOV  AX,@DATA
                MOV  DS,AX

        ;DISPLAY STRING
                LEA  DX,STRING
                MOV  AH,09H
                INT  21H

                LEA  SI,DAT
                MOV  AX,0
                MOV  CX,10
    
        ;SUM OF DATA
        L1:     
                CMP  WORD PTR [SI],50
                JB   SKIP
                CMP  WORD PTR [SI],150
                JA   SKIP
                ADD  AX,[SI]
        SKIP:   INC  SI
                INC  SI
                LOOP L1

                MOV  SUM,AX

    

        ;PUSH THE NUMBER IN THE STACK
                MOV  AX, SUM
                MOV  CX,0
                MOV  DX,0
                MOV  BX,10
                
        REPEAT1:CMP  AX,0
                JZ   NEXT
        ; XOR  DX,DX
                DIV  BX                       ;AX/BX=AX/10
                PUSH DX                       ;PUSH REMAINDER
                INC  CX                       ;INCREMENT COUNT
                MOV  DX,0
                JMP  REPEAT1

        ;POP THE NUMBERS FROM THE STACK AND DISPLAY
        NEXT:   CMP  CX,0
                JZ   EXIT
                POP  DX
                ADD  DX,30H
                MOV  AH,02H
                INT  21H
                DEC  CX
                JMP  NEXT
            
        EXIT:   MOV  AX,4C00H
                INT  21H
MAIN ENDP
    END MAIN