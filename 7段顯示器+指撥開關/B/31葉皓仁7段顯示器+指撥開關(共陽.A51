		ORG		0000H
		MOV		R0,#5
TEST:
		MOV		P1,#0FFH
		JNB		P1.0,CASEU
		JNB		P1.1,CASED
		JNB		P1.7,CASE1
		JNB		P1.6,CASE2
		JNB		P1.5,CASE3
            JNB         P1.3,CASE4
            JNB         P1.2,CASE5
		AJMP		TEST
CASEU:
		JB		P1.0,$
		ACALL		DELAY1
		JNB		P1.0,$
		ACALL		DELAY1
		DEC		R0
		CJNE		R0,#0,TEST
		MOV		R0,#1
		AJMP		TEST
CASED:
		JB		P1.1,$
		ACALL		DELAY1
		JNB		P1.1,$
		ACALL		DELAY1
		INC		R0
		CJNE		R0,#5,TEST
		MOV		R0,#4
            AJMP        TEST
CASE1:
            MOV         R1,#1
LOOP:       MOV         A,R1
            MOV         DPTR,#DATA
            MOVC        A,@A+DPTR
            MOV         P0,A
            INC         R1
            ACALL       DELAY2
            CJNE        R1,#11,LOOP
            AJMP        TEST 
CASE2:      
            MOV         R1,#10
LOOP1:      MOV         A,R1
            MOV         DPTR,#DATA
            MOVC        A,@A+DPTR
            MOV         P0,A
            DEC         R1
            ACALL       DELAY2
            CJNE        R1,#0,LOOP1
            AJMP        TEST
		
CASE3:	
            MOV         R1,#1
ABC:        MOV         A,R1
            MOV         DPTR,#DATA
            MOVC        A,@A+DPTR
            MOV         P0,A
            INC         R1
            ACALL       DELAY2
            CJNE        R1,#10,ABC
            AJMP        ABC1 
ABC1:       MOV         R1,#10
CCC:        MOV         A,R1
            MOV         DPTR,#DATA
            MOVC        A,@A+DPTR
            MOV         P0,A
            DEC         R1
            ACALL       DELAY2
            CJNE        R1,#0,CCC
            AJMP        TEST
;³Ì°ª³t
CASE4:    
            JB		P1.0,$
		ACALL		DELAY1
		JNB		P1.0,$
            MOV         R5,1
		ACALL		DELAY1
            AJMP        TEST
CASE5:      JB		P1.0,$
		ACALL		DELAY1
		JNB		P1.0,$
            MOV         R5,5
		ACALL		DELAY1
            AJMP        TEST

DELAY1:
		MOV		R3,#100
DEL2		MOV		R4,#100
DEL3		DJNZ		R4,DEL3
		DJNZ		R3,DEL2
		RET

		END
DELAY2:
            MOV      R5,R0
DL2:        MOV      R4,#200
DL1:        MOV      R3,#250
            DJNZ     R3,$
            DJNZ     R4,DL1
            DJNZ     R5,DL2
            RET
            END

DATA:
       DB       0C0H
       DB       0C0H  ;0
       DB       0F9H  ;1
       DB       0A4H  ;2
       DB       0B0H  ;3
       DB       099H  ;4
       DB       092H  ;5
       DB       082H  ;6
       DB       0F8H  ;7
       DB       080H  ;8
       DB       090H  ;9
       DB       090H
       END