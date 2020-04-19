    .text
    .globl  foo
foo:
    movl    %edi, -20(%rsp) # copy passed in value to a
    movl    -20(%rsp), %eax # a into eax
    movl    %eax, -4(%rsp)  # a into b
    addl    $1, -4(%rsp)    # b++
    movl    -4(%rsp), %eax  # return b
    ret

    .globl  main
main:
    subq    $24, %rsp       # allocate variable space on stack
    movl    $0, 12(%rsp)    # int a = 0
    movl    12(%rsp), %edi  # pass a to foo
    call    foo             # foo(a) 
    movl    %eax, %edi      # copy foo's return into return code

    addq    $24, %rsp       # deallocate variable space

    movq    $60, %rax       # exit syscall
    syscall
