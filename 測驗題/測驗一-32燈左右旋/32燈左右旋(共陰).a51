        ORG    00H
        JMP    START
        ORG    10H
START:  MOV    A,#01H
	  MOV	   P0,#0
	  MOV	   P1,#0
	  MOV	   P2,#0
	  MOV	   P3,#0

PORT0:  MOV	   P3,#0
	  MOV    P0,A
        RLC    A
        CALL  DELAY
        JB     P0.7,PORT1
	  JMP    PORT0

PORT1:  MOV	   P0,#0
	  MOV    P1,A
        RLC    A
        CALL   DELAY
        JB     P1.7,PORT2
        JMP    PORT1

PORT2:  MOV	   P1,#0
	  MOV    P2,A
        RLC    A
        CALL   DELAY
        JB     P2.7,PORT3
        JMP    PORT2

PORT3:  MOV	   P2,#0
	  MOV    P3,A
        RLC    A
        CALL   DELAY
        JB     P3.7,PORT3R
        JMP    PORT3

PORT3R: MOV	   P2,#0
	  MOV    P3,A
        Rrc    A
        CALL  DELAY
        JB     P3.0,PORT2R
	  JMP    PORT3R

PORT2R: MOV	   P3,#0
	  MOV    P2,A
        Rrc    A
        CALL   DELAY
        JB     P2.0,PORT1R
        JMP    PORT2R
PORT1R: MOV	   P2,#0
	  MOV    P1,A
        Rrc    A
        CALL   DELAY
        JB     P1.0,PORT0R
        JMP    PORT1R

PORT0R: MOV	   P1,#0
	  MOV    P0,A
        RrC    A
        CALL   DELAY
        JB     P0.0,PORT0
        JMP    PORT0R



        ;========= DELAY SUB ========
DELAY:  
	  MOV	   R5,#1
DL2:	  MOV    R6,#200
DL1:    MOV    R7,#250
        DJNZ   R7,$
        DJNZ   R6,DL1
	  DJNZ   R5,DL2 
        RET
        END
        ;============================
