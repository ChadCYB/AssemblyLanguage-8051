	ORG	0000H
;
LOOP:	MOV	P3,#11111110B
	JNB	P3.7,KEY0
	JNB	P3.6,KEY1
	JNB	P3.5,KEY4
	JNB	P3.4,KEY7
;
 	MOV	P3,#11111101B
	JNB	P3.7,KEYA
	JNB	P3.6,KEY2
	JNB	P3.5,KEY5
	JNB	P3.4,KEY8
;
	MOV	P3,#11111011B
	JNB	P3.7,KEYB
	JNB	P3.6,KEY3
	JNB	P3.5,KEY6
	JNB	P3.4,KEY9
;
	MOV	P3,#11110111B
	JNB	P3.7,KEYF
	JNB	P3.6,KEYE
	JNB	P3.5,KEYD
	JNB	P3.4,KEYC
	AJMP	LOOP
;
KEY0:	MOV	P1,#11111111B
	AJMP	LOOP


KEY1:	CALL		RIGHT
	AJMP		LOOP


KEY2:	CALL		LEFT
	AJMP		LOOP
	


KEY3:	MOV	P1,#11111100B
	AJMP	LOOP
KEY4:	MOV	P1,#11111011B
	AJMP	LOOP
KEY5:	MOV	P1,#11111010B
	AJMP	LOOP
KEY6:	MOV	P1,#11111001B
	AJMP	LOOP
KEY7:	MOV	P1,#11111000B
	AJMP	LOOP
KEY8:	MOV	P1,#11110111B
	AJMP	LOOP
KEY9:	MOV	P1,#11110110B
	AJMP	LOOP
KEYA:	MOV	P1,#11110101B
	AJMP	LOOP
KEYB:	MOV	P1,#11110100B
	AJMP	LOOP
KEYC:	MOV	P1,#11110011B
	AJMP	LOOP
KEYD:	MOV	P1,#11110010B
	AJMP	LOOP
KEYE:	MOV	P1,#11110001B
	AJMP	LOOP
KEYF:	MOV	P1,#11110000B
	AJMP	LOOP

RIGHT	 MOV		A,#0FEH
GOR:	 RR		A
	 MOV		P1,A
	 CALL		DELAY
	 CJNE		A,#0FEH,GOR
	 AJMP		LOOP

LEFT	 MOV		A,#07FH
GOL:	 RL		A
	 MOV		P1,A
	 CALL		DELAY
	 CJNE		A,#07FH,GOL
	 AJMP		LOOP

DELAY:
	 MOV		R5,#2
DL2:	 MOV		R4,#199
DL1:	 MOV		R3,#250
	 DJNZ		R3,$
	 DJNZ		R4,DL1
	 DJNZ		R5,DL2
	 RET



	END