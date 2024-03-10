TITLE TO DISPLAY SUM OF SERIES
      .MODEL SMALL
      .STACK 32
.DATA
    NUM    DW 0
    SUM    DW 0
    MAXLEN DB 10
    ACTLEN DB ?
    INPUT  DB 10 DUP ('$')
    STR1   DB ('ENTER NUMBER FROM 0 TO 255: $')
    STR2   DB ('THE SUM OF THE SERIES IS: $')
.CODE
MAIN PROC FAR
         MOV  AX,@DATA
         MOV  DS,AX

    ;FIRST MESSAGE
         LEA  DX,STR1
         MOV  AH,09H
         INT  21H

    ;INPUT STRING
         LEA  DX,MAXLEN
         MOV  AH,0AH
         INT  21H

    ;NEWLINE
         MOV  AH,02H
         MOV  DL,0AH
         INT  21H

    ;FINAL MESSAGE
         LEA  DX,STR2
         MOV  AH,09H
         INT  21H

    ;STRING TO NUMBER
         LEA  SI,INPUT
         MOV  CL,ACTLEN
         MOV  CH,00H

    LUP1:MOV  BL,[SI]
         SUB  BL,30H
         MOV  BH,00H
         MOV  AX,10
         MUL  NUM
         MOV  NUM,AX
         ADD  NUM,BX
         INC  SI
         LOOP LUP1
           
    ;SUM OF SERIES
         MOV  BL,01
         MOV  CX,NUM
    LUP2:MOV  AL,BL
         INC  BL
         MUL  BL
         ADD  SUM,AX
         LOOP LUP2

    ;PUSH INTO THE STACK
         MOV  CX,00
         MOV  BX,10
         MOV  AX,SUM

    LUP3:CMP  AX,0
         JZ   NEXT
         XOR  DX,DX
         DIV  BX
         PUSH DX
         INC  CX
         JMP  LUP3

    ;POP AND DISPLAY
    NEXT:CMP  CX,0
         JZ   EXIT
         POP  DX
         ADD  DX,30H
         DEC  CX
         MOV  AH,02H
         INT  21H
         JMP  NEXT


    EXIT:MOV  AX,4C00H
         INT  21H
MAIN ENDP
      END MAIN