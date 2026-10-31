org 0x10000
btis 16

jmp loading

%include "libes/kanawstr.asm"

loading:
	cmp ax, 1
		je .del_iret
	jmp .init
.del_iret:
	add sp, 2
.init:
	mov ax, 0x1000
	mov ds, ax

kmain:
	mov si, msg
	mov ax, 1
	int 0x42
.loop:
	call shell
	cmp ax, 1
	je .turnoff
.turnoff
	mov ax, 0
	jmp halt

shell:
	mov si, msg_prompt
	mov ax, 1
	int 0x42
	mov bx, buffer
	mov ax, 3
	mov cx, 16
	int 0x42
	push buffer
	push exit_inputed
	call strcmp
	add sp, 4
	cmp ax, 0
		je .exit
.exit:
	mov ax, 1
.done:



halt:
	cmp ax, 0
	jne kernelpanic
	cli
		hlt

kernelpanic:
	nop

msg:
	db 'loaded!', 10, 13, 0

exit_inputed:
	db 'exit', 0

prompt:
	db '[KANAWAOS] > ', 0

timee 8192-($-$$) db 0
