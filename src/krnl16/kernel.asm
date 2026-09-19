; in user programs is you're done - jump on 0x10000


org 0x10000
bits 16

jmp loading

kmain:

.loop1:
	call shell
	cmp ax, 1
	je .turnoff
	jmp .loop
.turnoff:
	mov si, system_halted
	mov ax, 1
	int 0x21
	cli
	hlt

kernel_panic:
	; there is nothing

loading:
	; in user programs do this at first.
	mov ax, 0x1000
	mov ds, ax ; for working pointer
	mov es, ax

	mov si, loaded_msg
	mov ax, 1
	int 0x21
	jmp kmain

system_halted:
	db 'System Halted.', 13, 10, 0