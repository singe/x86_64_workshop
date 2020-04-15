	.text
	.section	.rodata
.LC0:
	.string	"Hello World!"
.LC1:
	.string	"%s %d\n"
	.text
	.globl	main
main:
	subq	$40, %rsp
	leaq	.LC0(%rip), %rax
	movq	%rax, 16(%rsp)
	leaq	.LC1(%rip), %rax
	movq	%rax, 24(%rsp)
	movl	$42, 12(%rsp)
	movl	12(%rsp), %edx
	movq	16(%rsp), %rcx
	movq	24(%rsp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	addq	$40, %rsp
	ret
