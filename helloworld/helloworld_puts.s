	.text
	.section	.rodata
.hello:
	.string	"Hello World!"
	.text
	.globl	main
main:
	leaq	.hello(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	ret
