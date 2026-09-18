bits 16
org 0x7c00

jmp start

start:
	cli
		mov ax, 0x9000
		mov ss, ax
		mov sp, 0xfffe
	sti
	xor ax, ax
	mov ds, ax
	mov es, ax
	; mov fs, ax
	
	mov si, msg_loading
	call puts

	mov si, DAP
	mov byte [disk_number], dl
	mov ah, 0x42
	int 0x13
		jc .error
	jmp 0x0000:0x8000

.error:
	mov si, boot_panic
	call puts
	cli
		hlt
	
	jmp .error


puts:
	pusha
	xor ax, ax
	mov ah, 0x0e
.loop:
	lodsb
	test al, al
		jz .done
	int 0x10
	jmp .loop
.done:
	popa
	ret

msg_loading: db 'Loading system...', 13, 10, 0x00
boot_panic: db 'Boot panic: read disk error, system halted', 0x00

disk_number: resb 1

DAP:
	db 16
	db 0
	dw 16
	dw 0x8000
	dw 0x0000
	dq 1

times 510-($-$$) db 0
dw 0x55aa
