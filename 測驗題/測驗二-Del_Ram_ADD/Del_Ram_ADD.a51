		org	00h
		mov	a,#00
		mov	b,#00	
		mov	r0,#00h

;=========��RAM256BYTE�������=============
fill:
		mov	@r0,b
		inc	b
		inc	r0
		cjne	r0,#255,fill

;=========�M��RAM256BYTE�������=============
		mov	b,#00	
del:
		mov	@r0,b
		inc	r0
		cjne	r0,#255,del
		
;==============�}�l��Ƭۥ[==================
begin:	mov	p0,#11000011b
		mov	p1,#10110011b
		mov	p2,#0
		mov	p3,#0

		mov	a,p0
		add	a,p1
		mov	p2,a		;�C�줸�ۥ[���G��bp2	
		jc	carry
		jmp	address
;=====�ۥ[���G�W�L8�줸255�A�h����i��B�z===
carry:	inc	p3		;���줸�ۥ[���G��bp3

;===================�Ȧs�������w�}�k===================
;==�ۥ[���G�t�s�@����bRAM86H(���줸)��87H(�C�줸)�B===
address	mov	r1,#86h
		mov	@r1,p3
		mov	r0,#87h
		mov	@r0,p2

;===================�����w�}�k===================
;==�ۥ[���G�t�s�@����bRAM36H(���줸)��37H(�C�줸)�B===
		mov	36H,p3
		mov	37H,p2

		jmp	$