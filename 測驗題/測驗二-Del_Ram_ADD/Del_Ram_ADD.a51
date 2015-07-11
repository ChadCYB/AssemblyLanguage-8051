		org	00h
		mov	a,#00
		mov	b,#00	
		mov	r0,#00h

;=========填滿RAM256BYTE內的資料=============
fill:
		mov	@r0,b
		inc	b
		inc	r0
		cjne	r0,#255,fill

;=========清除RAM256BYTE內的資料=============
		mov	b,#00	
del:
		mov	@r0,b
		inc	r0
		cjne	r0,#255,del
		
;==============開始兩數相加==================
begin:	mov	p0,#11000011b
		mov	p1,#10110011b
		mov	p2,#0
		mov	p3,#0

		mov	a,p0
		add	a,p1
		mov	p2,a		;低位元相加結果放在p2	
		jc	carry
		jmp	address
;=====相加結果超過8位元255，則執行進位處理===
carry:	inc	p3		;高位元相加結果放在p3

;===================暫存器間接定址法===================
;==相加結果另存一份放在RAM86H(高位元)及87H(低位元)處===
address	mov	r1,#86h
		mov	@r1,p3
		mov	r0,#87h
		mov	@r0,p2

;===================直接定址法===================
;==相加結果另存一份放在RAM36H(高位元)及37H(低位元)處===
		mov	36H,p3
		mov	37H,p2

		jmp	$