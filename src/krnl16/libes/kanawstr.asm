; don't write org, it's lib

strcmp:
  ; strcmp is using push for args, so it will use bp  
  
	push bp
	mov bp, sp
	push bx
	push ax
.loop:
	mov al, [bp - 4]
	mov ah, [bp - 6]
  	cmp al, ah
		jne .done
	test word [bp - 4], 0
		jz .done
	lea ax, [bp - 4]
	add word [ax], 1
	lea ax, [bp - 6]
	add word [ax], 1
	jmp .loop

.done:
	pop ax
	mov al, [bp - 4]
	mov ah, [bp - 6]
	sub al, ah
	pop bx
	ret

strcpy:
	push bp
	mov bp, sp
	push bx
	push ax
.loop:
	mov al, [bp - 6]
	mov byte [bp - 4], al
	cmp al, 0
		je .done
	lea ax, [bp - 4]
	add word [ax], 1
	lea ax, [bp - 6]
	add word [ax], 1
	jmp .loop
.done:
	pop ax
	pop bx
	pop bp
	ret
strlen:
	push si
	xor ax, ax
.loop:
	lodsb
	test al, al
	jz .done
	inc ax
	jmp .loop
.done:
	pop si
	ret

