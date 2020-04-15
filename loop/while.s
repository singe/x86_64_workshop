    .text
    .globl    main
main:
    movl    $0, -4(%rsp)    # int i = 0
    jmp     .end
.start:
    movl    -4(%rsp), %eax  # i into rax
    movl    %eax, -8(%rsp)  # rax into count
    addl    $1, -4(%rsp)    # i++
.end:
    cmpl    $4, -4(%rsp)    # compare 4 with i
    jle     .start          # if 4 <= i goto start

    movl    -8(%rsp), %edi  # return count
    movq    $60, %rax       # exit syscall
    syscall
