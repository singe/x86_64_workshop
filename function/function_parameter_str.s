	.text
	.globl	foo
foo:
	subq	$24, %rsp         # Allocate stack var space

	movq	%rdi, 8(%rsp)     # Place passed parameter into local var
	movq	8(%rsp), %rdi     # Put local var into first param
	call	puts@PLT          # Call imported puts
	movl	$0, %eax          # Return code 0

	addq	$24, %rsp         # Clean up stack
	ret

	.section	.rodata
.hello:
	.string	"Hello World!\n"

	.text
	.globl	main
main:
	subq	$24, %rsp           # Allocate stack var space

	leaq	.hello(%rip), %rdi  # Put hello into rdi
	movq	%rdi, 8(%rsp)       # Put hello in a local var
	call	foo                 # Call foo()

	addq	$24, %rsp           # Clean up stack

  call exit@PLT             # Call imported exit function
