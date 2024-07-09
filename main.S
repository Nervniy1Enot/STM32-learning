	.file	"main.cpp"
	.text
.Ltext0:
	.file 0 "E:/proj/test" "main.cpp"
	.globl	_Z15UART_sendstringPKc
	.def	_Z15UART_sendstringPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z15UART_sendstringPKc
_Z15UART_sendstringPKc:
.LFB45:
	.file 1 "main.cpp"
	.loc 1 7 39
	pushq	%rbp
	.seh_pushreg	%rbp
.LCFI0:
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
.LCFI1:
	.seh_endprologue
	movq	%rcx, 16(%rbp)
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
	.loc 1 10 26
	movq	16(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, 16(%rbp)
	.loc 1 10 22
	movzbl	(%rax), %eax
	.loc 1 10 17
	movl	$1073821696, %edx
	.loc 1 10 22
	cbtw
	.loc 1 10 20
	movw	%ax, 4(%rdx)
.L2:
	.loc 1 8 12
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L4
	.loc 1 12 1
	nop
	nop
	popq	%rbp
.LCFI2:
	ret
.LFE45:
	.seh_endproc
	.globl	_Z20brightness_message_bPKc
	.def	_Z20brightness_message_bPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z20brightness_message_bPKc
_Z20brightness_message_bPKc:
.LFB46:
	.loc 1 14 48
	pushq	%rbp
	.seh_pushreg	%rbp
.LCFI3:
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
.LCFI4:
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 15 10
	movabsq	$8242185887955552781, %rax
	movabsq	$8319104461757245289, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movabsq	$2334386829830549280, %rax
	movabsq	$4919421869996993634, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movabsq	$2338605651652208928, %rax
	movl	$2125684, %edx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	$0, -20(%rbp)
	movq	$0, -12(%rbp)
	.loc 1 17 27
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	.loc 1 17 17
	movb	%al, -21(%rbp)
	.loc 1 18 27
	movq	16(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	.loc 1 18 17
	movb	%al, -20(%rbp)
	.loc 1 19 17
	movb	$32, -19(%rbp)
	.loc 1 20 17
	movb	$37, -18(%rbp)
	.loc 1 21 17
	movb	$13, -17(%rbp)
	.loc 1 22 17
	movb	$10, -16(%rbp)
	.loc 1 23 17
	movb	$0, -15(%rbp)
	.loc 1 25 20
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_Z15UART_sendstringPKc
	.loc 1 26 1
	nop
	addq	$96, %rsp
	popq	%rbp
.LCFI5:
	ret
.LFE46:
	.seh_endproc
	.globl	_Z20brightness_message_gPKc
	.def	_Z20brightness_message_gPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z20brightness_message_gPKc
_Z20brightness_message_gPKc:
.LFB47:
	.loc 1 28 48
	pushq	%rbp
	.seh_pushreg	%rbp
.LCFI6:
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
.LCFI7:
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 29 10
	movabsq	$8242185887955552781, %rax
	movabsq	$8319104461757245289, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movabsq	$2334386829830549280, %rax
	movabsq	$4993401745366676071, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movabsq	$8387236464259833924, %rax
	movl	$544175136, %edx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	$0, -20(%rbp)
	movq	$0, -12(%rbp)
	.loc 1 31 27
	movq	16(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	.loc 1 31 17
	movb	%al, -20(%rbp)
	.loc 1 32 27
	movq	16(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	.loc 1 32 17
	movb	%al, -19(%rbp)
	.loc 1 33 17
	movb	$32, -18(%rbp)
	.loc 1 34 17
	movb	$37, -17(%rbp)
	.loc 1 35 17
	movb	$13, -16(%rbp)
	.loc 1 36 17
	movb	$10, -15(%rbp)
	.loc 1 37 17
	movb	$0, -14(%rbp)
	.loc 1 40 20
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_Z15UART_sendstringPKc
	.loc 1 41 1
	nop
	addq	$96, %rsp
	popq	%rbp
.LCFI8:
	ret
.LFE47:
	.seh_endproc
	.globl	_Z21brightness_message_bgPKc
	.def	_Z21brightness_message_bgPKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z21brightness_message_bgPKc
_Z21brightness_message_bgPKc:
.LFB48:
	.loc 1 43 49
	pushq	%rbp
	.seh_pushreg	%rbp
.LCFI9:
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
.LCFI10:
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 44 10
	movabsq	$8242185887955552781, %rax
	movabsq	$8319104461757245289, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movabsq	$7526763344484003616, %rax
	movabsq	$8316213866355051552, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movabsq	$2337214414369157920, %rax
	movl	$0, %edx
	movq	%rax, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	$0, -20(%rbp)
	movq	$0, -12(%rbp)
	.loc 1 46 27
	movq	16(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	.loc 1 46 17
	movb	%al, -24(%rbp)
	.loc 1 47 27
	movq	16(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	.loc 1 47 17
	movb	%al, -23(%rbp)
	.loc 1 48 17
	movb	$32, -22(%rbp)
	.loc 1 49 17
	movb	$37, -21(%rbp)
	.loc 1 50 17
	movb	$13, -20(%rbp)
	.loc 1 51 17
	movb	$10, -19(%rbp)
	.loc 1 52 17
	movb	$0, -18(%rbp)
	.loc 1 54 20
	leaq	-64(%rbp), %rax
	movq	%rax, %rcx
	call	_Z15UART_sendstringPKc
	.loc 1 55 1
	nop
	addq	$96, %rsp
	popq	%rbp
.LCFI11:
	ret
.LFE48:
	.seh_endproc
	.globl	_Z23invalid_command_messagePKc
	.def	_Z23invalid_command_messagePKc;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z23invalid_command_messagePKc
_Z23invalid_command_messagePKc:
.LFB49:
	.loc 1 57 51
	pushq	%rbp
	.seh_pushreg	%rbp
.LCFI12:
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
.LCFI13:
	subq	$112, %rsp
	.seh_stackalloc	112
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	.loc 1 58 10
	movabsq	$7596553832751499789, %rax
	movabsq	$7953758733700636772, %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movq	$8292, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -36(%rbp)
	movq	$0, -28(%rbp)
	.loc 1 59 9
	movl	$18, -4(%rbp)
.LBB2:
	.loc 1 61 14
	movl	$0, -8(%rbp)
	.loc 1 61 5
	jmp	.L9
.L11:
	.loc 1 62 20
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	.loc 1 62 21
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 62 9
	testb	%al, %al
	je	.L10
	.loc 1 63 39
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	.loc 1 63 40
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	.loc 1 63 26
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%ecx, -4(%rbp)
	.loc 1 63 30
	cltq
	movb	%dl, -80(%rbp,%rax)
.L10:
	.loc 1 61 5 discriminator 2
	addl	$1, -8(%rbp)
.L9:
	.loc 1 61 23 discriminator 1
	cmpl	$3, -8(%rbp)
	jle	.L11
.LBE2:
	.loc 1 67 18
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	.loc 1 67 22
	cltq
	movb	$13, -80(%rbp,%rax)
	.loc 1 68 18
	movl	-4(%rbp), %eax
	leal	1(%rax), %edx
	movl	%edx, -4(%rbp)
	.loc 1 68 22
	cltq
	movb	$10, -80(%rbp,%rax)
	.loc 1 69 20
	movl	-4(%rbp), %eax
	cltq
	movb	$0, -80(%rbp,%rax)
	.loc 1 71 20
	leaq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	_Z15UART_sendstringPKc
	.loc 1 72 1
	nop
	addq	$112, %rsp
	popq	%rbp
.LCFI14:
	ret
.LFE49:
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB50:
	.loc 1 74 12
	pushq	%rbp
	.seh_pushreg	%rbp
.LCFI15:
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
.LCFI16:
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	.loc 1 74 12
	call	__main
	.loc 1 77 10
	movl	$1073876992, %eax
	movl	24(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 77 18
	orb	$64, %ah
	movl	%eax, 24(%rdx)
	.loc 1 78 10
	movl	$1073876992, %eax
	movl	24(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 78 18
	orl	$4, %eax
	movl	%eax, 24(%rdx)
	.loc 1 81 12
	movl	$1073809408, %eax
	movl	4(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 81 16
	andb	$63, %al
	movl	%eax, 4(%rdx)
	.loc 1 82 12
	movl	$1073809408, %eax
	movl	4(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 82 16
	orb	$-80, %al
	movl	%eax, 4(%rdx)
	.loc 1 84 12
	movl	$1073809408, %eax
	movl	4(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 84 16
	andb	$-13, %ah
	movl	%eax, 4(%rdx)
	.loc 1 85 12
	movl	$1073809408, %eax
	movl	4(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 85 16
	orb	$8, %ah
	movl	%eax, 4(%rdx)
	.loc 1 86 12
	movl	$1073809408, %eax
	movl	16(%rax), %eax
	movl	$1073809408, %edx
	.loc 1 86 17
	orb	$4, %ah
	movl	%eax, 16(%rdx)
	.loc 1 89 13
	movl	$1073821696, %eax
	.loc 1 89 17
	movw	$2500, 8(%rax)
	.loc 1 90 13
	movl	$1073821696, %eax
	.loc 1 90 17
	movw	$8204, 12(%rax)
	.loc 1 93 10
	movl	$1073876992, %eax
	movl	24(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 93 18
	orl	$16, %eax
	movl	%eax, 24(%rdx)
	.loc 1 94 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 94 16
	orl	$3, %eax
	movl	%eax, 4(%rdx)
	.loc 1 95 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 95 16
	andl	$-13, %eax
	movl	%eax, 4(%rdx)
	.loc 1 96 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 96 16
	orl	$8, %eax
	movl	%eax, 4(%rdx)
	.loc 1 98 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 98 16
	orl	$48, %eax
	movl	%eax, 4(%rdx)
	.loc 1 99 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 99 16
	andb	$63, %al
	movl	%eax, 4(%rdx)
	.loc 1 100 12
	movl	$1073811456, %eax
	movl	4(%rax), %eax
	movl	$1073811456, %edx
	.loc 1 100 16
	orb	$-128, %al
	movl	%eax, 4(%rdx)
	.loc 1 103 10
	movl	$1073876992, %eax
	movl	28(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 103 18
	orl	$2, %eax
	movl	%eax, 28(%rdx)
	.loc 1 104 10
	movl	$1073876992, %eax
	movl	24(%rax), %eax
	movl	$1073876992, %edx
	.loc 1 104 18
	orl	$1, %eax
	movl	%eax, 24(%rdx)
	.loc 1 105 11
	movl	$1073807360, %eax
	movl	4(%rax), %eax
	movl	$1073807360, %edx
	.loc 1 105 16
	orb	$12, %ah
	movl	%eax, 4(%rdx)
	.loc 1 107 11
	movl	$1073742848, %eax
	.loc 1 107 15
	movw	$240, 40(%rax)
	.loc 1 108 11
	movl	$1073742848, %eax
	.loc 1 108 15
	movw	$100, 44(%rax)
	.loc 1 111 11
	movl	$1073742848, %eax
	movzwl	28(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 111 17
	orl	$96, %eax
	movw	%ax, 28(%rdx)
	.loc 1 112 11
	movl	$1073742848, %eax
	movzwl	28(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 112 17
	orb	$96, %ah
	movw	%ax, 28(%rdx)
	.loc 1 115 11
	movl	$1073742848, %eax
	movzwl	32(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 115 16
	orb	$1, %ah
	movw	%ax, 32(%rdx)
	.loc 1 116 11
	movl	$1073742848, %eax
	movzwl	32(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 116 16
	orb	$16, %ah
	movw	%ax, 32(%rdx)
	.loc 1 119 11
	movl	$1073742848, %eax
	movzwl	(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 119 15
	orb	$-128, %al
	movw	%ax, (%rdx)
	.loc 1 122 11
	movl	$1073742848, %eax
	movzwl	(%rax), %eax
	movl	$1073742848, %edx
	.loc 1 122 15
	orl	$1, %eax
	movw	%ax, (%rdx)
	.loc 1 125 10
	movl	$0, -9(%rbp)
	.loc 1 126 13
	movb	$0, -1(%rbp)
.L26:
.LBB3:
.LBB4:
	.loc 1 130 21
	movl	$1073821696, %eax
	movzwl	(%rax), %eax
	.loc 1 130 24
	movzwl	%ax, %eax
	andl	$32, %eax
	testl	%eax, %eax
	setne	%al
	.loc 1 130 9
	testb	%al, %al
	je	.L26
.LBB5:
	.loc 1 131 42
	movl	$1073821696, %eax
	movzwl	4(%rax), %eax
	movb	%al, -2(%rbp)
	.loc 1 133 13
	nop
.L14:
	.loc 1 133 30 discriminator 1
	movl	$1073821696, %eax
	movzwl	(%rax), %eax
	.loc 1 133 33 discriminator 1
	movzwl	%ax, %eax
	andl	$128, %eax
	.loc 1 133 20 discriminator 1
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	jne	.L14
	.loc 1 134 21
	movl	$1073821696, %edx
	.loc 1 134 26
	movsbw	-2(%rbp), %ax
	.loc 1 134 24
	movw	%ax, 4(%rdx)
.LBB6:
	.loc 1 136 13
	cmpb	$13, -2(%rbp)
	je	.L15
	.loc 1 136 39 discriminator 1
	cmpb	$10, -2(%rbp)
	jne	.L16
.L15:
.LBB7:
	.loc 1 137 24
	movzbl	-1(%rbp), %eax
	.loc 1 137 38
	cltq
	movb	$0, -9(%rbp,%rax)
.LBB8:
	.loc 1 139 17
	cmpb	$3, -1(%rbp)
	jne	.L17
	.loc 1 139 50 discriminator 1
	movzbl	-9(%rbp), %eax
	.loc 1 139 39 discriminator 1
	cmpb	$98, %al
	jne	.L17
	.loc 1 139 70 discriminator 2
	movzbl	-8(%rbp), %eax
	.loc 1 139 59 discriminator 2
	cmpb	$47, %al
	jle	.L17
	.loc 1 139 90 discriminator 3
	movzbl	-8(%rbp), %eax
	.loc 1 139 79 discriminator 3
	cmpb	$57, %al
	jg	.L17
	.loc 1 139 110 discriminator 4
	movzbl	-7(%rbp), %eax
	.loc 1 139 99 discriminator 4
	cmpb	$47, %al
	jle	.L17
	.loc 1 139 130 discriminator 5
	movzbl	-7(%rbp), %eax
	.loc 1 139 119 discriminator 5
	cmpb	$57, %al
	jg	.L17
.LBB9:
	.loc 1 140 52
	movzbl	-8(%rbp), %eax
	.loc 1 140 54
	subl	$48, %eax
	.loc 1 140 61
	leal	0(,%rax,8), %edx
	.loc 1 140 79
	movzbl	-8(%rbp), %eax
	.loc 1 140 81
	subl	$48, %eax
	.loc 1 140 88
	addl	%eax, %eax
	.loc 1 140 67
	addl	%eax, %edx
	.loc 1 140 105
	movzbl	-7(%rbp), %eax
	.loc 1 140 94
	addl	%edx, %eax
	.loc 1 140 29
	subl	$48, %eax
	movb	%al, -3(%rbp)
	.loc 1 142 27
	movl	$1073742848, %edx
	.loc 1 142 34
	movzbl	-3(%rbp), %eax
	.loc 1 142 32
	movw	%ax, 60(%rdx)
	.loc 1 144 41
	leaq	-9(%rbp), %rax
	movq	%rax, %rcx
	call	_Z20brightness_message_bPKc
.LBE9:
	.loc 1 146 17
	jmp	.L18
.L17:
.LBB10:
.LBB11:
	.loc 1 148 22
	cmpb	$3, -1(%rbp)
	jne	.L19
	.loc 1 148 55 discriminator 1
	movzbl	-9(%rbp), %eax
	.loc 1 148 44 discriminator 1
	cmpb	$103, %al
	jne	.L19
	.loc 1 148 75 discriminator 2
	movzbl	-8(%rbp), %eax
	.loc 1 148 64 discriminator 2
	cmpb	$47, %al
	jle	.L19
	.loc 1 148 95 discriminator 3
	movzbl	-8(%rbp), %eax
	.loc 1 148 84 discriminator 3
	cmpb	$57, %al
	jg	.L19
	.loc 1 148 115 discriminator 4
	movzbl	-7(%rbp), %eax
	.loc 1 148 104 discriminator 4
	cmpb	$47, %al
	jle	.L19
	.loc 1 148 135 discriminator 5
	movzbl	-7(%rbp), %eax
	.loc 1 148 124 discriminator 5
	cmpb	$57, %al
	jg	.L19
.LBB12:
	.loc 1 149 52
	movzbl	-8(%rbp), %eax
	.loc 1 149 54
	subl	$48, %eax
	.loc 1 149 61
	leal	0(,%rax,8), %edx
	.loc 1 149 79
	movzbl	-8(%rbp), %eax
	.loc 1 149 81
	subl	$48, %eax
	.loc 1 149 88
	addl	%eax, %eax
	.loc 1 149 67
	addl	%eax, %edx
	.loc 1 149 105
	movzbl	-7(%rbp), %eax
	.loc 1 149 94
	addl	%edx, %eax
	.loc 1 149 29
	subl	$48, %eax
	movb	%al, -4(%rbp)
	.loc 1 151 27
	movl	$1073742848, %edx
	.loc 1 151 34
	movzbl	-4(%rbp), %eax
	.loc 1 151 32
	movw	%ax, 64(%rdx)
	.loc 1 153 41
	leaq	-9(%rbp), %rax
	movq	%rax, %rcx
	call	_Z20brightness_message_gPKc
.LBE12:
	.loc 1 154 17
	jmp	.L18
.L19:
.LBB13:
.LBB14:
	.loc 1 156 22
	cmpb	$4, -1(%rbp)
	jne	.L20
	.loc 1 156 57 discriminator 1
	movzbl	-9(%rbp), %eax
	.loc 1 156 44 discriminator 1
	cmpb	$103, %al
	jne	.L21
	.loc 1 156 77 discriminator 2
	movzbl	-8(%rbp), %eax
	.loc 1 156 66 discriminator 2
	cmpb	$98, %al
	je	.L22
.L21:
	.loc 1 156 99 discriminator 4
	movzbl	-9(%rbp), %eax
	.loc 1 156 87 discriminator 4
	cmpb	$98, %al
	jne	.L20
	.loc 1 156 119 discriminator 5
	movzbl	-8(%rbp), %eax
	.loc 1 156 108 discriminator 5
	cmpb	$103, %al
	jne	.L20
.L22:
	.loc 1 157 38
	movzbl	-7(%rbp), %eax
	.loc 1 157 27
	cmpb	$47, %al
	jle	.L20
	.loc 1 157 58 discriminator 1
	movzbl	-7(%rbp), %eax
	.loc 1 157 47 discriminator 1
	cmpb	$57, %al
	jg	.L20
	.loc 1 157 78 discriminator 2
	movzbl	-6(%rbp), %eax
	.loc 1 157 67 discriminator 2
	cmpb	$47, %al
	jle	.L20
	.loc 1 157 98 discriminator 3
	movzbl	-6(%rbp), %eax
	.loc 1 157 87 discriminator 3
	cmpb	$57, %al
	jg	.L20
.LBB15:
	.loc 1 158 52
	movzbl	-7(%rbp), %eax
	.loc 1 158 54
	subl	$48, %eax
	.loc 1 158 61
	leal	0(,%rax,8), %edx
	.loc 1 158 79
	movzbl	-7(%rbp), %eax
	.loc 1 158 81
	subl	$48, %eax
	.loc 1 158 88
	addl	%eax, %eax
	.loc 1 158 67
	addl	%eax, %edx
	.loc 1 158 105
	movzbl	-6(%rbp), %eax
	.loc 1 158 94
	addl	%edx, %eax
	.loc 1 158 29
	subl	$48, %eax
	movb	%al, -5(%rbp)
	.loc 1 160 27
	movl	$1073742848, %edx
	.loc 1 160 34
	movzbl	-5(%rbp), %eax
	.loc 1 160 32
	movw	%ax, 60(%rdx)
	.loc 1 161 27
	movl	$1073742848, %edx
	.loc 1 161 34
	movzbl	-5(%rbp), %eax
	.loc 1 161 32
	movw	%ax, 64(%rdx)
	.loc 1 163 42
	leaq	-9(%rbp), %rax
	movq	%rax, %rcx
	call	_Z21brightness_message_bgPKc
.LBE15:
	.loc 1 164 17
	jmp	.L18
.L20:
	.loc 1 166 44
	leaq	-9(%rbp), %rax
	movq	%rax, %rcx
	call	_Z23invalid_command_messagePKc
.L18:
.LBE14:
.LBE13:
.LBE11:
.LBE10:
.LBE8:
	.loc 1 169 30
	movb	$0, -1(%rbp)
	.loc 1 171 23
	leaq	-9(%rbp), %rax
	movl	$4, %r8d
	movl	$32, %edx
	movq	%rax, %rcx
	call	memset
.LBE7:
	.loc 1 172 13
	jmp	.L13
.L16:
	.loc 1 173 18
	cmpb	$8, -2(%rbp)
	jne	.L24
	.loc 1 174 17
	cmpb	$0, -1(%rbp)
	je	.L26
	.loc 1 175 33
	movzbl	-1(%rbp), %eax
	subl	$1, %eax
	movb	%al, -1(%rbp)
	jmp	.L26
.L24:
	.loc 1 180 17
	cmpb	$3, -1(%rbp)
	ja	.L25
	.loc 1 181 44
	movzbl	-2(%rbp), %edx
	.loc 1 181 40
	movzbl	-1(%rbp), %eax
	leal	1(%rax), %ecx
	movb	%cl, -1(%rbp)
	movzbl	%al, %eax
	.loc 1 181 44
	cltq
	movb	%dl, -9(%rbp,%rax)
	jmp	.L26
.L25:
	.loc 1 184 34
	movb	$0, -1(%rbp)
.L13:
.LBE6:
.LBE5:
.LBE4:
.LBE3:
	.loc 1 188 5 discriminator 2
	jmp	.L26
.LFE50:
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
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.byte	0x4
	.long	.LCFI0-.LFB45
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
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.byte	0x4
	.long	.LCFI3-.LFB46
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0xc6
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 8
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.secrel32	.Lframe0
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.byte	0x4
	.long	.LCFI6-.LFB47
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0xc6
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 8
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.secrel32	.Lframe0
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.byte	0x4
	.long	.LCFI9-.LFB48
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xc6
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 8
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.secrel32	.Lframe0
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.byte	0x4
	.long	.LCFI12-.LFB49
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xd
	.uleb128 0x6
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xc6
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x8
	.align 8
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.secrel32	.Lframe0
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.byte	0x4
	.long	.LCFI15-.LFB50
	.byte	0xe
	.uleb128 0x10
	.byte	0x86
	.uleb128 0x2
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xd
	.uleb128 0x6
	.align 8
.LEFDE10:
	.text
.Letext0:
	.file 2 "E:/Program Files/msys64/mingw64/include/corecrt.h"
	.file 3 "E:/Program Files/msys64/mingw64/include/stdint.h"
	.file 4 "drivers/CMSIS/DeviceSupport/ST/STM32F10x/stm32f10x.h"
	.file 5 "E:/Program Files/msys64/mingw64/include/string.h"
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0xa31
	.word	0x5
	.byte	0x1
	.byte	0x8
	.secrel32	.Ldebug_abbrev0
	.uleb128 0x11
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
	.uleb128 0x12
	.long	0x5b
	.uleb128 0x7
	.ascii "size_t\0"
	.byte	0x2
	.byte	0x23
	.byte	0x2c
	.long	0x77
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
	.uleb128 0x13
	.ascii "decltype(nullptr)\0"
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.uleb128 0x7
	.ascii "uint8_t\0"
	.byte	0x3
	.byte	0x24
	.byte	0x19
	.long	0xfb
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.uleb128 0x7
	.ascii "uint16_t\0"
	.byte	0x3
	.byte	0x26
	.byte	0x19
	.long	0xa2
	.uleb128 0xb
	.long	0x15a
	.uleb128 0x7
	.ascii "uint32_t\0"
	.byte	0x3
	.byte	0x28
	.byte	0x14
	.long	0xd6
	.uleb128 0xb
	.long	0x170
	.uleb128 0xc
	.long	0x181
	.long	0x196
	.uleb128 0xd
	.long	0x77
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.long	0x186
	.uleb128 0x5
	.byte	0x1c
	.word	0x3ed
	.ascii "12GPIO_TypeDef\0"
	.long	0x210
	.uleb128 0x1
	.ascii "CRL\0"
	.word	0x3ee
	.byte	0x11
	.long	0x181
	.byte	0
	.uleb128 0x1
	.ascii "CRH\0"
	.word	0x3ef
	.byte	0x11
	.long	0x181
	.byte	0x4
	.uleb128 0x1
	.ascii "IDR\0"
	.word	0x3f0
	.byte	0x11
	.long	0x181
	.byte	0x8
	.uleb128 0x1
	.ascii "ODR\0"
	.word	0x3f1
	.byte	0x11
	.long	0x181
	.byte	0xc
	.uleb128 0x1
	.ascii "BSRR\0"
	.word	0x3f2
	.byte	0x11
	.long	0x181
	.byte	0x10
	.uleb128 0x1
	.ascii "BRR\0"
	.word	0x3f3
	.byte	0x11
	.long	0x181
	.byte	0x14
	.uleb128 0x1
	.ascii "LCKR\0"
	.word	0x3f4
	.byte	0x11
	.long	0x181
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.ascii "GPIO_TypeDef\0"
	.word	0x3f5
	.long	0x19b
	.uleb128 0x5
	.byte	0x20
	.word	0x3fc
	.ascii "12AFIO_TypeDef\0"
	.long	0x284
	.uleb128 0x1
	.ascii "EVCR\0"
	.word	0x3fd
	.byte	0x11
	.long	0x181
	.byte	0
	.uleb128 0x1
	.ascii "MAPR\0"
	.word	0x3fe
	.byte	0x11
	.long	0x181
	.byte	0x4
	.uleb128 0x1
	.ascii "EXTICR\0"
	.word	0x3ff
	.byte	0x11
	.long	0x196
	.byte	0x8
	.uleb128 0x2
	.secrel32	.LASF2
	.word	0x400
	.byte	0xc
	.long	0x170
	.byte	0x18
	.uleb128 0x1
	.ascii "MAPR2\0"
	.word	0x401
	.byte	0x11
	.long	0x181
	.byte	0x1c
	.byte	0
	.uleb128 0x6
	.ascii "AFIO_TypeDef\0"
	.word	0x402
	.long	0x224
	.uleb128 0x5
	.byte	0x30
	.word	0x438
	.ascii "11RCC_TypeDef\0"
	.long	0x363
	.uleb128 0x1
	.ascii "CR\0"
	.word	0x439
	.byte	0x11
	.long	0x181
	.byte	0
	.uleb128 0x1
	.ascii "CFGR\0"
	.word	0x43a
	.byte	0x11
	.long	0x181
	.byte	0x4
	.uleb128 0x1
	.ascii "CIR\0"
	.word	0x43b
	.byte	0x11
	.long	0x181
	.byte	0x8
	.uleb128 0x1
	.ascii "APB2RSTR\0"
	.word	0x43c
	.byte	0x11
	.long	0x181
	.byte	0xc
	.uleb128 0x1
	.ascii "APB1RSTR\0"
	.word	0x43d
	.byte	0x11
	.long	0x181
	.byte	0x10
	.uleb128 0x1
	.ascii "AHBENR\0"
	.word	0x43e
	.byte	0x11
	.long	0x181
	.byte	0x14
	.uleb128 0x1
	.ascii "APB2ENR\0"
	.word	0x43f
	.byte	0x11
	.long	0x181
	.byte	0x18
	.uleb128 0x1
	.ascii "APB1ENR\0"
	.word	0x440
	.byte	0x11
	.long	0x181
	.byte	0x1c
	.uleb128 0x1
	.ascii "BDCR\0"
	.word	0x441
	.byte	0x11
	.long	0x181
	.byte	0x20
	.uleb128 0x1
	.ascii "CSR\0"
	.word	0x442
	.byte	0x11
	.long	0x181
	.byte	0x24
	.uleb128 0x2
	.secrel32	.LASF2
	.word	0x44a
	.byte	0xc
	.long	0x170
	.byte	0x28
	.uleb128 0x1
	.ascii "CFGR2\0"
	.word	0x44b
	.byte	0x11
	.long	0x181
	.byte	0x2c
	.byte	0
	.uleb128 0x6
	.ascii "RCC_TypeDef\0"
	.word	0x44d
	.long	0x298
	.uleb128 0x5
	.byte	0x50
	.word	0x4a6
	.ascii "11TIM_TypeDef\0"
	.long	0x5f9
	.uleb128 0x1
	.ascii "CR1\0"
	.word	0x4a7
	.byte	0x11
	.long	0x16b
	.byte	0
	.uleb128 0x2
	.secrel32	.LASF2
	.word	0x4a8
	.byte	0xd
	.long	0x15a
	.byte	0x2
	.uleb128 0x1
	.ascii "CR2\0"
	.word	0x4a9
	.byte	0x11
	.long	0x16b
	.byte	0x4
	.uleb128 0x2
	.secrel32	.LASF3
	.word	0x4aa
	.byte	0xd
	.long	0x15a
	.byte	0x6
	.uleb128 0x1
	.ascii "SMCR\0"
	.word	0x4ab
	.byte	0x11
	.long	0x16b
	.byte	0x8
	.uleb128 0x2
	.secrel32	.LASF4
	.word	0x4ac
	.byte	0xd
	.long	0x15a
	.byte	0xa
	.uleb128 0x1
	.ascii "DIER\0"
	.word	0x4ad
	.byte	0x11
	.long	0x16b
	.byte	0xc
	.uleb128 0x2
	.secrel32	.LASF5
	.word	0x4ae
	.byte	0xd
	.long	0x15a
	.byte	0xe
	.uleb128 0x1
	.ascii "SR\0"
	.word	0x4af
	.byte	0x11
	.long	0x16b
	.byte	0x10
	.uleb128 0x2
	.secrel32	.LASF6
	.word	0x4b0
	.byte	0xd
	.long	0x15a
	.byte	0x12
	.uleb128 0x1
	.ascii "EGR\0"
	.word	0x4b1
	.byte	0x11
	.long	0x16b
	.byte	0x14
	.uleb128 0x2
	.secrel32	.LASF7
	.word	0x4b2
	.byte	0xd
	.long	0x15a
	.byte	0x16
	.uleb128 0x1
	.ascii "CCMR1\0"
	.word	0x4b3
	.byte	0x11
	.long	0x16b
	.byte	0x18
	.uleb128 0x2
	.secrel32	.LASF8
	.word	0x4b4
	.byte	0xd
	.long	0x15a
	.byte	0x1a
	.uleb128 0x1
	.ascii "CCMR2\0"
	.word	0x4b5
	.byte	0x11
	.long	0x16b
	.byte	0x1c
	.uleb128 0x1
	.ascii "RESERVED7\0"
	.word	0x4b6
	.byte	0xd
	.long	0x15a
	.byte	0x1e
	.uleb128 0x1
	.ascii "CCER\0"
	.word	0x4b7
	.byte	0x11
	.long	0x16b
	.byte	0x20
	.uleb128 0x1
	.ascii "RESERVED8\0"
	.word	0x4b8
	.byte	0xd
	.long	0x15a
	.byte	0x22
	.uleb128 0x1
	.ascii "CNT\0"
	.word	0x4b9
	.byte	0x11
	.long	0x16b
	.byte	0x24
	.uleb128 0x1
	.ascii "RESERVED9\0"
	.word	0x4ba
	.byte	0xd
	.long	0x15a
	.byte	0x26
	.uleb128 0x1
	.ascii "PSC\0"
	.word	0x4bb
	.byte	0x11
	.long	0x16b
	.byte	0x28
	.uleb128 0x1
	.ascii "RESERVED10\0"
	.word	0x4bc
	.byte	0xd
	.long	0x15a
	.byte	0x2a
	.uleb128 0x1
	.ascii "ARR\0"
	.word	0x4bd
	.byte	0x11
	.long	0x16b
	.byte	0x2c
	.uleb128 0x1
	.ascii "RESERVED11\0"
	.word	0x4be
	.byte	0xd
	.long	0x15a
	.byte	0x2e
	.uleb128 0x1
	.ascii "RCR\0"
	.word	0x4bf
	.byte	0x11
	.long	0x16b
	.byte	0x30
	.uleb128 0x1
	.ascii "RESERVED12\0"
	.word	0x4c0
	.byte	0xd
	.long	0x15a
	.byte	0x32
	.uleb128 0x1
	.ascii "CCR1\0"
	.word	0x4c1
	.byte	0x11
	.long	0x16b
	.byte	0x34
	.uleb128 0x1
	.ascii "RESERVED13\0"
	.word	0x4c2
	.byte	0xd
	.long	0x15a
	.byte	0x36
	.uleb128 0x1
	.ascii "CCR2\0"
	.word	0x4c3
	.byte	0x11
	.long	0x16b
	.byte	0x38
	.uleb128 0x1
	.ascii "RESERVED14\0"
	.word	0x4c4
	.byte	0xd
	.long	0x15a
	.byte	0x3a
	.uleb128 0x1
	.ascii "CCR3\0"
	.word	0x4c5
	.byte	0x11
	.long	0x16b
	.byte	0x3c
	.uleb128 0x1
	.ascii "RESERVED15\0"
	.word	0x4c6
	.byte	0xd
	.long	0x15a
	.byte	0x3e
	.uleb128 0x1
	.ascii "CCR4\0"
	.word	0x4c7
	.byte	0x11
	.long	0x16b
	.byte	0x40
	.uleb128 0x1
	.ascii "RESERVED16\0"
	.word	0x4c8
	.byte	0xd
	.long	0x15a
	.byte	0x42
	.uleb128 0x1
	.ascii "BDTR\0"
	.word	0x4c9
	.byte	0x11
	.long	0x16b
	.byte	0x44
	.uleb128 0x1
	.ascii "RESERVED17\0"
	.word	0x4ca
	.byte	0xd
	.long	0x15a
	.byte	0x46
	.uleb128 0x1
	.ascii "DCR\0"
	.word	0x4cb
	.byte	0x11
	.long	0x16b
	.byte	0x48
	.uleb128 0x1
	.ascii "RESERVED18\0"
	.word	0x4cc
	.byte	0xd
	.long	0x15a
	.byte	0x4a
	.uleb128 0x1
	.ascii "DMAR\0"
	.word	0x4cd
	.byte	0x11
	.long	0x16b
	.byte	0x4c
	.uleb128 0x1
	.ascii "RESERVED19\0"
	.word	0x4ce
	.byte	0xd
	.long	0x15a
	.byte	0x4e
	.byte	0
	.uleb128 0x6
	.ascii "TIM_TypeDef\0"
	.word	0x4cf
	.long	0x376
	.uleb128 0x5
	.byte	0x1c
	.word	0x4d6
	.ascii "13USART_TypeDef\0"
	.long	0x6da
	.uleb128 0x1
	.ascii "SR\0"
	.word	0x4d7
	.byte	0x11
	.long	0x16b
	.byte	0
	.uleb128 0x2
	.secrel32	.LASF2
	.word	0x4d8
	.byte	0xd
	.long	0x15a
	.byte	0x2
	.uleb128 0x1
	.ascii "DR\0"
	.word	0x4d9
	.byte	0x11
	.long	0x16b
	.byte	0x4
	.uleb128 0x2
	.secrel32	.LASF3
	.word	0x4da
	.byte	0xd
	.long	0x15a
	.byte	0x6
	.uleb128 0x1
	.ascii "BRR\0"
	.word	0x4db
	.byte	0x11
	.long	0x16b
	.byte	0x8
	.uleb128 0x2
	.secrel32	.LASF4
	.word	0x4dc
	.byte	0xd
	.long	0x15a
	.byte	0xa
	.uleb128 0x1
	.ascii "CR1\0"
	.word	0x4dd
	.byte	0x11
	.long	0x16b
	.byte	0xc
	.uleb128 0x2
	.secrel32	.LASF5
	.word	0x4de
	.byte	0xd
	.long	0x15a
	.byte	0xe
	.uleb128 0x1
	.ascii "CR2\0"
	.word	0x4df
	.byte	0x11
	.long	0x16b
	.byte	0x10
	.uleb128 0x2
	.secrel32	.LASF6
	.word	0x4e0
	.byte	0xd
	.long	0x15a
	.byte	0x12
	.uleb128 0x1
	.ascii "CR3\0"
	.word	0x4e1
	.byte	0x11
	.long	0x16b
	.byte	0x14
	.uleb128 0x2
	.secrel32	.LASF7
	.word	0x4e2
	.byte	0xd
	.long	0x15a
	.byte	0x16
	.uleb128 0x1
	.ascii "GTPR\0"
	.word	0x4e3
	.byte	0x11
	.long	0x16b
	.byte	0x18
	.uleb128 0x2
	.secrel32	.LASF8
	.word	0x4e4
	.byte	0xd
	.long	0x15a
	.byte	0x1a
	.byte	0
	.uleb128 0x6
	.ascii "USART_TypeDef\0"
	.word	0x4e5
	.long	0x60c
	.uleb128 0x14
	.ascii "memset\0"
	.byte	0x5
	.byte	0x35
	.byte	0x12
	.long	0x712
	.long	0x712
	.uleb128 0xe
	.long	0x712
	.uleb128 0xe
	.long	0xb8
	.uleb128 0xe
	.long	0x68
	.byte	0
	.uleb128 0x15
	.byte	0x8
	.uleb128 0x16
	.ascii "main\0"
	.byte	0x1
	.byte	0x4a
	.byte	0x5
	.long	0xb8
	.quad	.LFB50
	.quad	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.long	0x7ef
	.uleb128 0x4
	.secrel32	.LASF9
	.byte	0x7d
	.byte	0xa
	.long	0x7ef
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x8
	.ascii "buffer_index\0"
	.byte	0x7e
	.byte	0xd
	.long	0x13d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0xf
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x8
	.ascii "received_char\0"
	.byte	0x83
	.byte	0x12
	.long	0x5b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x10
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.long	0x7a9
	.uleb128 0x4
	.secrel32	.LASF10
	.byte	0x8c
	.byte	0x1d
	.long	0x13d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.byte	0
	.uleb128 0x10
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.long	0x7cd
	.uleb128 0x4
	.secrel32	.LASF10
	.byte	0x95
	.byte	0x1d
	.long	0x13d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.quad	.LBB15
	.quad	.LBE15-.LBB15
	.uleb128 0x4
	.secrel32	.LASF10
	.byte	0x9e
	.byte	0x1d
	.long	0x13d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x5b
	.long	0x7ff
	.uleb128 0xd
	.long	0x77
	.byte	0x3
	.byte	0
	.uleb128 0x9
	.ascii "invalid_command_message\0"
	.byte	0x39
	.ascii "_Z23invalid_command_messagePKc\0"
	.quad	.LFB49
	.quad	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.long	0x89a
	.uleb128 0xa
	.secrel32	.LASF9
	.byte	0x39
	.byte	0x29
	.long	0x89a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.secrel32	.LASF11
	.byte	0x3a
	.byte	0xa
	.long	0x8a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x8
	.ascii "index\0"
	.byte	0x3b
	.byte	0x9
	.long	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x8
	.ascii "i\0"
	.byte	0x3d
	.byte	0xe
	.long	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x17
	.byte	0x8
	.long	0x63
	.uleb128 0xc
	.long	0x5b
	.long	0x8b0
	.uleb128 0xd
	.long	0x77
	.byte	0x3b
	.byte	0
	.uleb128 0x9
	.ascii "brightness_message_bg\0"
	.byte	0x2b
	.ascii "_Z21brightness_message_bgPKc\0"
	.quad	.LFB48
	.quad	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.long	0x919
	.uleb128 0xa
	.secrel32	.LASF9
	.byte	0x2b
	.byte	0x27
	.long	0x89a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.secrel32	.LASF11
	.byte	0x2c
	.byte	0xa
	.long	0x8a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x9
	.ascii "brightness_message_g\0"
	.byte	0x1c
	.ascii "_Z20brightness_message_gPKc\0"
	.quad	.LFB47
	.quad	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.long	0x980
	.uleb128 0xa
	.secrel32	.LASF9
	.byte	0x1c
	.byte	0x26
	.long	0x89a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.secrel32	.LASF11
	.byte	0x1d
	.byte	0xa
	.long	0x8a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x9
	.ascii "brightness_message_b\0"
	.byte	0xe
	.ascii "_Z20brightness_message_bPKc\0"
	.quad	.LFB46
	.quad	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.long	0x9e7
	.uleb128 0xa
	.secrel32	.LASF9
	.byte	0xe
	.byte	0x26
	.long	0x89a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x4
	.secrel32	.LASF11
	.byte	0xf
	.byte	0xa
	.long	0x8a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x18
	.ascii "UART_sendstring\0"
	.byte	0x1
	.byte	0x7
	.byte	0x6
	.ascii "_Z15UART_sendstringPKc\0"
	.quad	.LFB45
	.quad	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x19
	.ascii "str\0"
	.byte	0x1
	.byte	0x7
	.byte	0x22
	.long	0x89a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
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
	.sleb128 4
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
	.sleb128 4
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
	.sleb128 4
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
	.sleb128 4
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
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x6e
	.uleb128 0x8
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
	.uleb128 0xa
	.uleb128 0x5
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
	.uleb128 0xb
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x3b
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
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
.LASF9:
	.ascii "buffer\0"
.LASF11:
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
.LASF10:
	.ascii "brightness\0"
	.section	.debug_line_str,"dr"
.LASF0:
	.ascii "main.cpp\0"
.LASF1:
	.ascii "E:\\proj\\test\0"
	.ident	"GCC: (Rev10, Built by MSYS2 project) 12.2.0"
	.def	memset;	.scl	2;	.type	32;	.endef
