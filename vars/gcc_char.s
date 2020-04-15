	.file	"gcc_char.c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movw	$97, 11(%rsp)
	movw	$98, 9(%rsp)
	movzbl	11(%rsp), %eax
	movb	%al, 13(%rsp)
	movzbl	9(%rsp), %eax
	movb	%al, 14(%rsp)
	movb	$0, 15(%rsp)
	leaq	13(%rsp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Alpine 9.2.0) 9.2.0"
	.section	.note.GNU-stack,"",@progbits
