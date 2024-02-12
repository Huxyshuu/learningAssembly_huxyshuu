;---------------------------------------
; int strlen(String message)
; String length calculation function
strlen:
    push    ebx
    mov     ebx, eax

nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar

finished:
    sub     eax, ebx
    pop     ebx
    ret


;---------------------------------------
; void sprint(String message)
; String printing function
sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax
    call    strlen

    mov     edx, eax
    pop     eax

    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    pop     ebx
    pop     ecx
    pop     edx
    ret

;---------------------------------------
; void sprintLF(String message)
; String printing with line feed function
sprintLF:
    call sprint

    push eax
    mov eax, 0x0A
    push eax
    mov eax, esp
    call sprint
    pop eax
    pop eax
    ret


;---------------------------------------
; void exit()
; Exit program and restore resources
quit:
    mov     ebx, 0
    mov     eax, 1
    int     0x80
    ret