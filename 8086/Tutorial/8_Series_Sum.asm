.MODEL SMALL
.STACK 32

.DATA
       SUM  DW ?

.CODE
MAIN PROC FAR
              MOV  AX, @DATA
              MOV  DS, AX

              MOV  BX,01H
              MOV  AX,00H
              MOV  CX,100

       ;SUM OF SERIES
       LUUP:  ADD  AX,BX
              INC  BX
              LOOP LUUP

              MOV  SUM,AX

              MOV  CX,00H
              MOV  DX,00H
              MOV  BX,10H

       ;PUSH INTO THE STACK
       REPET1:CMP  AX,00
              JZ   REPET2
              DIV  BX
              PUSH DX
              INC  CL
              JMP  REPET1

       ;POP AND DISPLAY
       REPET2:POP  DX
              ADD  DX,30H
              MOV  AH,02H
              INT  21H
              LOOP REPET2

              MOV  AX,4C00H
              INT  21H


MAIN ENDP
    END MAIN