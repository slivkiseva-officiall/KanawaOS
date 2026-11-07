bits 16
org 0x4000 ; it won't earse IVT

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
	cmp ax, 3
		je input

return_to_kernel:
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
	mov ax, 1
	jmp 0x1000:0x0000

input:
	push bp
	mov bp, sp
	sub bp, cx
.loop:
	mov ah, 0x00
	int 0x16
	cmp al, 0x0a
		je .exit_enter
	cmp al, 0x7f
		je .loop_backspace
	; so, there will be like that:
	; for (int i = 0; i > cx; ++i) {
	; 	memory[i + bp] = al;
	; }
	; so it will upside down (if i made mistake in english - i don't know english well)

.write_to_varibale:
	; to write text in variable right we're need to do it from end.


.exit:
	call .write_to_variable
	pop bp
	pop si
	pop dx
	pop cx
	pop bx
	pop ax

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
