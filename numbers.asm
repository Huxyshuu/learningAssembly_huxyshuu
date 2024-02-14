%include "functions.asm"

SECTION .text
global _start

_start:
	
    mov     ecx, 0 ; ecx is initialized to zero

nextNumber:
    inc     ecx
    mov     eax, ecx
    call    iprintLF
    cmp     ecx, 123
    jne     nextNumber

    call    quit


