    .text
    .section  .rodata
.foo:
    .string   "foo"
.bar:
    .string   "bar"
    .text
    .globl    main
main:

    leaq    .foo(%rip), %rax
    movq    %rax, -16(%rsp)     # a = "foo"

    leaq    .bar(%rip), %rax
    movq    %rax, -8(%rsp)      # b = "bar"

    movq    -16(%rsp), %rax     # a into rax
    cmpq    -8(%rsp), %rax      # compare b with a
    jne     .end                # if b != a goto end

    movl    $1, %edi            # ret code 1
    movl    $60, %eax           # exit syscall
    syscall

.end:
    movl    $2, %edi            # ret code 1
    movl    $60, %eax           # exit syscall
    syscall
