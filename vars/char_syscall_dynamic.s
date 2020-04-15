    .text
    .globl    main
main:
    subq    $24, %rsp     # allocate space above stack pointer for vars

    xorl    %eax, %eax    # zero eax
    movw    $97, 1(%rsp)  # a = "a"
    movw    $98, 3(%rsp)  # b = "b"
    movw    $99, 4(%rsp)  # c = "c"

    movzbl  1(%rsp), %eax # (byte) a into (long) eax - zero the rest
    movb    %al, 6(%rsp)  # both[0] = a
    movzbl  3(%rsp), %eax # b into eax - zero the rest
    movb    %al, 7(%rsp)  # both[1] = b
    movzbl  4(%rsp), %eax # c into eax - zero the rest
    movb    %al, 8(%rsp)  # both[2] = c
    movb    $0, 9(%rsp)   # both[3] = "\0"

    movq    $1, %rax      # write syscall
    movq    %rax, %rdi    # stdout is 1
    leaq    6(%rsp), %rsi # start of both[] into rsi

    # calculate length
    movq    $0, %rdx      # counter = 0
.top:
    movb    6(%rsp,%rdx), %cl # both[i] into rcx
    cmpb    $0, %cl       # if both[counter] == \0
    je      .write        # jump to write
    addq    $1, %rdx      # else counter++
    jmp     .top

.write:
    syscall

    addq    $24, %rsp     # deallocate stack vars

    movq    $0, %rdi      # ret code
    movq    $60, %rax     # exit syscall
    syscall
