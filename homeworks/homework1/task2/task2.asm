global _start

section .data
    filename db "./message.txt", 0

    message db "Hello World!", 10
    length equ $ - message
    
section .text

_start:
    mov rax, 2
    mov rdi, filename
    mov rsi, 0o102     ; O_CREAT | O_RDWR
    mov rdx, 0o777
    syscall

    mov rbx, rax

    mov rax, 1
    mov rdi, rbx
    mov rsi, message
    mov rdx, length
    syscall

    mov rax, 3
    mov rdi, rbx
    syscall

    mov rax, 60
    syscall
