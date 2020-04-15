    .text
    .globl  foo
foo:
    movl    $1, %eax    # set return value
    ret                 # exit function

    .globl  main
main:
    call    foo         # call foo()
    movl    %eax, %edi  # copy foo's return into return code

    movq    $60, %rax   # exit syscall
    syscall
