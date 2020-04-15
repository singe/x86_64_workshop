    .text
    .section  .rodata
.hello:
    .string   "Hello "
.world:
    .string   "World!\n"

    .section  .text
    .globl    main
main:
    movq    $1, %rax            # syscall 1
    movq    $1, %rdi            # stdout
    leaq    .hello(%rip), %rsi  # string
    movq    $6, %rdx            # length
    syscall

    movb    $1, %al             # 1 byte to lower byte of rax
    movw    $1, %di             # 1 word to lower word of rdi
    movl    $7, %edx            # 1 long to lower half of rdx
    leaq    .world(%rip), %rsi  # 1 quad word (addr) to full rsi
    syscall

    movq    $60, %rax           # exit syscall
    movq    $1, %rdi            # return code
    syscall
