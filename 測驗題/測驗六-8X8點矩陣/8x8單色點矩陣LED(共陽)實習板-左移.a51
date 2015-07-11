        ORG     0000H
START:  MOV     DPTR,#TABLE		;將TABLE位址搬移到資料指標暫存器DPTR裡面
        MOV     R3,#OK-TABLE+1	;計算待顯示資料長度
;==============主程式============
LOOP:   
	  MOV     R2,#1			;顯示資料程式次數
SCAN:   ACALL   SCAN1			;顯示資料程式
        DJNZ    R2,SCAN			;將暫存器R2裡面的資料-1,若為0則向下執行;若不為0則繼續執行標記SCAN程式
        INC     DPTR			;將暫存器資料指標暫存器DPT裡面的資料+1
        DJNZ    R3,LOOP			;將暫存器R3裡面的資料-1,若為0則向下執行;若不為0則繼續執行標記SCAN程式
        AJMP    START



;==========顯示資料程式==========
SCAN1:  MOV     R1,#00H


        MOV     R5,#01111111B		;準備啟動最左邊第一欄LED
        MOV     R4,#08
LOOP1:  MOV     A,R1			;將TABLE內的資料依序送到P0
        MOVC    A,@A+DPTR		;將TABLE內的資料依序送到P0
        
	  MOV     P0,A			;將TABLE內的資料依序送到P0
        MOV     P1,R5			;準備啟動最左邊第一欄LED
        MOV     R6,#5			;顯示資料停留時間
;DL1:    MOV     R7,#200			;顯示資料停留時間
;DL2:    DJNZ    R7,DL2			;顯示資料停留時間
;        DJNZ    R6,DL1			;顯示資料停留時間
        MOV     P1,#11111111B		;將LED全部熄滅
        MOV     A,R5			;改變R5內0的位置依序啟動不同欄位LED
        RR      A				;改變R5內0的位置依序啟動不同欄位LED
        MOV     R5,A			;改變R5內0的位置依序啟動不同欄位LED
        INC     R1			;改變R5內0的位置依序啟動不同欄位LED
        DJNZ    R4,LOOP1		;改變R5內0的位置依序啟動不同欄位LED
        RET
;========資料區==========
TABLE:  
	  ;DB      11111111B
        ;DB      11111111B
        ;DB      11111111B
        ;DB      11111111B
       ; DB      11111111B
; 0

        DB      10000011B
        DB      01110101B
        DB      01101101B
        DB      01011101B
        DB      10000011B

;
        DB      11111111B
        DB      11111111B
; 1

        DB      11111111B
        DB      10111101B
        DB      00000001B
        DB      11111101B
        DB      11111111B

;
        DB      11111111B
        DB      11111111B

; 2

        DB      10111101B
        DB      01111001B
        DB      01110101B
        DB      01101101B
        DB      10011101B

;
        DB      11111111B
        DB      11111111B

; 3

        DB      01111011B
        DB      01111101B
        DB      01101101B
        DB      01001101B
        DB      00110011B

;
        DB      11111111B
        DB      11111111B
; 4

        DB      11100111B
        DB      11010111B
        DB      10110111B
        DB      00000001B
        DB      11110111B

;
        DB      11111111B
        DB      11111111B
; 5

        DB      00011011B
        DB      01011101B
        DB      01011101B
        DB      01011101B
        DB      01100011B

;
        DB      11111111B
        DB      11111111B
; 6

        DB      11000011B
        DB      10101101B
        DB      01101101B
        DB      01101101B
        DB      11110011B

;
        DB      11111111B
        DB      11111111B
; 7

        DB      01111111B
        DB      01111111B
        DB      01100001B
        DB      01011111B
        DB      00111111B

;
        DB      11111111B
        DB      11111111B
; 8

        DB      10010011B
        DB      01101101B
        DB      01101101B
        DB      01101101B
        DB      10010011B

;
        DB      11111111B
        DB      11111111B
; 9

        DB      10011111B
        DB      01101101B
        DB      01101101B
        DB      01101011B
        DB      10000111B

;
OK:  	  DB      11111111B