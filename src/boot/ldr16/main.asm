bits 16
org 0x8000

global start

jmp start

start:
	mov si, msg_loading_ints
	call puts
	
	mov si, int21h_dap
	mov [disk], dl
	mov ah, 0x42
	int 0x13
		jc .error_loading_int
	
	xor ax, ax
	mov es, ax
	
	cli
		mov [es:84], 0x4000
		mov [es:86], 0x0000
	sti
	
	
	mov si, msg_loading_ints_done
	call puts
	mov si, msg_testing_ints_output
	mov ax, 1
	int 0x21
	
	push dx
	mov si, kernel_dap
	mov ah, 0x42
	int 0x13
		jc .error_kernel_loading
	
	pop dx
	mov si, msg_loading_kernel_done
	call puts
	jmp 0x1000, 0x0000

.error_loading_int:
	mov si, msg_err_int_loading
	call puts
	cli
		hlt


.error_kernel_loading:
	mov si, msg_err_kernel_loading
	int 0x21
	mov ax, 2
	cli
		hlt
		jmp .error_loading_kernel
	


; messages

msg_loading_ints:
	db 'Loading ints...', 13, 10, 0

msg_err_int_loading:
	db 'Interrput has been no loaded, System halted.', 13, 10, 0

msg_err_kernel_loadingL
	db 'Boot panic: Kernel sectors not found!', 13, 10, 'System Halted.', 0

msg_testing_ints_output:
	db 'If there is text and kernel is loading, then it works!', 13, 10, 0

msg_loadig_ints_done:
	db 'int 0x21 has been loaded', 13, 10, 0

; variables

disk:
	byte 0 ; wa have no resb cuz it 16bit mode

kernel_dap:
	db 16
	db 0
	dw 16 ; 8 kilobytes
	dw 0x1000
	dw 0x0000
	dq 19

int21h_dap:
	db 16
	db 0
	dw 2 ; 1 kilobyte
	dw 0x0000
	dw 0x4000
	dq 17

times 8196-($-$$) db 0
