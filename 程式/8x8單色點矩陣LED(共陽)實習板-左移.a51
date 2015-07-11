        ORG     0000H
START:  MOV     DPTR,#TABLE
        MOV     R3,#OK-TABLE+1
LOOP:   MOV     R2,#3
SCAN:   ACALL   SCAN1
        DJNZ    R2,SCAN
        INC     DPTR
        DJNZ    R3,LOOP
        AJMP    START

SCAN1:  MOV     R1,#00H
        MOV     R5,#01111111B
        MOV     R4,#08
LOOP1:  MOV     A,R1
        MOVC    A,@A+DPTR
        MOV     P0,A
        MOV     P1,R5

        MOV     R6,#5
DL1:    MOV     R7,#200
DL2:    DJNZ    R7,DL2
        DJNZ    R6,DL1

        MOV     P1,#11111111B
        MOV     A,R5
        RR      A
        MOV     R5,A
        INC     R1
        DJNZ    R4,LOOP1
        RET

TABLE:  DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111111B
; 1
        DB      11111111B
        DB      10111101B
        DB      00000001B
        DB      11111101B
        DB      11111111B
;
        DB      11111111B
        DB      11111111B
; 2
        DB      10111101B
        DB      01111001B
        DB      01110101B
        DB      01101101B
        DB      10011101B
;
        DB      11111111B
        DB      11111111B

OK:     DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111111B
        DB      11111111B
;
