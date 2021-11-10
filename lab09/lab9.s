	.text
	.file	"lab9.c"
	.globl	sleep                   # -- Begin function sleep
	.p2align	2
	.type	sleep,@function
sleep:                                  # @sleep
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lui	a0, %hi(_system_time)
	lw	a0, %lo(_system_time)(a0)
	sw	a0, -16(s0)
	j	.LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	lui	a0, %hi(_system_time)
	lw	a0, %lo(_system_time)(a0)
	lw	a1, -16(s0)
	sub	a0, a0, a1
	lw	a1, -12(s0)
	bge	a0, a1, .LBB0_3
	j	.LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
	j	.LBB0_1
.LBB0_3:
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	sleep, .Lfunc_end0-sleep
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
	addi	a0, zero, 124
	sw	a0, -12(s0)
	addi	a0, zero, 960
	sw	a0, -16(s0)
	mv	a0, zero
	sw	a0, -20(s0)
	sw	a0, -24(s0)
	j	.LBB1_1
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	addi	a1, zero, 12
	blt	a1, a0, .LBB1_4
	j	.LBB1_2
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -24(s0)
	addi	a1, zero, 24
	mul	a0, a0, a1
	lui	a2, %hi(notas)
	addi	a2, a2, %lo(notas)
	add	a0, a0, a2
	lw	a3, 0(a0)
	lui	a4, 1
	addi	a4, a4, 1904
	mul	a3, a3, a4
	lw	a5, -12(s0)
	lw	a6, -16(s0)
	lui	a7, 419430
	addi	a7, a7, 1639
	mulh	a6, a6, a7
	srli	t0, a6, 31
	srai	a6, a6, 2
	add	a6, a6, t0
	mul	a5, a5, a6
	div	a3, a3, a5
	sw	a3, 0(a0)
	lw	a0, -24(s0)
	mul	a0, a0, a1
	add	a0, a2, a0
	lw	a1, 4(a0)
	mul	a1, a1, a4
	lw	a2, -12(s0)
	lw	a3, -16(s0)
	mulh	a3, a3, a7
	srli	a4, a3, 31
	srai	a3, a3, 2
	add	a3, a3, a4
	mul	a2, a2, a3
	div	a1, a1, a2
	sw	a1, 4(a0)
	j	.LBB1_3
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB1_1
.LBB1_4:
	j	.LBB1_5
.LBB1_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
	mv	a0, zero
	sw	a0, -20(s0)
	sw	a0, -28(s0)
	j	.LBB1_6
.LBB1_6:                                #   Parent Loop BB1_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a0, -28(s0)
	addi	a1, zero, 12
	blt	a1, a0, .LBB1_9
	j	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_6 Depth=2
	lw	a0, -28(s0)
	addi	a1, zero, 24
	mul	a0, a0, a1
	lui	a2, %hi(notas)
	addi	a2, a2, %lo(notas)
	add	a0, a0, a2
	lw	a0, 0(a0)
	lw	a3, -20(s0)
	sub	a0, a0, a3
	sw	a1, -32(s0)
	sw	a2, -36(s0)
	call	sleep
	lw	a0, -28(s0)
	lw	a1, -32(s0)
	mul	a0, a0, a1
	lw	a2, -36(s0)
	add	a0, a0, a2
	lw	a0, 0(a0)
	sw	a0, -20(s0)
	lw	a0, -28(s0)
	mul	a0, a0, a1
	add	a0, a0, a2
	lw	a3, 12(a0)
	slli	a4, a3, 2
	lui	a5, %hi(insts)
	addi	a5, a5, %lo(insts)
	add	a4, a4, a5
	lw	a1, 0(a4)
	lw	a2, 16(a0)
	lw	a4, 20(a0)
	lw	a5, 4(a0)
	lw	a0, 0(a0)
	sub	a0, a5, a0
	sw	a0, -40(s0)
	mv	a0, a3
	mv	a3, a4
	lw	a4, -40(s0)
	call	play_note
	j	.LBB1_8
.LBB1_8:                                #   in Loop: Header=BB1_6 Depth=2
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB1_6
.LBB1_9:                                #   in Loop: Header=BB1_5 Depth=1
	j	.LBB1_5
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
                                        # -- End function
	.type	insts,@object           # @insts
	.section	.rodata,"a",@progbits
	.globl	insts
	.p2align	2
insts:
	.word	0                       # 0x0
	.word	30                      # 0x1e
	.word	0                       # 0x0
	.word	30                      # 0x1e
	.word	0                       # 0x0
	.word	34                      # 0x22
	.word	0                       # 0x0
	.word	0                       # 0x0
	.word	0                       # 0x0
	.word	0                       # 0x0
	.word	30                      # 0x1e
	.size	insts, 44

	.type	notas,@object           # @notas
	.data
	.globl	notas
	.p2align	2
notas:
	.word	720                     # 0x2d0
	.word	840                     # 0x348
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	40                      # 0x28
	.word	95                      # 0x5f
	.word	960                     # 0x3c0
	.word	1080                    # 0x438
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	43                      # 0x2b
	.word	95                      # 0x5f
	.word	1320                    # 0x528
	.word	1440                    # 0x5a0
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	40                      # 0x28
	.word	95                      # 0x5f
	.word	1680                    # 0x690
	.word	1920                    # 0x780
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	38                      # 0x26
	.word	95                      # 0x5f
	.word	1920                    # 0x780
	.word	2880                    # 0xb40
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	36                      # 0x24
	.word	95                      # 0x5f
	.word	2880                    # 0xb40
	.word	3840                    # 0xf00
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	35                      # 0x23
	.word	95                      # 0x5f
	.word	3840                    # 0xf00
	.word	4560                    # 0x11d0
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	40                      # 0x28
	.word	95                      # 0x5f
	.word	4560                    # 0x11d0
	.word	4680                    # 0x1248
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	40                      # 0x28
	.word	95                      # 0x5f
	.word	4800                    # 0x12c0
	.word	4920                    # 0x1338
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	43                      # 0x2b
	.word	95                      # 0x5f
	.word	5160                    # 0x1428
	.word	5280                    # 0x14a0
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	40                      # 0x28
	.word	95                      # 0x5f
	.word	5520                    # 0x1590
	.word	5760                    # 0x1680
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	38                      # 0x26
	.word	95                      # 0x5f
	.word	5760                    # 0x1680
	.word	6720                    # 0x1a40
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	36                      # 0x24
	.word	95                      # 0x5f
	.word	6720                    # 0x1a40
	.word	7680                    # 0x1e00
	.word	4                       # 0x4
	.word	5                       # 0x5
	.word	35                      # 0x23
	.word	95                      # 0x5f
	.size	notas, 312

	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym sleep
	.addrsig_sym play_note
	.addrsig_sym _system_time
	.addrsig_sym insts
	.addrsig_sym notas
