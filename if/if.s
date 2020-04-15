    .text
    .globl  main
main:

    movl    $1, -8(%rsp)    # int a = 1
    movl    $2, -4(%rsp)    # int b = 2

    movl    -8(%rsp), %eax  # a into eax
    cmpl    -4(%rsp), %eax  # compare b with a
    jge     .true           # if b >= a goto true

    movl    $1, %edi        # ret code 1
    jmp     .end

.true:
    mov     $2, %edi        # ret code 2

.end:
    movl    $60, %eax       # exit syscall
    syscall
