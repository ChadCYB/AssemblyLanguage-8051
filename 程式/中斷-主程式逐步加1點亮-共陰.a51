	    ORG 00H
          JMP BEGIN 
          ORG 03H
          JMP EXT0
          ORG 13H
          JMP EXT1
 
          ORG  70H
BEGIN:    MOV SP,#30H  
          MOV P0,#0H
          MOV IE,#10000101B
          MOV IP,#00000001B
          MOV A,#1       
MAIN 
          MOV P0,A
     	    INC A
          CALL DELAY
    	    JMP MAIN
     
EXT0:     PUSH PSW
          PUSH A
          CLR C
          MOV A,#01H
EXT0A:    MOV P0,A
          CALL DELAY
          RLC A
          JNC EXT0A
          POP A
          POP PSW
          RETI

EXT1:
          PUSH PSW
          PUSH A
          CLR C
          MOV A,#80H
EXT1A     MOV P0,A
          CALL DELAY
          RRC A
          JNC EXT1A
          POP A
          POP PSW
          RETI

DELAY     MOV R6,#200
C1        MOV R7,#200
C2        DJNZ R7,C2
          DJNZ R6,C1
          RET


