	ORG	00H
	MOV	R0,#10
	
TEST:	MOV	P1,#0FFH
	JNB	P1.0,CASEU
	JNB	P1.1,CASED
	JNB	P1.7,CASE1
	JNB	P1.6,CASE2
	JNB	P1.5,CASE3
	JNB	P1.4,CASE4
	JNB	P1.3,CASE5
	AJMP	TEST
CASEU:
	JB	P1.0,$
	ACALL	DELAY1
	JNB	P1.0,$
	ACALL	DELAY1
	DEC	R0
	CJNE	R0,#0,test
	MOV	R0,#1
	AJMP	TEST
CASED:
	JB	P1.1,$
	ACALL	DELAY1
	JNB	P1.1,$
	ACALL	DELAY1
	INC	R0
	CJNE	R0,#10,TEST
	MOV	R0,#9
	AJMP	TEST
CASE1:
	MOV	R2,#1
LOOP:
	MOV	A,R2
	MOV	DPTR,#DATA
	MOVC	A,@A+DPTR
	MOV	P0,A
	INC	R2
	ACALL	DELAY
	CJNE	R2,#11,LOOP
	AJMP	TEST
	AJMP	CASE1
CASE2:
	MOV	R2,#10
LOOP2:
	MOV	A,R2
	MOV	DPTR,#DATA
	MOVC	A,@A+DPTR
	MOV	P0,A
	DEC	R2
	ACALL	DELAY
	CJNE	R2,#0,LOOP2
	AJMP	TEST
	AJMP	CASE2

CASE3:
	MOV	R2,#1
LOOP3:
	MOV	A,R2
	MOV	DPTR,#DATA
	MOVC	A,@A+DPTR
	MOV	P0,A
	INC	R2
	ACALL	DELAY
	CJNE	R2,#10,LOOP3

	MOV	R2,#10
LOOP4:
	MOV	A,R2
	MOV	DPTR,#DATA
	MOVC	A,@A+DPTR
	MOV	P0,A
	DEC	R2
	ACALL	DELAY
	CJNE	R2,#1,LOOP4
	AJMP	TEST
	AJMP	CASE3
CASE4:	
	MOV	R0,#1
	AJMP	TEST
CASE5:	
	MOV	R0,#10
	AJMP	TEST
DELAY	MOV	R5,R0
DL1	MOV	R6,#50
DL2	MOV	R7,#100
DL3	DJNZ	R7,DL3
	DJNZ	R6,DL2
	DJNZ	R5,DL1
	RET
DELAY1
	MOV	R3,#100
DEL2	MOV	R4,#100
DEL3	DJNZ	R4,DEL3
	DJNZ	R3,DEL2
	RET

	END

DATA:	DB	0C0H
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