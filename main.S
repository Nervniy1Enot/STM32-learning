	.file	"main.cpp"
	.text
.Ltext0:
	.file 0 "E:/proj/test" "main.cpp"
	.globl	_Z15UART_sendstringPc
	.def	_Z15UART_sendstringPc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z15UART_sendstringPc
_Z15UART_sendstringPc:
.LFB31:
	.file 1 "main.cpp"
	.loc 1 6 36
	pushq	%rbp
	.seh_pushreg	%rbp
.LCFI0:
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
.LCFI1:
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 7 13
	movb	$0, -1(%rbp)
	.loc 1 8 5
	jmp	.L2
.L4:
	.loc 1 9 9
	nop
.L3:
	.loc 1 9 26 discriminator 1
	movl	$1073821696, %eax
	movzwl	(%rax), %eax
	.loc 1 9 29 discriminator 1
	movzwl	%ax, %eax
	andl	$128, %eax
	.loc 1 9 16 discriminator 1
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	jne	.L3
	.loc 1 10 22
	movq	16(%rbp), %rcx
	.loc 1 10 27
	movzbl	-1(%rbp), %eax
	leal	1(%rax), %edx
	movb	%dl, -1(%rbp)
	movzbl	%al, %eax
	.loc 1 10 29
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	.loc 1 10 17
	movl	$1073821696, %edx
	.loc 1 10 29
	cbtw
	.loc 1 10 20
	movw	%ax, 4(%rdx)
.L2:
	.loc 1 8 16
	movzbl	-1(%rbp), %edx
	.loc 1 8 17
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 8 19
	testb	%al, %al
	jne	.L4
	.loc 1 13 1
	nop
	nop
	addq	$16, %rsp
	popq	%rbp
.LCFI2:
	ret
.LFE31:
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB32:
	.loc 1 15 12
	pushq	%rbp
	.seh_pushreg	%rbp
