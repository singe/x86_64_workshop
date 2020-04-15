	.text
	.section	.rodata
.LC0:
	.string	"Hello World!"
.LC1:
	.string	"%s %d\n"

	.text
	.globl	main
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp

	leaq	.LC0(%rip), %rax
	movq	%rax, -16(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, -8(%rbp)
	movl	$42, -20(%rbp)
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT

	movl	$0, %eax
	leave
	ret
