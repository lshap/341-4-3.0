	.align 4
	.data
strs857:
	.long 0
_oat_string854.str.:
	.ascii "def\0"
_oat_string854:
	.long _oat_string854.str.

_oat_string851.str.:
	.ascii "abc\0"
_oat_string851:
	.long _oat_string851.str.

	.text
.globl _oat_init
_oat_init:
	pushl %ebp
	movl %esp, %ebp
	subl $0, %esp
__fresh304:
	pushl %edx
	pushl %ecx
	pushl %eax
	call _strs857.init
	addl $0, %esp
	popl %eax
	popl %ecx
	popl %edx
	movl %ebp, %esp
	popl %ebp
	ret
.globl _program
_program:
	pushl %ebp
	movl %esp, %ebp
	subl $36, %esp
__fresh303:
	leal -36(%ebp), %eax
	movl %eax, -28(%ebp)
	movl 8(%ebp), %eax
	movl %eax, %ecx
	movl -28(%ebp), %eax
	movl %ecx, (%eax)
	leal -32(%ebp), %eax
	movl %eax, -24(%ebp)
	movl 12(%ebp), %eax
	movl %eax, %ecx
	movl -24(%ebp), %eax
	movl %ecx, (%eax)
	movl strs857, %eax
	movl %eax, -20(%ebp)
	movl -20(%ebp), %eax
	addl $0, %eax
	movl %eax, -16(%ebp)
	movl -16(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -12(%ebp)
	pushl %edx
	pushl %ecx
	pushl %eax
	movl $0, %eax
	pushl %eax
	movl -12(%ebp), %eax
	pushl %eax
	call _oat_array_bounds_check
	addl $8, %esp
	popl %eax
	popl %ecx
	popl %edx
	movl -20(%ebp), %eax
	addl $4, %eax
	addl $0, %eax
	movl %eax, -8(%ebp)
	movl -8(%ebp), %eax
	movl (%eax), %ecx
	movl %ecx, -4(%ebp)
	pushl %edx
	pushl %ecx
	pushl %eax
	movl -4(%ebp), %eax
	pushl %eax
	call _print_string
	addl $4, %esp
	popl %eax
	popl %ecx
	popl %edx
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
.globl _strs857.init
_strs857.init:
	pushl %ebp
	movl %esp, %ebp
	subl $24, %esp
__fresh302:
	pushl %edx
	pushl %ecx
	pushl %eax
	movl $2, %eax
	pushl %eax
	call _oat_alloc_array
	movl %eax, -24(%ebp)
	addl $4, %esp
	popl %eax
	popl %ecx
	popl %edx
	movl -24(%ebp), %eax
	movl %eax, -20(%ebp)
	movl _oat_string851, %eax
	movl %eax, -16(%ebp)
	movl -20(%ebp), %eax
	addl $4, %eax
	addl $0, %eax
	movl %eax, -12(%ebp)
	movl -16(%ebp), %eax
	movl %eax, %ecx
	movl -12(%ebp), %eax
	movl %ecx, (%eax)
	movl _oat_string854, %eax
	movl %eax, -8(%ebp)
	movl -20(%ebp), %eax
	addl $4, %eax
	addl $4, %eax
	movl %eax, -4(%ebp)
	movl -8(%ebp), %eax
	movl %eax, %ecx
	movl -4(%ebp), %eax
	movl %ecx, (%eax)
	movl -20(%ebp), %eax
	movl %eax, strs857
	movl %ebp, %esp
	popl %ebp
	ret
