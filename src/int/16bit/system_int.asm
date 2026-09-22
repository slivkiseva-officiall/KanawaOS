bits 16
org 0x4000

start:
	push ax
	push bx
	push cx
	push dx
	push si
	cmp ax, 1
		je output
	cmp ax, 2
		je return_to_kernel

output:
	xor ax, ax
	mov ah, 0x0e
.loop:
	lodsb
	test al, al
	jz done
	int 0x10
	jmp .loop

done:
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	iret

bits 1024-($-$$) db 0x00