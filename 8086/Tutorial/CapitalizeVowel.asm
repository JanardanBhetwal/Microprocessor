TITLE CAPITALIZE THE VOWEL ONLY
    .MODEL SMALL
    .STACK 32
.DATA
    MAXLEN  DB 50
    ACTLEN  DB ?
    STRING1 DB 50 DUP('$')
.CODE
MAIN PROC FAR
         MOV  AX,@DATA
         MOV  DS,AX

         LEA  DX,MAXLEN
         MOV  AH,0AH
         INT  21H

         MOV  CL,ACTLEN
         MOV  CH,00
         MOV  DH,00
         LEA  SI,STRING1
    LUP1:MOV  DL,[SI]

         CMP  DL,'a'
         JE   DO
         CMP  DL,'e'
         JE   DO
         CMP  DL,'i'
         JE   DO
         CMP  DL,'o'
         JE   DO
         CMP  DL,'u'
         JE   DO
         JMP  SKIP
        
    DO:  SUB  DL,'a'
         ADD  DL,'A'
            
    SKIP:MOV  [SI],DL

         INC  SI
         LOOP LUP1

    ;NEWLINE
         MOV  AH,02H
         MOV  DL,0AH
         INT  21H

    ;DISPLAY STRING
         LEA  DX,STRING1
         MOV  AH,09H
         INT  21H

         MOV  AX,4C00H
         INT  21H
MAIN ENDP
    END MAIN