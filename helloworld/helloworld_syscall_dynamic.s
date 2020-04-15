    .text
    .section  .rodata
.hello:
    .string   "Hello World!\n"

    .section  .text
    .globl    main
main:
    movq    $1, %rax            # syscall 1
    movq    $1, %rdi            # stdout
    leaq    .hello(%rip), %rsi  # string

    # calculate length
    movq    $0, %rdx            # counter = 0
.top:
    movb    (%rsi,%rdx), %cl    # start of hello into rcx
    cmpb    $0, %cl             # if hello[counter] == \0
    je      .write              # jump to write
    addq    $1, %rdx            # else counter++
    jmp     .top                # loop

.write:
    syscall

    movq    $60, %rax           # exit syscall
    movq    $1, %rdi            # return code
    syscall
