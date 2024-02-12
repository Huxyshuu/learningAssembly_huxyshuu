SECTION .data
	msg	db 'Hello Mom!', 0x0A

SECTION .text
global _start

_start:
	mov	ebx, msg
	mov eax, ebx

nextchar:
	cmp byte[eax], 0 ; compare the byte pointed to by EAX at this address against zero (Zero is an end of string delimiter)
	jz finished
	inc eax
	jmp nextchar

finished:
	sub eax, ebx	; subtract the address in EBX from the address in EAX
					; remember both registers started pointing to the same address (see line 15)
					; but EAX has been incremented one byte for each character in the message string
					; when you subtract one memory address from another of the same type
					; the result is number of segments between them - in this case the number of bytes
	
	mov edx, eax
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1 ; return 0 status on exit - "No errors"
	mov ebx, 0 ; invoke SYS_EXIT (kernel opcode 1)
	int 0x80


