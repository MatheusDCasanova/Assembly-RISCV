	.text
	.file	"exemplo.c"
	.globl	run_operation           # -- Begin function run_operation
	.p2align	2
	.type	run_operation,@function
run_operation:                          # @run_operation
# %bb.0:
	addi	sp, sp, -144
	sw	ra, 140(sp)
	sw	s0, 136(sp)
	addi	s0, sp, 144
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	mv	a1, zero
	sw	a0, -84(s0)
	beq	a0, a1, .LBB0_11
	j	.LBB0_1
.LBB0_1:
	addi	a0, zero, 1
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_12
	j	.LBB0_2
.LBB0_2:
	addi	a0, zero, 2
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_13
	j	.LBB0_3
.LBB0_3:
	addi	a0, zero, 3
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_14
	j	.LBB0_4
.LBB0_4:
	addi	a0, zero, 4
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_15
	j	.LBB0_5
.LBB0_5:
	addi	a0, zero, 5
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_16
	j	.LBB0_6
.LBB0_6:
	addi	a0, zero, 6
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_17
	j	.LBB0_7
.LBB0_7:
	addi	a0, zero, 7
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_18
	j	.LBB0_8
.LBB0_8:
	addi	a0, zero, 8
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_19
	j	.LBB0_9
.LBB0_9:
	addi	a0, zero, 9
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_20
	j	.LBB0_10
.LBB0_10:
	addi	a0, zero, 10
	lw	a1, -84(s0)
	beq	a1, a0, .LBB0_37
	j	.LBB0_38
.LBB0_11:
	lui	a0, %hi(buffer)
	addi	a0, a0, %lo(buffer)
	call	puts
	j	.LBB0_39
.LBB0_12:
	lui	a0, %hi(buffer)
	addi	a0, a0, %lo(buffer)
	sw	a0, -88(s0)
	call	gets
	lw	a1, -88(s0)
	sw	a0, -92(s0)
	mv	a0, a1
	call	puts
	j	.LBB0_39
.LBB0_13:
	lui	a0, %hi(number)
	lw	a0, %lo(number)(a0)
	lui	a1, %hi(buffer)
	addi	a1, a1, %lo(buffer)
	addi	a2, zero, 10
	call	itoa
	call	puts
	j	.LBB0_39
.LBB0_14:
	lui	a0, %hi(buffer)
	addi	a0, a0, %lo(buffer)
	sw	a0, -96(s0)
	call	gets
	call	atoi
	addi	a2, zero, 16
	lw	a1, -96(s0)
	call	itoa
	call	puts
	j	.LBB0_39
.LBB0_15:
	call	time
	sw	a0, -16(s0)
	lui	a0, %hi(number)
	lw	a0, %lo(number)(a0)
	call	sleep
	call	time
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	lw	a1, -16(s0)
	sub	a0, a0, a1
	lui	a1, %hi(buffer)
	addi	a1, a1, %lo(buffer)
	addi	a2, zero, 10
	call	itoa
	call	puts
	j	.LBB0_39
.LBB0_16:
	call	time
	lui	a1, %hi(buffer)
	addi	a1, a1, %lo(buffer)
	addi	a2, zero, 10
	call	itoa
	call	puts
	j	.LBB0_39
.LBB0_17:
	lui	a0, %hi(number)
	lw	a0, %lo(number)(a0)
	addi	a1, zero, 40
	call	approx_sqrt
	lui	a1, %hi(buffer)
	addi	a1, a1, %lo(buffer)
	addi	a2, zero, 10
	call	itoa
	call	puts
	j	.LBB0_39
