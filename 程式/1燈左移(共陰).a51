	 ORG		00H
START: MOV		A,#00001000B
GOL:	 RL		A
	 MOV		P0,A
	 MOV		P1,A
	 CALL		DELAY
	 AJMP		GOL

DELAY:
	MOV		R5,#1
DL2:	MOV		R4,#100
DL1:	MOV		R3,#200
	DJNZ		R3,$
	DJNZ		R4,DL1
	DJNZ		R5,DL2
	RET
	END
	
	