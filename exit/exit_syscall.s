.text
.globl _main
_main:
    movl    $60, %eax
    mov     $1, %dil
    syscall
