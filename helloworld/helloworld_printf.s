    .text
    .section   .rodata
.hello:
    .string    "Hello World!\n"
.format:
    .string    "%s"
    .section   .text
    .globl     main
main:

    leaq    .hello(%rip), %rsi
    leaq    .format(%rip), %rdi
    xorl    %eax, %eax
    call    printf@PLT

    movl    %eax, %edi
    call    exit@PLT
