    .text
    .globl    main
main:
    subq    $8, %rsp     # allocate space above stack pointer for vars

    xorl    %eax, %eax    # zero eax
    movw    $97, 1(%rsp)  # a = "a"
    movw    $98, 3(%rsp)  # b = "b"

    movzbl  1(%rsp), %eax # (byte) a into (long) eax - zero the rest
    movb    %al, 5(%rsp)  # both[0] = a
    movzbl  3(%rsp), %eax # b into eax - zero the rest
    movb    %al, 6(%rsp)  # both[1] = b
    movb    $0, 7(%rsp)   # both[2] = "\0"

    movq    $1, %rax      # write syscall
    movq    %rax, %rdi    # stdout is 1
    leaq    5(%rsp), %rsi # load the string
    movq    $2, %rdx      # length
    syscall

    addq    $8, %rsp

    movq    $0, %rdi
    movq    $60, %rax      # exit syscall
    syscall
