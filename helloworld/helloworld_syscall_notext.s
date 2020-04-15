	.section	.text
	.globl	main
main:
    movq    $1, %rax            # syscall 1
    movq    $1, %rdi            # stdout
    movq    $0x0A216948, -20(%rsp) # H 0x48, i 0x69, ! 0x21, \n 0x0a
    leaq    -20(%rsp), %rsi     # load address of string
    movq    $4, %rdx            # length
    syscall

    movq    $60, %rax           # exit syscall
    movq    $1, %rdi            # return code
    syscall
