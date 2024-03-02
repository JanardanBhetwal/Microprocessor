TITLE to compare two tables of ten 16-bit data and store in the third tables
    .MODEL SMALL
    .STACK 32H
.DATA
    TABLE1 DW 10 DUP(3333H)
    TABLE2 DW 10 DUP(4444H)
    TABLE3 DW 10 DUP(?)
.CODE
MAIN PROC FAR
            MOV  AX,@DATA
            MOV  DS,AX

            MOV  CX,0AH
            MOV  BX,00H
    SUMLOOP:MOV  DX,TABLE1[BX]
            CMP  DX,TABLE2[BX]
           
            JB   SKIP1
            MOV  AX,0000H
            JMP  SKIP2

    SKIP1:  MOV  AX,1FFFH
    SKIP2:  MOV  TABLE3[BX],AX


            ADD  BX,2
            LOOP SUMLOOP

            MOV  AX,4C00H
            INT  21H
MAIN ENDP
    END MAIN