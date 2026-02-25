; Title: Write an X86/64 ALP to accept a string and display its length.

section .data
    m1 db 10,10,"Enter the string: "
    m1len equ $-m1

    m2 db 10,"Length of the string: "
    m2len equ $-m2

section .bss
    string  resb 100
    length  resb 1
    dispbuf resb 2

section .text
    global _start

_start:

    ; Display "Enter the string"
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, m1
    mov rdx, m1len
    syscall

    ; Accept string input
    mov rax, 0          ; sys_read
    mov rdi, 0          ; stdin
    mov rsi, string
    mov rdx, 100
    syscall

    ; RAX contains number of bytes read
    dec rax             ; remove newline
    mov [length], al

    ; Display "Length of the string"
    mov rax, 1
    mov rdi, 1
    mov rsi, m2
    mov rdx, m2len
    syscall

    ; Convert length to 2-digit hexadecimal
    mov bl, [length]
    mov rcx, 2
    mov rdi, dispbuf

convert:
    rol bl, 4
    mov al, bl
    and al, 0Fh
    cmp al, 9
    jbe digit
    add al, 7

digit:
    add al, 30h
    mov [rdi], al
    inc rdi
    dec rcx
    jnz convert

   
