%include "functions.asm"

SECTION .data
msg1	db		"Yo this assembly is neeto!", 0x0
msg2	db		"Yo recycling in NASM", 0x0

SECTION .text
global _start

_start:
	mov		eax, msg1
	call 	sprintLF

	mov 	eax, msg2
	call 	sprintLF
	
	call 	quit