.LBB0_18:
	call	time
	sw	a0, -16(s0)
	lui	a0, %hi(number)
	lw	a1, %lo(number)(a0)
	addi	a2, zero, 100
	sw	a0, -100(s0)
	mv	a0, a1
	mv	a1, a2
	call	approx_sqrt
	sw	a0, -104(s0)
	call	time
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	lw	a1, -16(s0)
	sub	a0, a0, a1
	lui	a1, %hi(buffer)
	addi	a1, a1, %lo(buffer)
	addi	a2, zero, 10
	sw	a1, -108(s0)
	sw	a2, -112(s0)
	call	itoa
	call	puts
	lw	a0, -100(s0)
	lw	a0, %lo(number)(a0)
	lw	a1, -108(s0)
	lw	a2, -112(s0)
	call	itoa
	call	puts
	j	.LBB0_39
.LBB0_19:
	lui	a0, %hi(buffer)
	addi	a0, a0, %lo(buffer)
	sw	a0, -116(s0)
	call	gets
	call	atoi
	sw	a0, -32(s0)
	lw	a0, -116(s0)
	call	gets
	call	atoi
	sw	a0, -36(s0)
	lw	a0, -116(s0)
	call	gets
	call	atoi
	sw	a0, -40(s0)
	lw	a0, -116(s0)
	call	gets
	call	atoi
	sw	a0, -44(s0)
	lw	a0, -116(s0)
	call	gets
	call	atoi
	sw	a0, -48(s0)
	lw	a0, -116(s0)
	call	gets
	call	atoi
	sw	a0, -52(s0)
	lw	a2, -32(s0)
	lw	a3, -36(s0)
	lw	a4, -40(s0)
	lw	a5, -44(s0)
	lw	a6, -48(s0)
	lw	a7, -52(s0)
	addi	a0, s0, -24
	addi	a1, s0, -28
	call	getPosition
	lw	a0, -24(s0)
	addi	a1, zero, 10
	lw	a2, -116(s0)
	sw	a1, -120(s0)
	mv	a1, a2
	lw	a2, -120(s0)
	call	itoa
	call	puts
	lw	a0, -28(s0)
	lw	a1, -116(s0)
	lw	a2, -120(s0)
	call	itoa
	call	puts
	j	.LBB0_39
.LBB0_20:
	lui	a0, %hi(buffer)
	addi	a0, a0, %lo(buffer)
	sw	a0, -124(s0)
	call	gets
	call	atoi
	sw	a0, -56(s0)
	lw	a0, -124(s0)
	call	gets
	call	atoi
	sw	a0, -60(s0)
	mv	a0, zero
	sw	a0, -64(s0)
	j	.LBB0_21
.LBB0_21:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_23 Depth 2
	lw	a0, -64(s0)
	addi	a1, zero, 2
	blt	a1, a0, .LBB0_28
	j	.LBB0_22
.LBB0_22:                               #   in Loop: Header=BB0_21 Depth=1
	mv	a0, zero
	sw	a0, -68(s0)
	j	.LBB0_23
.LBB0_23:                               #   Parent Loop BB0_21 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -68(s0)
	addi	a1, zero, 2
	blt	a1, a0, .LBB0_26
	j	.LBB0_24
.LBB0_24:                               #   in Loop: Header=BB0_23 Depth=2
	lui	a0, %hi(buffer)
	addi	a0, a0, %lo(buffer)
	call	gets
	call	atoi
	lw	a1, -64(s0)
	addi	a2, zero, 3
	mul	a1, a1, a2
	addi	a2, s0, -77
	add	a1, a2, a1
	lw	a2, -68(s0)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB0_25
.LBB0_25:                               #   in Loop: Header=BB0_23 Depth=2
	lw	a0, -68(s0)
	addi	a0, a0, 1
	sw	a0, -68(s0)
	j	.LBB0_23
.LBB0_26:                               #   in Loop: Header=BB0_21 Depth=1
	j	.LBB0_27
.LBB0_27:                               #   in Loop: Header=BB0_21 Depth=1
	lw	a0, -64(s0)
	addi	a0, a0, 1
	sw	a0, -64(s0)
	j	.LBB0_21
