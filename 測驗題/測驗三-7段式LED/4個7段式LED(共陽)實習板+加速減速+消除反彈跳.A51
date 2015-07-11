;=====7SEG 4位數=====
		ORG	00H
		JMP	START
		ORG	30H
START:	MOV	31H,#0C0H
		MOV	32H,#0C0H
		MOV	33H,#0C0H
		MOV	34H,#0C0H
	      MOV   R0,#50
	      MOV   R1,#0
		MOV	R2,#0
		MOV	R3,#0
		MOV	R4,#0
		MOV	P0,#0C0H
		MOV	P1,#0FFH

LOOP:		MOV	R7,R0
	      JNB     P3.0,CASEU      ;若P3.0=0(即接地)，則跳到CASEU執行加速
	      JNB     P3.1,CASED      ;若P3.1=0(即接地)，則跳到CASED執行減速 

		CALL	DISP			;掃描顯示副程式
		CALL	INCNUM		;各數字顯示資料

		JMP	LOOP
;=====增加資料暫存器內容副程式=====
INCNUM:
 		MOV	A,R1
		MOV	DPTR,#DATA
		MOV	P1,#11111110B
		MOVC	A,@A+DPTR
		MOV	P0,A
		MOV	31H,P0
		INC	R1
		MOV	A,R1
		ADD	A,#246	;判斷R1內容是否=10
		JZ	INCNUM1
		RET

INCNUM1:	MOV	R1,#0
		MOV	A,R2
		MOV	DPTR,#DATA
		MOV	P1,#11111101B
		MOVC	A,@A+DPTR
		MOV	P0,A
		MOV	32H,P0
		INC	R2
		MOV	A,R2
		ADD	A,#246	;判斷R2內容是否=10
		JZ	INCNUM2
		RET

INCNUM2:	MOV	R2,#0
		MOV	A,R3
		MOV	DPTR,#DATA
		MOV	P1,#11111011B
		MOVC	A,@A+DPTR
		MOV	P0,A
		MOV	33H,P0
		INC	R3
		MOV	A,R3
		ADD	A,#246	;判斷R3內容是否=10
		JZ	INCNUM3
		RET

INCNUM3:	MOV	R3,#0
		MOV	A,R4
		MOV	DPTR,#DATA
		MOV	P1,#11110111B
		MOVC	A,@A+DPTR
		MOV	P0,A
		MOV	34H,P0
		INC	R4
		MOV	A,R4
		ADD	A,#246	;判斷R4內容是否=10
		JZ	INCNUM4
		RET

INCNUM4:	MOV	R4,#0
		RET

;=========加    速==========
CASEU:
	  JB	    P3.0,$		  ;消除接點反彈跳;若P3.0為高態1，則程式停留在此;若P1.0為低態0，則程式往下執行        
	  ACALL   DELAY		  ;消除接點反彈跳
	  JNB	    P3.0,$		  ;消除接點反彈跳;若P3.0為低態0，則程式停留在此;若P1.0為高態1，則程式往下執行
	  ACALL   DELAY		  ;消除接點反彈跳

	  MOV	    R0,#1
        AJMP    LOOP
; ==========減    速==========
CASED:
	  JB	    P3.1,$		  ;消除接點反彈跳;若P3.1為高態1，則程式停留在此;若P1.0為低態0，則程式往下執行        
	  ACALL   DELAY		  ;消除接點反彈跳
	  JNB	    P3.1,$		  ;消除接點反彈跳;若P3.1為低態0，則程式停留在此;若P1.0為高態1，則程式往下執行
	  ACALL   DELAY		  ;消除接點反彈跳

	  MOV	    R0,#50
        AJMP    LOOP


;====掃描顯示副程式======
DISP:		
		MOV	P0,31H			;顯示個位數		
		MOV	P1,#11111110B
		MOV	P1,#11111111B

		MOV	P0,32H			;顯示十位數
		MOV	P1,#11111101B
		MOV	P1,#11111111B

		MOV	P0,33H			;顯示百位數
		MOV	P1,#11111011B
		MOV	P1,#11111111B

		MOV	P0,34H			;顯示千位數
		MOV	P1,#11110111B
		MOV	P1,#11111111B

		CALL	DELAY
		DJNZ	R7,DISP
		RET

;==========DELAY TIME==========
DELAY		MOV	R5,#10
DELAY1:	MOV	R6,#50
		DJNZ	R6,$
		DJNZ	R5,DELAY1
		RET

DATA:
		DB	0F9H
		DB	0A4H
		DB	0B0H
		DB	099H
		DB	092H
		DB	082H
		DB	0F8H
		DB	080H
		DB	090H
		DB	0C0H
		END





