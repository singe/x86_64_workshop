    .text
    .globl    main
main:
    subq    $8, %rsp     # allocate space below stack pointer for vars

    xorl    %eax, %eax    # zero eax
    movw    $97, 1(%rsp)  # a = "a"
    movw    $98, 3(%rsp)  # b = "b"

    movzbl  1(%rsp), %eax # a into eax
    movb    %al, 5(%rsp)  # both[0] = a
    movzbl  3(%rsp), %eax # b into eax
    movb    %al, 6(%rsp)  # both[1] = b
    movb    $0, 7(%rsp)   # both[2] = "\0"

    leaq    5(%rsp), %rax
    movq    %rax, %rdi
    call    puts@PLT      # puts(both)

    addq    $8, %rsp      # cleanup stack

    movq    $0, %rdi
    movq    $60, %rax     # exit syscall
    syscall