.LBB0_28:
	lw	a1, -56(s0)
	lw	a2, -60(s0)
	lui	a0, %hi(img)
	addi	a0, a0, %lo(img)
	addi	a3, s0, -77
	call	imageFilter
	mv	a0, zero
	sw	a0, -64(s0)
	j	.LBB0_29
.LBB0_29:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_31 Depth 2
	lw	a0, -64(s0)
	lw	a1, -60(s0)
	bge	a0, a1, .LBB0_36
	j	.LBB0_30
.LBB0_30:                               #   in Loop: Header=BB0_29 Depth=1
	mv	a0, zero
	sw	a0, -68(s0)
	j	.LBB0_31
.LBB0_31:                               #   Parent Loop BB0_29 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -68(s0)
	lw	a1, -56(s0)
	bge	a0, a1, .LBB0_34
	j	.LBB0_32
.LBB0_32:                               #   in Loop: Header=BB0_31 Depth=2
	lw	a0, -64(s0)
	lw	a1, -56(s0)
	mul	a0, a0, a1
	lw	a1, -68(s0)
	add	a0, a0, a1
	lui	a1, %hi(img)
	addi	a1, a1, %lo(img)
	add	a0, a0, a1
	lbu	a0, 0(a0)
	lui	a1, %hi(buffer)
	addi	a1, a1, %lo(buffer)
	addi	a2, zero, 10
	call	itoa
	call	puts
	j	.LBB0_33
.LBB0_33:                               #   in Loop: Header=BB0_31 Depth=2
	lw	a0, -68(s0)
	addi	a0, a0, 1
	sw	a0, -68(s0)
	j	.LBB0_31
.LBB0_34:                               #   in Loop: Header=BB0_29 Depth=1
	j	.LBB0_35
.LBB0_35:                               #   in Loop: Header=BB0_29 Depth=1
	lw	a0, -64(s0)
	addi	a0, a0, 1
	sw	a0, -64(s0)
	j	.LBB0_29
.LBB0_36:
	j	.LBB0_39
.LBB0_37:
	lui	a0, %hi(buffer)
	addi	a0, a0, %lo(buffer)
	sw	a0, -128(s0)
	call	gets
	lw	a1, -128(s0)
	sw	a0, -132(s0)
	mv	a0, a1
	call	puts
	lw	a0, -128(s0)
	call	gets
	lw	a1, -128(s0)
	sw	a0, -136(s0)
	mv	a0, a1
	call	puts
	j	.LBB0_39
.LBB0_38:
	j	.LBB0_39
.LBB0_39:
	lw	s0, 136(sp)
	lw	ra, 140(sp)
	addi	sp, sp, 144
	ret
.Lfunc_end0:
	.size	run_operation, .Lfunc_end0-run_operation
                                        # -- End function
	.globl	_start                  # -- Begin function _start
	.p2align	2
	.type	_start,@function
_start:                                 # @_start
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	lui	a0, %hi(buffer)
	addi	a0, a0, %lo(buffer)
	call	gets
	call	atoi
	sw	a0, -12(s0)
	lw	a0, -12(s0)
	call	run_operation
	mv	a0, zero
	call	exit
.Lfunc_end1:
	.size	_start, .Lfunc_end1-_start
                                        # -- End function
	.type	number,@object          # @number
	.section	.sdata,"aw",@progbits
	.globl	number
	.p2align	2
number:
	.word	635                     # 0x27b
	.size	number, 4

	.type	buffer,@object          # @buffer
	.comm	buffer,100,1
	.type	img,@object             # @img
	.comm	img,40000,1
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym run_operation
	.addrsig_sym puts
	.addrsig_sym gets
	.addrsig_sym itoa
	.addrsig_sym atoi
	.addrsig_sym time
	.addrsig_sym sleep
	.addrsig_sym approx_sqrt
	.addrsig_sym getPosition
	.addrsig_sym imageFilter
	.addrsig_sym exit
	.addrsig_sym number
	.addrsig_sym buffer
	.addrsig_sym img
