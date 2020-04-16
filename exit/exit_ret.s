    .text             # start code section
    .globl  main      # make main visible externally
main:                 # name this label main
    mov     $0, %rax  # move 0 into rax for return code
    ret               # return
