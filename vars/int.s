    .text
    .globl    main
main:
    movl    $1, -12(%rsp)   # a = 1
    movl    $2, -8(%rsp)    # b = 2

    movl    -12(%rsp), %edx # a into edx
    movl    -8(%rsp), %eax  # b into eax
    addl    %edx, %eax      # a + b

    movl    %eax, -4(%rsp)  # c = a + b

    movl    -4(%rsp), %edi  # c into ret code
    movq    $60, %rax       # exit syscall
    syscall
