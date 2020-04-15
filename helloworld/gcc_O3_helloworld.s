	.text
	.section	.rodata
.LC0:
	.string	"Hello World!"
.LC1:
	.string	"%s %d\n"
	.section	.text
	.globl	main
main:
	subq	$8, %rsp
	movl	$42, %edx
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rdi
	call	printf@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	ret
