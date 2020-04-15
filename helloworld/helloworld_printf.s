    .text
    .section   .rodata
.hello:
    .string    "Hello World!\n"
.format:
    .string    "%s"
    .section   .text
    .globl     main
main:
    subq    $8, %rsp

    leaq    .hello(%rip), %rsi
    leaq    .format(%rip), %rdi
    xorl    %eax, %eax
    call    printf@PLT

    movl    %eax, %edi
    addq    $8, %rsp
    call    exit@PLT
