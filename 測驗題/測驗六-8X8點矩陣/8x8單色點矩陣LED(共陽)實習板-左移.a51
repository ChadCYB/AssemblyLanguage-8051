        ORG     0000H
START:  MOV     DPTR,#TABLE		;�NTABLE��}�h�����ƫ��мȦs��DPTR�̭�
        MOV     R3,#OK-TABLE+1	;�p�����ܸ�ƪ���
;==============�D�{��============
LOOP:   
	  MOV     R2,#1			;��ܸ�Ƶ{������
SCAN:   ACALL   SCAN1			;��ܸ�Ƶ{��
        DJNZ    R2,SCAN			;�N�Ȧs��R2�̭������-1,�Y��0�h�V�U����;�Y����0�h�~�����аOSCAN�{��
        INC     DPTR			;�N�Ȧs����ƫ��мȦs��DPT�̭������+1
        DJNZ    R3,LOOP			;�N�Ȧs��R3�̭������-1,�Y��0�h�V�U����;�Y����0�h�~�����аOSCAN�{��
        AJMP    START



;==========��ܸ�Ƶ{��==========
SCAN1:  MOV     R1,#00H


        MOV     R5,#01111111B		;�ǳƱҰʳ̥���Ĥ@��LED
        MOV     R4,#08
LOOP1:  MOV     A,R1			;�NTABLE������ƨ̧ǰe��P0
        MOVC    A,@A+DPTR		;�NTABLE������ƨ̧ǰe��P0
        
	  MOV     P0,A			;�NTABLE������ƨ̧ǰe��P0
        MOV     P1,R5			;�ǳƱҰʳ̥���Ĥ@��LED
        MOV     R6,#5			;��ܸ�ư��d�ɶ�
;DL1:    MOV     R7,#200			;��ܸ�ư��d�ɶ�
;DL2:    DJNZ    R7,DL2			;��ܸ�ư��d�ɶ�
;        DJNZ    R6,DL1			;��ܸ�ư��d�ɶ�
        MOV     P1,#11111111B		;�NLED��������
        MOV     A,R5			;����R5��0����m�̧ǱҰʤ��P���LED
        RR      A				;����R5��0����m�̧ǱҰʤ��P���LED
        MOV     R5,A			;����R5��0����m�̧ǱҰʤ��P���LED
        INC     R1			;����R5��0����m�̧ǱҰʤ��P���LED
        DJNZ    R4,LOOP1		;����R5��0����m�̧ǱҰʤ��P���LED
        RET
;========��ư�==========
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