.LCFI3:
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
.LCFI4:
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	.loc 1 15 12
	call	__main
	.loc 1 18 10
	movl	$1073876992, %eax
	movl	24(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 18 18
	orb	$64, %ah
	movl	%eax, 24(%rdx)
	.loc 1 19 10
	movl	$1073876992, %eax
	movl	24(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 19 18
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	.loc 1 22 12
	movl	$1073809408, %eax
	movl	4(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 22 16
	andb	$63, %al
	movl	%eax, 4(%rdx)
	.loc 1 23 12
	movl	$1073809408, %eax
	movl	4(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 23 16
	orb	$-80, %al
	movl	%eax, 4(%rdx)
	.loc 1 25 12
	movl	$1073809408, %eax
	movl	4(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 25 16
	andb	$-13, %ah
	movl	%eax, 4(%rdx)
	.loc 1 26 12
	movl	$1073809408, %eax
	movl	4(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 26 16
	orb	$8, %ah
	movl	%eax, 4(%rdx)
	.loc 1 27 12
	movl	$1073809408, %eax
	movl	16(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 27 17
	orb	$4, %ah
	movl	%eax, 16(%rdx)
	.loc 1 30 13
	movl	$1073821696, %eax
	.loc 1 30 17
	movw	$2500, 8(%rax)
	.loc 1 31 13
	movl	$1073821696, %eax
	.loc 1 31 17
	movw	$8204, 12(%rax)
	.loc 1 34 10
	movl	$1073876992, %eax
	movl	24(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 34 18
	orl	$16, %eax
	movl	%eax, 24(%rdx)
	.loc 1 35 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 35 16
	orl	$3, %eax
	movl	%eax, 4(%rdx)
	.loc 1 36 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 36 16
	andl	$-13, %eax
	movl	%eax, 4(%rdx)
	.loc 1 37 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 37 16
	orl	$8, %eax
	movl	%eax, 4(%rdx)
	.loc 1 39 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 39 16
	orl	$48, %eax
	movl	%eax, 4(%rdx)
	.loc 1 40 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 40 16
	andb	$63, %al
	movl	%eax, 4(%rdx)
	.loc 1 41 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 41 16
	orb	$-128, %al
	movl	%eax, 4(%rdx)
	.loc 1 44 10
	movl	$1073876992, %eax
	movl	28(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 44 18
	orl	$2, %eax
	movl	%eax, 28(%rdx)
	.loc 1 45 10
	movl	$1073876992, %eax
	movl	24(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 45 18
	orl	$1, %eax
	movl	%eax, 24(%rdx)
	.loc 1 46 11
	movl	$1073807360, %eax
	movl	4(%rax), %eax
	movl	$1073807360, %edx
	.loc 1 46 16
	orb	$12, %ah
	movl	%eax, 4(%rdx)
	.loc 1 48 11
	movl	$1073742848, %eax
	.loc 1 48 15
	movw	$240, 40(%rax)
	.loc 1 49 11
	movl	$1073742848, %eax
	.loc 1 49 15
	movw	$100, 44(%rax)
	.loc 1 52 11
	movl	$1073742848, %eax
	movzwl	28(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 52 17
	orl	$96, %eax
	movw	%ax, 28(%rdx)
	.loc 1 53 11
	movl	$1073742848, %eax
	movzwl	28(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 53 17
	orb	$96, %ah
	movw	%ax, 28(%rdx)
	.loc 1 56 11
	movl	$1073742848, %eax
	movzwl	32(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 56 16
	orb	$1, %ah
	movw	%ax, 32(%rdx)
	.loc 1 57 11
	movl	$1073742848, %eax
	movzwl	32(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 57 16
	orb	$16, %ah
	movw	%ax, 32(%rdx)
	.loc 1 60 11
	movl	$1073742848, %eax
	movzwl	(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 60 15
	orb	$-128, %al
	movw	%ax, (%rdx)
	.loc 1 63 11
	movl	$1073742848, %eax
	movzwl	(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 63 15
	orl	$1, %eax
	movw	%ax, (%rdx)
	.loc 1 67 13
	movb	$0, -1(%rbp)
.L19:
.LBB2:
.LBB3:
	.loc 1 71 21
	movl	$1073821696, %eax
	movzwl	(%rax), %eax
	.loc 1 71 24
	movzwl	%ax, %eax
	andl	$32, %eax
	testl	%eax, %eax
	setne	%al
	.loc 1 71 9
	testb	%al, %al
	je	.L19
.LBB4:
	.loc 1 72 42
	movl	$1073821696, %eax
	movzwl	4(%rax), %eax
	movb	%al, -2(%rbp)
	.loc 1 74 13
	nop
.L7:
	.loc 1 74 30 discriminator 1
	movl	$1073821696, %eax
	movzwl	(%rax), %eax
	.loc 1 74 33 discriminator 1
	movzwl	%ax, %eax
	andl	$128, %eax
	.loc 1 74 20 discriminator 1
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	jne	.L7
	.loc 1 75 21
	movl	$1073821696, %edx
	.loc 1 75 26
	movsbw	-2(%rbp), %ax
	.loc 1 75 24
	movw	%ax, 4(%rdx)
.LBB5:
	.loc 1 77 13
	cmpb	$13, -2(%rbp)
	je	.L8
	.loc 1 77 39 discriminator 1
	cmpb	$10, -2(%rbp)
	jne	.L9
.L8:
.LBB6:
	.loc 1 78 24
	movzbl	-1(%rbp), %eax
	.loc 1 78 38
	cltq
	movb	$0, -20(%rbp,%rax)
.LBB7:
	.loc 1 80 17
	cmpb	$3, -1(%rbp)
	jne	.L10
	.loc 1 80 50 discriminator 1
	movzbl	-20(%rbp), %eax
	.loc 1 80 39 discriminator 1
	cmpb	$98, %al
	jne	.L10
	.loc 1 80 70 discriminator 2
	movzbl	-19(%rbp), %eax
	.loc 1 80 59 discriminator 2
	cmpb	$47, %al
	jle	.L10
	.loc 1 80 90 discriminator 3
	movzbl	-19(%rbp), %eax
	.loc 1 80 79 discriminator 3
	cmpb	$57, %al
	jg	.L10
	.loc 1 80 110 discriminator 4
	movzbl	-18(%rbp), %eax
	.loc 1 80 99 discriminator 4
	cmpb	$47, %al
	jle	.L10
	.loc 1 80 130 discriminator 5
	movzbl	-18(%rbp), %eax
	.loc 1 80 119 discriminator 5
	cmpb	$57, %al
	jg	.L10
.LBB8:
	.loc 1 81 52
	movzbl	-19(%rbp), %eax
	.loc 1 81 54
	subl	$48, %eax
	.loc 1 81 61
	leal	0(,%rax,8), %edx
	.loc 1 81 79
	movzbl	-19(%rbp), %eax
	.loc 1 81 81
	subl	$48, %eax
	.loc 1 81 88
	addl	%eax, %eax
	.loc 1 81 67
	addl	%eax, %edx
	.loc 1 81 105
	movzbl	-18(%rbp), %eax
	.loc 1 81 94
	addl	%edx, %eax
	.loc 1 81 29
	subl	$48, %eax
	movb	%al, -3(%rbp)
	.loc 1 83 27
	movl	$1073742848, %edx
	.loc 1 83 34
	movzbl	-3(%rbp), %eax
	.loc 1 83 32
	movw	%ax, 60(%rdx)
	.loc 1 85 26
	movabsq	$8242185887955552781, %rax
	movabsq	$8319104461757245289, %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movabsq	$2334386829830549280, %rax
	movabsq	$4919421869996993634, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movabsq	$2338605651652208928, %rax
	movl	$2125684, %edx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -36(%rbp)
	movq	$0, -28(%rbp)
	.loc 1 86 43
	movzbl	-19(%rbp), %eax
	.loc 1 86 33
	movb	%al, -37(%rbp)
	.loc 1 87 43
	movzbl	-18(%rbp), %eax
	.loc 1 87 33
	movb	%al, -36(%rbp)
	.loc 1 88 33
	movb	$32, -35(%rbp)
	.loc 1 89 33
	movb	$37, -34(%rbp)
	.loc 1 90 33
	movb	$13, -33(%rbp)
	.loc 1 91 33
	movb	$10, -32(%rbp)
	.loc 1 92 33
	movb	$0, -31(%rbp)
	.loc 1 93 36
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_Z15UART_sendstringPc
.LBE8:
	.loc 1 95 17
	jmp	.L11
.L10:
.LBB9:
.LBB10:
	.loc 1 97 22
	cmpb	$3, -1(%rbp)
	jne	.L12
	.loc 1 97 55 discriminator 1
	movzbl	-20(%rbp), %eax
	.loc 1 97 44 discriminator 1
	cmpb	$103, %al
	jne	.L12
	.loc 1 97 75 discriminator 2
	movzbl	-19(%rbp), %eax
	.loc 1 97 64 discriminator 2
	cmpb	$47, %al
	jle	.L12
	.loc 1 97 95 discriminator 3
	movzbl	-19(%rbp), %eax
	.loc 1 97 84 discriminator 3
	cmpb	$57, %al
	jg	.L12
	.loc 1 97 115 discriminator 4
	movzbl	-18(%rbp), %eax
	.loc 1 97 104 discriminator 4
	cmpb	$47, %al
	jle	.L12
	.loc 1 97 135 discriminator 5
	movzbl	-18(%rbp), %eax
	.loc 1 97 124 discriminator 5
	cmpb	$57, %al
	jg	.L12
.LBB11:
	.loc 1 98 52
	movzbl	-19(%rbp), %eax
	.loc 1 98 54
	subl	$48, %eax
	.loc 1 98 61
	leal	0(,%rax,8), %edx
	.loc 1 98 79
	movzbl	-19(%rbp), %eax
	.loc 1 98 81
	subl	$48, %eax
	.loc 1 98 88
	addl	%eax, %eax
	.loc 1 98 67
	addl	%eax, %edx
	.loc 1 98 105
	movzbl	-18(%rbp), %eax
	.loc 1 98 94
	addl	%edx, %eax
	.loc 1 98 29
	subl	$48, %eax
	movb	%al, -4(%rbp)
	.loc 1 100 27
	movl	$1073742848, %edx
	.loc 1 100 34
	movzbl	-4(%rbp), %eax
	.loc 1 100 32
	movw	%ax, 64(%rdx)
	.loc 1 102 26
	movabsq	$8242185887955552781, %rax
	movabsq	$8319104461757245289, %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movabsq	$2334386829830549280, %rax
	movabsq	$4993401745366676071, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movabsq	$8387236464259833924, %rax
	movl	$544175136, %edx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -36(%rbp)
	movq	$0, -28(%rbp)
	.loc 1 103 43
	movzbl	-19(%rbp), %eax
	.loc 1 103 33
	movb	%al, -36(%rbp)
	.loc 1 104 43
	movzbl	-18(%rbp), %eax
	.loc 1 104 33
	movb	%al, -35(%rbp)
	.loc 1 105 33
	movb	$32, -34(%rbp)
	.loc 1 106 33
	movb	$37, -33(%rbp)
	.loc 1 107 33
	movb	$13, -32(%rbp)
	.loc 1 108 33
	movb	$10, -31(%rbp)
	.loc 1 109 33
	movb	$0, -30(%rbp)
	.loc 1 110 36
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_Z15UART_sendstringPc
.LBE11:
	.loc 1 111 17
	jmp	.L11
.L12:
.LBB12:
.LBB13:
	.loc 1 113 22
	cmpb	$4, -1(%rbp)
	jne	.L13
	.loc 1 113 57 discriminator 1
	movzbl	-20(%rbp), %eax
	.loc 1 113 44 discriminator 1
	cmpb	$103, %al
	jne	.L14
	.loc 1 113 77 discriminator 2
	movzbl	-19(%rbp), %eax
	.loc 1 113 66 discriminator 2
	cmpb	$98, %al
	je	.L15
.L14:
	.loc 1 113 99 discriminator 4
	movzbl	-20(%rbp), %eax
	.loc 1 113 87 discriminator 4
	cmpb	$98, %al
	jne	.L13
	.loc 1 113 119 discriminator 5
	movzbl	-19(%rbp), %eax
	.loc 1 113 108 discriminator 5
	cmpb	$103, %al
	jne	.L13
.L15:
	.loc 1 114 38
	movzbl	-18(%rbp), %eax
	.loc 1 114 27
	cmpb	$47, %al
	jle	.L13
	.loc 1 114 58 discriminator 1
	movzbl	-18(%rbp), %eax
	.loc 1 114 47 discriminator 1
	cmpb	$57, %al
	jg	.L13
	.loc 1 114 78 discriminator 2
	movzbl	-17(%rbp), %eax
	.loc 1 114 67 discriminator 2
	cmpb	$47, %al
	jle	.L13
	.loc 1 114 98 discriminator 3
	movzbl	-17(%rbp), %eax
	.loc 1 114 87 discriminator 3
	cmpb	$57, %al
	jg	.L13
.LBB14:
	.loc 1 115 52
	movzbl	-18(%rbp), %eax
	.loc 1 115 54
	subl	$48, %eax
	.loc 1 115 61
	leal	0(,%rax,8), %edx
	.loc 1 115 79
	movzbl	-18(%rbp), %eax
	.loc 1 115 81
	subl	$48, %eax
	.loc 1 115 88
	addl	%eax, %eax
	.loc 1 115 67
	addl	%eax, %edx
	.loc 1 115 105
	movzbl	-17(%rbp), %eax
	.loc 1 115 94
	addl	%edx, %eax
	.loc 1 115 29
	subl	$48, %eax
	movb	%al, -5(%rbp)
	.loc 1 117 27
	movl	$1073742848, %edx
	.loc 1 117 34
	movzbl	-5(%rbp), %eax
	.loc 1 117 32
	movw	%ax, 60(%rdx)
	.loc 1 118 27
	movl	$1073742848, %edx
	.loc 1 118 34
	movzbl	-5(%rbp), %eax
	.loc 1 118 32
	movw	%ax, 64(%rdx)
	.loc 1 120 26
	movabsq	$8242185887955552781, %rax
	movabsq	$8319104461757245289, %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movabsq	$7526763344484003616, %rax
	movabsq	$8316213866355051552, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movabsq	$2337214414369157920, %rax
	movl	$0, %edx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	$0, -36(%rbp)
	movq	$0, -28(%rbp)
	.loc 1 121 43
	movzbl	-18(%rbp), %eax
	.loc 1 121 33
	movb	%al, -40(%rbp)
	.loc 1 122 43
	movzbl	-17(%rbp), %eax
	.loc 1 122 33
	movb	%al, -39(%rbp)
	.loc 1 123 33
	movb	$32, -38(%rbp)
	.loc 1 124 33
	movb	$37, -37(%rbp)
	.loc 1 125 33
	movb	$13, -36(%rbp)
	.loc 1 126 33
	movb	$10, -35(%rbp)
	.loc 1 127 33
	movb	$0, -34(%rbp)
	.loc 1 128 36
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_Z15UART_sendstringPc
.LBE14:
	.loc 1 129 17
	jmp	.L11
.L13:
.LBB15:
	.loc 1 131 26
	movabsq	$7596553832751499789, %rax
	movabsq	$7953758733700636772, %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movq	$100, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -36(%rbp)
	movq	$0, -28(%rbp)
	.loc 1 132 43
	movzbl	-20(%rbp), %eax
	.loc 1 132 33
	movb	%al, -62(%rbp)
	.loc 1 133 43
	movzbl	-19(%rbp), %eax
	.loc 1 133 33
	movb	%al, -61(%rbp)
	.loc 1 134 43
	movzbl	-18(%rbp), %eax
	.loc 1 134 33
	movb	%al, -60(%rbp)
	.loc 1 135 43
	movzbl	-17(%rbp), %eax
	.loc 1 135 33
	movb	%al, -59(%rbp)
	.loc 1 136 33
	movb	$13, -58(%rbp)
	.loc 1 137 33
	movb	$10, -57(%rbp)
	.loc 1 138 33
	movb	$0, -56(%rbp)
	.loc 1 139 36
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_Z15UART_sendstringPc
.L11:
.LBE15:
.LBE13:
.LBE12:
.LBE10:
.LBE9:
.LBE7:
	.loc 1 142 30
	movb	$0, -1(%rbp)
	.loc 1 144 24
	movzbl	-1(%rbp), %eax
	.loc 1 144 38
	cltq
	movb	$32, -20(%rbp,%rax)
.LBE6:
	.loc 1 145 13
	jmp	.L6
.L9:
	.loc 1 146 18
	cmpb	$8, -2(%rbp)
	jne	.L17
	.loc 1 147 17
	cmpb	$0, -1(%rbp)
	je	.L19
	.loc 1 148 33
	movzbl	-1(%rbp), %eax
	subl	$1, %eax
	movb	%al, -1(%rbp)
	jmp	.L19
.L17:
	.loc 1 153 17
	cmpb	$3, -1(%rbp)
	ja	.L18
	.loc 1 154 44
	movzbl	-2(%rbp), %edx
	.loc 1 154 40
	movzbl	-1(%rbp), %eax
	leal	1(%rax), %ecx
	movb	%cl, -1(%rbp)
	movzbl	%al, %eax
	.loc 1 154 44
	cltq
	movb	%dl, -20(%rbp,%rax)
	jmp	.L19
.L18:
	.loc 1 157 34
	movb	$0, -1(%rbp)
.L6:
.LBE5:
.LBE4:
.LBE3:
.LBE2:
	.loc 1 161 5 discriminator 2
	jmp	.L19
.LFE32:
	.seh_endproc
	.section	.debug_frame,"dr"
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x3
	.ascii "\0"
	.uleb128 0x1
	.sleb128 -8
	.uleb128 0x10
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.byte	0x90
	.uleb128 0x1
	.align 8
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.secrel32	.Lframe0
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.byte	0x4
	.long	.LCFI0-.LFB31
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0xc6
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 8
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.secrel32	.Lframe0
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.byte	0x4
	.long	.LCFI3-.LFB32
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE2:
	.text
.Letext0:
	.file 2 "E:/Program Files/msys64/mingw64/include/stdint.h"
	.file 3 "drivers/CMSIS/DeviceSupport/ST/STM32F10x/stm32f10x.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x883
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0xe
	.ascii "GNU C++17 12.2.0 -mtune=generic -march=nocona -g\0"
	.byte	0x21
	.secrel32	.LASF0
	.secrel32	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0xf
	.byte	0x8
	.long	0x5b
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.ascii "wchar_t\0"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.ascii "long double\0"
	.uleb128 0x10
	.ascii "decltype(nullptr)\0"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x8
	.ascii "uint8_t\0"
	.byte	0x24
	.byte	0x19
	.long	0xed
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x8
	.ascii "uint16_t\0"
	.byte	0x26
	.byte	0x19
	.long	0x8e
	.uleb128 0x9
	.long	0x14b
	.uleb128 0x8
	.ascii "uint32_t\0"
	.byte	0x28
	.byte	0x14
	.long	0xc8
	.uleb128 0x9
	.long	0x160
	.uleb128 0xa
	.long	0x170
	.long	0x185
	.uleb128 0xb
	.long	0x63
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.long	0x175
	.uleb128 0x5
	.byte	0x1c
	.word	0x3ed
	.ascii "12GPIO_TypeDef\0"
	.long	0x1ff
	.uleb128 0x1
	.ascii "CRL\0"
	.word	0x3ee
	.byte	0x11
	.long	0x170
	.byte	0
	.uleb128 0x1
	.ascii "CRH\0"
	.word	0x3ef
	.byte	0x11
	.long	0x170
	.byte	0x4
	.uleb128 0x1
	.ascii "IDR\0"
	.word	0x3f0
	.byte	0x11
	.long	0x170
	.byte	0x8
	.uleb128 0x1
	.ascii "ODR\0"
	.word	0x3f1
	.byte	0x11
	.long	0x170
	.byte	0xc
	.uleb128 0x1
	.ascii "BSRR\0"
	.word	0x3f2
	.byte	0x11
	.long	0x170
	.byte	0x10
	.uleb128 0x1
	.ascii "BRR\0"
	.word	0x3f3
	.byte	0x11
	.long	0x170
	.byte	0x14
	.uleb128 0x1
	.ascii "LCKR\0"
	.word	0x3f4
	.byte	0x11
	.long	0x170
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.ascii "GPIO_TypeDef\0"
	.word	0x3f5
	.long	0x18a
	.uleb128 0x5
	.byte	0x20
	.word	0x3fc
	.ascii "12AFIO_TypeDef\0"
	.long	0x273
	.uleb128 0x1
	.ascii "EVCR\0"
	.word	0x3fd
	.byte	0x11
	.long	0x170
	.byte	0
	.uleb128 0x1
	.ascii "MAPR\0"
	.word	0x3fe
	.byte	0x11
	.long	0x170
	.byte	0x4
	.uleb128 0x1
	.ascii "EXTICR\0"
	.word	0x3ff
	.byte	0x11
	.long	0x185
	.byte	0x8
	.uleb128 0x2
	.secrel32	.LASF2
	.word	0x400
	.byte	0xc
	.long	0x160
	.byte	0x18
	.uleb128 0x1
	.ascii "MAPR2\0"
	.word	0x401
	.byte	0x11
	.long	0x170
	.byte	0x1c
	.byte	0
	.uleb128 0x6
	.ascii "AFIO_TypeDef\0"
	.word	0x402
	.long	0x213
	.uleb128 0x5
	.byte	0x30
	.word	0x438
	.ascii "11RCC_TypeDef\0"
	.long	0x352
	.uleb128 0x1
	.ascii "CR\0"
	.word	0x439
	.byte	0x11
	.long	0x170
	.byte	0
	.uleb128 0x1
	.ascii "CFGR\0"
	.word	0x43a
	.byte	0x11
	.long	0x170
	.byte	0x4
	.uleb128 0x1
	.ascii "CIR\0"
	.word	0x43b
	.byte	0x11
	.long	0x170
	.byte	0x8
	.uleb128 0x1
	.ascii "APB2RSTR\0"
	.word	0x43c
	.byte	0x11
	.long	0x170
	.byte	0xc
	.uleb128 0x1
	.ascii "APB1RSTR\0"
	.word	0x43d
	.byte	0x11
	.long	0x170
	.byte	0x10
	.uleb128 0x1
	.ascii "AHBENR\0"
	.word	0x43e
	.byte	0x11
	.long	0x170
	.byte	0x14
	.uleb128 0x1
	.ascii "APB2ENR\0"
	.word	0x43f
	.byte	0x11
	.long	0x170
	.byte	0x18
	.uleb128 0x1
	.ascii "APB1ENR\0"
	.word	0x440
	.byte	0x11
	.long	0x170
	.byte	0x1c
	.uleb128 0x1
	.ascii "BDCR\0"
	.word	0x441
	.byte	0x11
	.long	0x170
	.byte	0x20
	.uleb128 0x1
	.ascii "CSR\0"
	.word	0x442
	.byte	0x11
	.long	0x170
	.byte	0x24
	.uleb128 0x2
	.secrel32	.LASF2
	.word	0x44a
	.byte	0xc
	.long	0x160
	.byte	0x28
	.uleb128 0x1
	.ascii "CFGR2\0"
	.word	0x44b
	.byte	0x11
	.long	0x170
	.byte	0x2c
	.byte	0
	.uleb128 0x6
	.ascii "RCC_TypeDef\0"
	.word	0x44d
	.long	0x287
	.uleb128 0x5
	.byte	0x50
	.word	0x4a6
	.ascii "11TIM_TypeDef\0"
	.long	0x5e8
	.uleb128 0x1
	.ascii "CR1\0"
	.word	0x4a7
	.byte	0x11
	.long	0x15b
	.byte	0
	.uleb128 0x2
	.secrel32	.LASF2
	.word	0x4a8
	.byte	0xd
	.long	0x14b
	.byte	0x2
	.uleb128 0x1
	.ascii "CR2\0"
	.word	0x4a9
	.byte	0x11
	.long	0x15b
	.byte	0x4
	.uleb128 0x2
	.secrel32	.LASF3
	.word	0x4aa
	.byte	0xd
	.long	0x14b
	.byte	0x6
	.uleb128 0x1
	.ascii "SMCR\0"
	.word	0x4ab
	.byte	0x11
	.long	0x15b
	.byte	0x8
	.uleb128 0x2
	.secrel32	.LASF4
	.word	0x4ac
	.byte	0xd
	.long	0x14b
	.byte	0xa
	.uleb128 0x1
	.ascii "DIER\0"
	.word	0x4ad
	.byte	0x11
	.long	0x15b
	.byte	0xc
	.uleb128 0x2
	.secrel32	.LASF5
	.word	0x4ae
	.byte	0xd
	.long	0x14b
	.byte	0xe
	.uleb128 0x1
	.ascii "SR\0"
	.word	0x4af
	.byte	0x11
	.long	0x15b
	.byte	0x10
	.uleb128 0x2
	.secrel32	.LASF6
	.word	0x4b0
	.byte	0xd
	.long	0x14b
	.byte	0x12
	.uleb128 0x1
	.ascii "EGR\0"
	.word	0x4b1
	.byte	0x11
	.long	0x15b
	.byte	0x14
	.uleb128 0x2
	.secrel32	.LASF7
	.word	0x4b2
	.byte	0xd
	.long	0x14b
	.byte	0x16
	.uleb128 0x1
	.ascii "CCMR1\0"
	.word	0x4b3
	.byte	0x11
	.long	0x15b
	.byte	0x18
	.uleb128 0x2
	.secrel32	.LASF8
	.word	0x4b4
	.byte	0xd
	.long	0x14b
	.byte	0x1a
	.uleb128 0x1
	.ascii "CCMR2\0"
	.word	0x4b5
	.byte	0x11
	.long	0x15b
	.byte	0x1c
	.uleb128 0x1
	.ascii "RESERVED7\0"
	.word	0x4b6
	.byte	0xd
	.long	0x14b
	.byte	0x1e
	.uleb128 0x1
	.ascii "CCER\0"
	.word	0x4b7
	.byte	0x11
	.long	0x15b
	.byte	0x20
	.uleb128 0x1
	.ascii "RESERVED8\0"
	.word	0x4b8
	.byte	0xd
	.long	0x14b
	.byte	0x22
	.uleb128 0x1
	.ascii "CNT\0"
	.word	0x4b9
	.byte	0x11
	.long	0x15b
	.byte	0x24
	.uleb128 0x1
	.ascii "RESERVED9\0"
	.word	0x4ba
	.byte	0xd
	.long	0x14b
	.byte	0x26
	.uleb128 0x1
	.ascii "PSC\0"
	.word	0x4bb
	.byte	0x11
	.long	0x15b
	.byte	0x28
	.uleb128 0x1
	.ascii "RESERVED10\0"
	.word	0x4bc
	.byte	0xd
	.long	0x14b
	.byte	0x2a
	.uleb128 0x1
	.ascii "ARR\0"
	.word	0x4bd
	.byte	0x11
	.long	0x15b
	.byte	0x2c
	.uleb128 0x1
	.ascii "RESERVED11\0"
	.word	0x4be
	.byte	0xd
	.long	0x14b
	.byte	0x2e
	.uleb128 0x1
	.ascii "RCR\0"
	.word	0x4bf
	.byte	0x11
	.long	0x15b
	.byte	0x30
	.uleb128 0x1
	.ascii "RESERVED12\0"
	.word	0x4c0
	.byte	0xd
	.long	0x14b
	.byte	0x32
	.uleb128 0x1
	.ascii "CCR1\0"
	.word	0x4c1
	.byte	0x11
	.long	0x15b
	.byte	0x34
	.uleb128 0x1
	.ascii "RESERVED13\0"
	.word	0x4c2
	.byte	0xd
	.long	0x14b
	.byte	0x36
	.uleb128 0x1
	.ascii "CCR2\0"
	.word	0x4c3
	.byte	0x11
	.long	0x15b
	.byte	0x38
	.uleb128 0x1
	.ascii "RESERVED14\0"
	.word	0x4c4
	.byte	0xd
	.long	0x14b
	.byte	0x3a
	.uleb128 0x1
	.ascii "CCR3\0"
	.word	0x4c5
	.byte	0x11
	.long	0x15b
	.byte	0x3c
	.uleb128 0x1
	.ascii "RESERVED15\0"
	.word	0x4c6
	.byte	0xd
	.long	0x14b
	.byte	0x3e
	.uleb128 0x1
	.ascii "CCR4\0"
	.word	0x4c7
	.byte	0x11
	.long	0x15b
	.byte	0x40
	.uleb128 0x1
	.ascii "RESERVED16\0"
	.word	0x4c8
	.byte	0xd
	.long	0x14b
	.byte	0x42
	.uleb128 0x1
	.ascii "BDTR\0"
	.word	0x4c9
	.byte	0x11
	.long	0x15b
	.byte	0x44
	.uleb128 0x1
	.ascii "RESERVED17\0"
	.word	0x4ca
	.byte	0xd
	.long	0x14b
	.byte	0x46
	.uleb128 0x1
	.ascii "DCR\0"
	.word	0x4cb
	.byte	0x11
	.long	0x15b
	.byte	0x48
	.uleb128 0x1
	.ascii "RESERVED18\0"
	.word	0x4cc
	.byte	0xd
	.long	0x14b
	.byte	0x4a
	.uleb128 0x1
	.ascii "DMAR\0"
	.word	0x4cd
	.byte	0x11
	.long	0x15b
	.byte	0x4c
	.uleb128 0x1
	.ascii "RESERVED19\0"
	.word	0x4ce
	.byte	0xd
	.long	0x14b
	.byte	0x4e
	.byte	0
	.uleb128 0x6
	.ascii "TIM_TypeDef\0"
	.word	0x4cf
	.long	0x365
	.uleb128 0x5
	.byte	0x1c
	.word	0x4d6
	.ascii "13USART_TypeDef\0"
	.long	0x6c9
	.uleb128 0x1
	.ascii "SR\0"
	.word	0x4d7
	.byte	0x11
	.long	0x15b
	.byte	0
	.uleb128 0x2
	.secrel32	.LASF2
	.word	0x4d8
	.byte	0xd
	.long	0x14b
	.byte	0x2
	.uleb128 0x1
	.ascii "DR\0"
	.word	0x4d9
	.byte	0x11
	.long	0x15b
	.byte	0x4
	.uleb128 0x2
	.secrel32	.LASF3
	.word	0x4da
	.byte	0xd
	.long	0x14b
	.byte	0x6
	.uleb128 0x1
	.ascii "BRR\0"
	.word	0x4db
	.byte	0x11
	.long	0x15b
	.byte	0x8
	.uleb128 0x2
	.secrel32	.LASF4
	.word	0x4dc
	.byte	0xd
	.long	0x14b
	.byte	0xa
	.uleb128 0x1
	.ascii "CR1\0"
	.word	0x4dd
	.byte	0x11
	.long	0x15b
	.byte	0xc
	.uleb128 0x2
	.secrel32	.LASF5
	.word	0x4de
	.byte	0xd
	.long	0x14b
	.byte	0xe
	.uleb128 0x1
	.ascii "CR2\0"
	.word	0x4df
	.byte	0x11
	.long	0x15b
	.byte	0x10
	.uleb128 0x2
	.secrel32	.LASF6
	.word	0x4e0
	.byte	0xd
	.long	0x14b
	.byte	0x12
	.uleb128 0x1
	.ascii "CR3\0"
	.word	0x4e1
	.byte	0x11
	.long	0x15b
	.byte	0x14
	.uleb128 0x2
	.secrel32	.LASF7
	.word	0x4e2
	.byte	0xd
	.long	0x14b
	.byte	0x16
	.uleb128 0x1
	.ascii "GTPR\0"
	.word	0x4e3
	.byte	0x11
	.long	0x15b
	.byte	0x18
	.uleb128 0x2
	.secrel32	.LASF8
	.word	0x4e4
	.byte	0xd
	.long	0x14b
	.byte	0x1a
	.byte	0
	.uleb128 0x6
	.ascii "USART_TypeDef\0"
	.word	0x4e5
	.long	0x5fb
	.uleb128 0x11
	.ascii "main\0"
	.byte	0x1
	.byte	0xf
	.byte	0x5
	.long	0xa4
	.quad	.LFB32
	.quad	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.long	0x80e
	.uleb128 0x7
	.ascii "buffer\0"
	.byte	0x42
	.byte	0xa
	.long	0x80e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x7
	.ascii "buffer_index\0"
	.byte	0x43
	.byte	0xd
	.long	0x12f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0xd
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x7
	.ascii "received_char\0"
	.byte	0x48
	.byte	0x12
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0xc
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.long	0x785
	.uleb128 0x4
	.secrel32	.LASF9
	.byte	0x51
	.byte	0x1d
	.long	0x12f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0x4
	.secrel32	.LASF10
	.byte	0x55
	.byte	0x1a
	.long	0x81e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0xc
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.long	0x7b8
	.uleb128 0x4
	.secrel32	.LASF9
	.byte	0x62
	.byte	0x1d
	.long	0x12f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.secrel32	.LASF10
	.byte	0x66
	.byte	0x1a
	.long	0x81e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0xc
	.quad	.LBB14
	.quad	.LBE14-.LBB14
	.long	0x7eb
	.uleb128 0x4
	.secrel32	.LASF9
	.byte	0x73
	.byte	0x1d
	.long	0x12f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x4
	.secrel32	.LASF10
	.byte	0x78
	.byte	0x1a
	.long	0x81e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0xd
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x4
	.secrel32	.LASF10
	.byte	0x83
	.byte	0x1a
	.long	0x81e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x5b
	.long	0x81e
	.uleb128 0xb
	.long	0x63
	.byte	0xe
	.byte	0
	.uleb128 0xa
	.long	0x5b
	.long	0x82e
	.uleb128 0xb
	.long	0x63
	.byte	0x3b
	.byte	0
	.uleb128 0x12
	.ascii "UART_sendstring\0"
	.byte	0x1
	.byte	0x6
	.byte	0x6
	.ascii "_Z15UART_sendstringPc\0"
	.quad	.LFB31
	.quad	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.ascii "str\0"
	.byte	0x1
	.byte	0x6
	.byte	0x1b
	.long	0xb7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x7
	.ascii "i\0"
	.byte	0x7
	.byte	0xd
	.long	0x12f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x3b
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x2c
	.word	0x2
	.secrel32	.Ldebug_info0
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"dr"
.Ldebug_line0:
	.section	.debug_str,"dr"
.LASF10:
	.ascii "message\0"
.LASF2:
	.ascii "RESERVED0\0"
.LASF3:
	.ascii "RESERVED1\0"
.LASF4:
	.ascii "RESERVED2\0"
.LASF5:
	.ascii "RESERVED3\0"
.LASF6:
	.ascii "RESERVED4\0"
.LASF7:
	.ascii "RESERVED5\0"
.LASF8:
	.ascii "RESERVED6\0"
.LASF9:
	.ascii "brightness\0"
	.section	.debug_line_str,"dr"
.LASF0:
	.ascii "main.cpp\0"
.LASF1:
	.ascii "E:\\proj\\test\0"
	.ident	"GCC: (Rev10, Built by MSYS2 project) 12.2.0"
