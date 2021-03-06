		ORG		0000H
		MOV		R0,#10
		MOV		R1,#00000001B
		MOV		R2,#11111111B
TEST:
		MOV		P1,#0FFH
		JNB		P1.0,CASEU
		JNB		P1.1,CASED
		JNB		P1.2,CASEH
		JNB		P1.3,CASEL
		JNB		P1.7,CASE1
		JNB		P1.6,CASE2
		JNB		P1.5,CASE3
		AJMP		TEST
CASEU:
		JB		P1.0,$
		ACALL		DELAY
		JNB		P1.0,$
		ACALL		DELAY1
		DEC		R0
		CJNE		R0,#0,TEST
		MOV		R0,#1
		AJMP		TEST
CASED:
		JB		P1.1,$
		ACALL		DELAY1
		JNB		P1.0,$
		ACALL		DELAY1
		INC		R0
		CJNE		R0,#10,TEST
		MOV		R0,#9
CASEH:	
		JB		P1.2,$
		ACALL		DELAY
		JNB		P1.2,$
		ACALL		DELAY1
		MOV		R0,#1
		AJMP		TEST

CASEL:	
		JB		P1.3,$
		ACALL		DELAY
		JNB		P1.3,$
		ACALL		DELAY1
		MOV		R0,#9
		AJMP		TEST
CASE1:
START1:
	MOV	R2,#0
LOOP1:
	MOV	A,R2
	MOV	DPTR,#DATA1
	MOVC	A,@A+DPTR
	MOV	P0,A
	INC	R2
	ACALL	DELAY
	CJNE	R2,#10,LOOP1
	AJMP	TEST
CASE2:
START2:
	MOV	R2,#0
LOOP2:
	MOV	A,R2
	MOV	DPTR,#DATA2
	MOVC	A,@A+DPTR
	MOV	P0,A
	INC	R2
	ACALL	DELAY
	CJNE	R2,#10,LOOP2
	AJMP	TEST
CASE3	
START3:
	MOV	R2,#0
LOOP3:
	MOV	A,R2
	MOV	DPTR,#DATA1
	MOVC	A,@A+DPTR
	MOV	P0,A
	INC	R2
	ACALL	DELAY
	CJNE	R2,#10,LOOP3
	MOV	R2,#0
	AJMP	LOOP4
LOOP4:
	MOV	A,R2
	MOV	DPTR,#DATA2
	MOVC	A,@A+DPTR
	MOV	P0,A
	INC	R2
	ACALL	DELAY
	CJNE	R2,#10,LOOP4
	AJMP	TEST
DATA4:
	DB	090H		
	DB	080H
	DB	0F8H
	DB	082H
	DB	092H
	DB	099H
	DB	0B0H
	DB	0A4H
	DB	0F9H
	DB	0C0H	
	END
DELAY		MOV		R5,R0
DL1		MOV		R6,#50
DL2		MOV		R7,#100
DL3		DJNZ		R7,DL3
		DJNZ		R6,DL2
		DJNZ		R5,DL1
		RET
DELAY1:
		MOV		R3,#100
DEL2		MOV		R4,#100
DEL3		DJNZ		R4,DEL3
		DJNZ		R3,DEL2
		RET

		END
DATA1:
	DB	0C0H
	DB	0F9H
	DB	0A4H
	DB	0B0H
	DB	099H
	DB	092H
	DB	082H
	DB	0F8H
	DB	080H
	DB	090H
	END
DATA2:
	DB	090H		
	DB	080H
	DB	0F8H
	DB	082H
	DB	092H
	DB	099H
	DB	0B0H
	DB	0A4H
	DB	0F9H
	DB	0C0H
	END

