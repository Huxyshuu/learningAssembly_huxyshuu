SECTION .data
	msg		db "Yo this assembly is neeto!", 0x0A

SECTION .text
global _start

_start:
	mov		eax, msg
	call 	strlen

	mov 	edx, eax
	mov 	ecx, msg
	mov 	ebx, 1
	mov 	eax, 4
	int 	0x80

	mov 	eax, 1 		; return 0 status on exit - "No errors"
	mov 	ebx, 0 		; invoke SYS_EXIT (kernel opcode 1)
	int 	0x80

strlen:
	push 	ebx
	mov 	ebx, eax

nextchar:
	cmp 	byte[eax], 0 ; compare the byte pointed to by EAX at this address against zero (Zero is an end of string delimiter)
	jz 		finished
	inc 	eax
	jmp 	nextchar

finished:
	sub 	eax, ebx
	pop 	ebx
	ret


