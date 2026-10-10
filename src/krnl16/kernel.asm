org 0x10000
btis 16

jmp loading

kmain:
	mov si, msg
	int 0x40
	mov ax, 0
	jmp halt


halt:
	cmp ax, 0
	jne kernelpanic
	cli
		hlt

kernelpanic:
	nop

msg:
	db 'loaded!', 10, 13, 0

