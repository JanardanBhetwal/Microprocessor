TITLE to sum numbers from 0 to 255	
	.MODEL SMALL
	.STACK 32
.DATA
    SUM  DW ?
.CODE
MAIN PROC FAR
         MOV  AX,@DATA
         MOV  DS,AX

    L1:  MOV  CX,255
         ADD  DX,CX
         LOOP L1

         MOV  SUM,DX

         MOV  AH,4CH
         INT  21H
MAIN ENDP
	END MAIN