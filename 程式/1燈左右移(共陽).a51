	 ORG		00H
START: MOV		A,#0F7H
GOR:	 RR		A
	 MOV		P1,A
	 CALL		DELAY
	 CJNE		A,#0FEH,GOR
GOL:	 RL		A
	 MOV		P1,A
	 CALL		DELAY
	 CJNE		A,#07FH,GOL

	 AJMP		GOR
DELAY:
	MOV		R5,#1
DL2:	MOV		R4,#100
DL1:	MOV		R3,#200
	DJNZ		R3,$
	DJNZ		R4,DL1
	DJNZ		R5,DL2
	RET
	END
	