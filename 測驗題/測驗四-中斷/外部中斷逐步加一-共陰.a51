;==========�~�����_����¦���=========
	
	ORG	00H
	JMP	START
	ORG	03H			;����~�����_INT0
	JMP	LEFT1			;����~�����_����
	ORG	13H			;����~�����_INT1
	JMP	RIGHT1		;����~�����_�k��

START:
	MOV	IE,#10000101B	;�]�w���_����
	MOV	IP,#10000100B	;�]�w���_�u���v
	MOV	TCON,#00H		;�]�w���_Ĳ�o����
	MOV	SP,#70		;�]�w���|�s��_�l��}

MAIN:					;�D�{��-�v�B�[�@�I�G
	INC	P0
	CALL	DELAY
	JMP	MAIN

LEFT1:				;�~�����_����
	PUSH	P0
	PUSH	R4
	PUSH	R5
	PUSH	R6
	MOV	P0,#0H
	CALL	DELAY
	MOV	A,#01H
	MOV	R1,#08
LEFT:
	MOV	P0,A
	CALL	DELAY
	RL	A
	DJNZ	R1,LEFT
	MOV	P0,#0H
	POP	R6
	POP	R5
	POP	R4
	POP	P0
	RETI

RIGHT1:				;����~�����_�k��
	PUSH	P0
	PUSH	R4
	PUSH	R5
	PUSH	R6
	MOV	P0,#0H
	CALL	DELAY
	MOV	A,#80H
	MOV	R1,#08
RIGHT:
	MOV	P0,A
	CALL	DELAY
	RR	A
	DJNZ	R1,RIGHT
	MOV	P0,#0H
	POP	R6
	POP	R5
	POP	R4
	POP	P0
	RETI

DELAY:				;����{��
	MOV	R4,#02
DL1:	MOV	R5,#100
DL2:	MOV	R6,#200
DL3:	DJNZ	R6,DL3
	DJNZ	R5,DL2
	DJNZ	R4,DL1
	RET
