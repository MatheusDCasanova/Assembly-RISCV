	.text
	.file	"conversor.c"
	.globl	read                    # -- Begin function read
	.p2align	2
	.type	read,@function
read:                                   # @read
.Lfunc_begin0:
	.file	1 "/home/matheus/Quarto_Semestre/MC404/Lab03" "conversor.c"
	.loc	1 2 0                   # conversor.c:2:0
	.cfi_sections .debug_frame
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
.Ltmp0:
	.loc	1 12 10 prologue_end    # conversor.c:12:10
	lw	a0, -12(s0)
	.loc	1 12 21 is_stmt 0       # conversor.c:12:21
	lw	a1, -16(s0)
	.loc	1 12 33                 # conversor.c:12:33
	lw	a2, -20(s0)
	.loc	1 4 3 is_stmt 1         # conversor.c:4:3
	sw	a0, -28(s0)
	sw	a1, -32(s0)
	sw	a2, -36(s0)
	lw	a3, -28(s0)
	lw	a4, -32(s0)
	lw	a5, -36(s0)
	#APP
	mv a0, a3           # file descriptor
mv a1, a4           # buffer 
mv a2, a5           # size 
li a7, 63           # syscall read (63) 
ecall 
mv a6, a0
	#NO_APP
	sw	a6, -24(s0)
	.loc	1 15 10                 # conversor.c:15:10
	lw	a0, -24(s0)
	.loc	1 15 3 is_stmt 0        # conversor.c:15:3
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Ltmp1:
.Lfunc_end0:
	.size	read, .Lfunc_end0-read
	.cfi_endproc
                                        # -- End function
	.globl	write                   # -- Begin function write
	.p2align	2
	.type	write,@function
write:                                  # @write
.Lfunc_begin1:
	.loc	1 18 0 is_stmt 1        # conversor.c:18:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
.Ltmp2:
	.loc	1 26 10 prologue_end    # conversor.c:26:10
	lw	a0, -12(s0)
	.loc	1 26 21 is_stmt 0       # conversor.c:26:21
	lw	a1, -16(s0)
	.loc	1 26 33                 # conversor.c:26:33
	lw	a2, -20(s0)
	.loc	1 19 3 is_stmt 1        # conversor.c:19:3
	sw	a0, -24(s0)
	sw	a1, -28(s0)
	sw	a2, -32(s0)
	lw	a3, -24(s0)
	lw	a4, -28(s0)
	lw	a5, -32(s0)
	#APP
	mv a0, a3           # file descriptor
mv a1, a4           # buffer 
mv a2, a5           # size 
li a7, 64           # syscall write (64) 
ecall
	#NO_APP
	.loc	1 29 1                  # conversor.c:29:1
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp3:
.Lfunc_end1:
	.size	write, .Lfunc_end1-write
	.cfi_endproc
                                        # -- End function
	.globl	tamanhoString           # -- Begin function tamanhoString
	.p2align	2
	.type	tamanhoString,@function
tamanhoString:                          # @tamanhoString
.Lfunc_begin2:
	.loc	1 31 0                  # conversor.c:31:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	mv	a0, zero
.Ltmp4:
	.loc	1 33 7 prologue_end     # conversor.c:33:7
	sw	a0, -16(s0)
.Ltmp5:
	.loc	1 35 12                 # conversor.c:35:12
	sw	a0, -20(s0)
	.loc	1 35 8 is_stmt 0        # conversor.c:35:8
	j	.LBB2_1
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp6:
	.loc	1 35 19                 # conversor.c:35:19
	lw	a0, -12(s0)
	.loc	1 35 26                 # conversor.c:35:26
	lw	a1, -20(s0)
	.loc	1 35 19                 # conversor.c:35:19
	add	a0, a0, a1
	lbu	a0, 0(a0)
	mv	a1, zero
.Ltmp7:
	.loc	1 35 3                  # conversor.c:35:3
	beq	a0, a1, .LBB2_4
	j	.LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
.Ltmp8:
	.loc	1 36 13 is_stmt 1       # conversor.c:36:13
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	.loc	1 37 3                  # conversor.c:37:3
	j	.LBB2_3
.Ltmp9:
.LBB2_3:                                #   in Loop: Header=BB2_1 Depth=1
	.loc	1 35 39                 # conversor.c:35:39
	lw	a0, -20(s0)
	addi	a0, a0, 1
	sw	a0, -20(s0)
	.loc	1 35 3 is_stmt 0        # conversor.c:35:3
	j	.LBB2_1
.Ltmp10:
.LBB2_4:
	.loc	1 39 10 is_stmt 1       # conversor.c:39:10
	lw	a0, -16(s0)
	.loc	1 39 3 is_stmt 0        # conversor.c:39:3
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp11:
.Lfunc_end2:
	.size	tamanhoString, .Lfunc_end2-tamanhoString
	.cfi_endproc
                                        # -- End function
	.globl	potencializar           # -- Begin function potencializar
	.p2align	2
	.type	potencializar,@function
potencializar:                          # @potencializar
.Lfunc_begin3:
	.loc	1 42 0 is_stmt 1        # conversor.c:42:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -16(s0)
	sw	a1, -20(s0)
.Ltmp12:
	.loc	1 43 7 prologue_end     # conversor.c:43:7
	lw	a0, -20(s0)
	mv	a1, zero
.Ltmp13:
	.loc	1 43 7 is_stmt 0        # conversor.c:43:7
	bne	a0, a1, .LBB3_2
	j	.LBB3_1
.LBB3_1:
	.loc	1 0 7                   # conversor.c:0:7
	addi	a0, zero, 1
.Ltmp14:
	.loc	1 44 5 is_stmt 1        # conversor.c:44:5
	sw	a0, -12(s0)
	j	.LBB3_3
.Ltmp15:
.LBB3_2:
	.loc	1 47 10                 # conversor.c:47:10
	lw	a0, -16(s0)
	.loc	1 47 41 is_stmt 0       # conversor.c:47:41
	lw	a1, -20(s0)
	.loc	1 47 50                 # conversor.c:47:50
	addi	a1, a1, -1
	.loc	1 47 19                 # conversor.c:47:19
	sw	a0, -24(s0)
	call	potencializar
	.loc	1 47 17                 # conversor.c:47:17
	lw	a1, -24(s0)
	mul	a0, a1, a0
	.loc	1 47 3                  # conversor.c:47:3
	sw	a0, -12(s0)
	j	.LBB3_3
.LBB3_3:
	.loc	1 48 1 is_stmt 1        # conversor.c:48:1
	lw	a0, -12(s0)
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp16:
.Lfunc_end3:
	.size	potencializar, .Lfunc_end3-potencializar
	.cfi_endproc
                                        # -- End function
	.globl	converterUIntParaString # -- Begin function converterUIntParaString
	.p2align	2
	.type	converterUIntParaString,@function
converterUIntParaString:                # @converterUIntParaString
.Lfunc_begin4:
	.loc	1 50 0                  # conversor.c:50:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -128
	.cfi_def_cfa_offset 128
	sw	ra, 124(sp)
	sw	s0, 120(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 128
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
.Ltmp17:
	.loc	1 52 22 prologue_end    # conversor.c:52:22
	lw	a0, -12(s0)
	.loc	1 52 16 is_stmt 0       # conversor.c:52:16
	sw	a0, -52(s0)
	mv	a0, zero
	.loc	1 53 7 is_stmt 1        # conversor.c:53:7
	sw	a0, -56(s0)
	.loc	1 54 3                  # conversor.c:54:3
	j	.LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	.loc	1 54 10 is_stmt 0       # conversor.c:54:10
	lw	a0, -52(s0)
	mv	a1, zero
	.loc	1 54 3                  # conversor.c:54:3
	beq	a0, a1, .LBB4_3
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
.Ltmp18:
	.loc	1 56 29 is_stmt 1       # conversor.c:56:29
	lw	a0, -52(s0)
	lui	a1, 838861
	addi	a1, a1, -819
	.loc	1 56 33 is_stmt 0       # conversor.c:56:33
	mulhu	a2, a0, a1
	srli	a2, a2, 3
	addi	a3, zero, 10
	mul	a2, a2, a3
	sub	a0, a0, a2
	.loc	1 56 39                 # conversor.c:56:39
	ori	a0, a0, 48
	.loc	1 56 23                 # conversor.c:56:23
	lw	a2, -56(s0)
	addi	a3, s0, -48
	.loc	1 56 5                  # conversor.c:56:5
	add	a2, a3, a2
	.loc	1 56 26                 # conversor.c:56:26
	sb	a0, 0(a2)
	.loc	1 58 11 is_stmt 1       # conversor.c:58:11
	lw	a0, -52(s0)
	.loc	1 58 15 is_stmt 0       # conversor.c:58:15
	mulhu	a0, a0, a1
	srli	a0, a0, 3
	.loc	1 58 9                  # conversor.c:58:9
	sw	a0, -52(s0)
	.loc	1 59 6 is_stmt 1        # conversor.c:59:6
	lw	a0, -56(s0)
	addi	a0, a0, 1
	sw	a0, -56(s0)
.Ltmp19:
	.loc	1 54 3                  # conversor.c:54:3
	j	.LBB4_1
.LBB4_3:
	.loc	1 61 21                 # conversor.c:61:21
	lw	a0, -56(s0)
	addi	a1, s0, -48
	.loc	1 61 3 is_stmt 0        # conversor.c:61:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 61 24                 # conversor.c:61:24
	sb	a2, 0(a0)
	.loc	1 66 7 is_stmt 1        # conversor.c:66:7
	sw	a2, -96(s0)
	.loc	1 68 17                 # conversor.c:68:17
	mv	a0, a1
	call	tamanhoString
	.loc	1 68 7 is_stmt 0        # conversor.c:68:7
	sw	a0, -100(s0)
.Ltmp20:
	.loc	1 70 16 is_stmt 1       # conversor.c:70:16
	lw	a0, -100(s0)
	.loc	1 70 24 is_stmt 0       # conversor.c:70:24
	addi	a0, a0, -1
	.loc	1 70 12                 # conversor.c:70:12
	sw	a0, -104(s0)
	.loc	1 70 8                  # conversor.c:70:8
	j	.LBB4_4
.LBB4_4:                                # =>This Inner Loop Header: Depth=1
.Ltmp21:
	.loc	1 70 29                 # conversor.c:70:29
	lw	a0, -104(s0)
	mv	a1, zero
.Ltmp22:
	.loc	1 70 3                  # conversor.c:70:3
	blt	a0, a1, .LBB4_7
	j	.LBB4_5
.LBB4_5:                                #   in Loop: Header=BB4_4 Depth=1
.Ltmp23:
	.loc	1 71 41 is_stmt 1       # conversor.c:71:41
	lw	a0, -104(s0)
	addi	a1, s0, -48
	.loc	1 71 23 is_stmt 0       # conversor.c:71:23
	add	a0, a1, a0
	lb	a0, 0(a0)
	.loc	1 71 13                 # conversor.c:71:13
	lw	a1, -96(s0)
	addi	a2, s0, -92
	.loc	1 71 5                  # conversor.c:71:5
	add	a1, a2, a1
	.loc	1 71 21                 # conversor.c:71:21
	sb	a0, 0(a1)
	.loc	1 72 11 is_stmt 1       # conversor.c:72:11
	lw	a0, -96(s0)
	addi	a0, a0, 1
	sw	a0, -96(s0)
	.loc	1 73 3                  # conversor.c:73:3
	j	.LBB4_6
.Ltmp24:
.LBB4_6:                                #   in Loop: Header=BB4_4 Depth=1
	.loc	1 70 38                 # conversor.c:70:38
	lw	a0, -104(s0)
	addi	a0, a0, -1
	sw	a0, -104(s0)
	.loc	1 70 3 is_stmt 0        # conversor.c:70:3
	j	.LBB4_4
.Ltmp25:
.LBB4_7:
	.loc	1 75 11 is_stmt 1       # conversor.c:75:11
	lw	a0, -96(s0)
	addi	a1, s0, -92
	.loc	1 75 3 is_stmt 0        # conversor.c:75:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 75 19                 # conversor.c:75:19
	sb	a2, 0(a0)
	.loc	1 77 21 is_stmt 1       # conversor.c:77:21
	mv	a0, a1
	sw	a1, -108(s0)
	call	tamanhoString
	addi	a1, zero, 1
	.loc	1 77 3 is_stmt 0        # conversor.c:77:3
	sw	a0, -112(s0)
	mv	a0, a1
	lw	a2, -108(s0)
	sw	a1, -116(s0)
	mv	a1, a2
	lw	a2, -112(s0)
	call	write
	.loc	1 78 3 is_stmt 1        # conversor.c:78:3
	lui	a0, %hi(.L.str)
	addi	a1, a0, %lo(.L.str)
	lw	a0, -116(s0)
	lw	a2, -116(s0)
	call	write
	.loc	1 80 1                  # conversor.c:80:1
	lw	s0, 120(sp)
	lw	ra, 124(sp)
	addi	sp, sp, 128
	ret
.Ltmp26:
.Lfunc_end4:
	.size	converterUIntParaString, .Lfunc_end4-converterUIntParaString
	.cfi_endproc
                                        # -- End function
	.globl	converterIntParaString  # -- Begin function converterIntParaString
	.p2align	2
	.type	converterIntParaString,@function
converterIntParaString:                 # @converterIntParaString
.Lfunc_begin5:
	.loc	1 82 0                  # conversor.c:82:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -144
	.cfi_def_cfa_offset 144
	sw	ra, 140(sp)
	sw	s0, 136(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 144
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
.Ltmp27:
	.loc	1 84 13 prologue_end    # conversor.c:84:13
	lw	a0, -12(s0)
	.loc	1 84 7 is_stmt 0        # conversor.c:84:7
	sw	a0, -52(s0)
	.loc	1 85 23 is_stmt 1       # conversor.c:85:23
	lw	a0, -12(s0)
	.loc	1 85 16 is_stmt 0       # conversor.c:85:16
	sw	a0, -56(s0)
	mv	a0, zero
	.loc	1 86 7 is_stmt 1        # conversor.c:86:7
	sw	a0, -60(s0)
	.loc	1 87 7                  # conversor.c:87:7
	sw	a0, -64(s0)
.Ltmp28:
	.loc	1 89 7                  # conversor.c:89:7
	lw	a0, -52(s0)
	addi	a1, zero, -1
.Ltmp29:
	.loc	1 89 7 is_stmt 0        # conversor.c:89:7
	blt	a1, a0, .LBB5_2
	j	.LBB5_1
.LBB5_1:
	.loc	1 0 7                   # conversor.c:0:7
	addi	a0, zero, 1
.Ltmp30:
	.loc	1 90 17 is_stmt 1       # conversor.c:90:17
	sw	a0, -64(s0)
	.loc	1 91 11                 # conversor.c:91:11
	lw	a0, -52(s0)
	mv	a1, zero
	.loc	1 91 15 is_stmt 0       # conversor.c:91:15
	sub	a0, a1, a0
	.loc	1 91 9                  # conversor.c:91:9
	sw	a0, -52(s0)
	.loc	1 92 3 is_stmt 1        # conversor.c:92:3
	j	.LBB5_2
.Ltmp31:
.LBB5_2:
	.loc	1 95 7                  # conversor.c:95:7
	lw	a0, -52(s0)
	addi	a1, zero, -1
.Ltmp32:
	.loc	1 95 7 is_stmt 0        # conversor.c:95:7
	blt	a1, a0, .LBB5_7
	j	.LBB5_3
.LBB5_3:
.Ltmp33:
	.loc	1 96 5 is_stmt 1        # conversor.c:96:5
	j	.LBB5_4
.LBB5_4:                                # =>This Inner Loop Header: Depth=1
	.loc	1 96 12 is_stmt 0       # conversor.c:96:12
	lw	a0, -56(s0)
	mv	a1, zero
	.loc	1 96 5                  # conversor.c:96:5
	beq	a0, a1, .LBB5_6
	j	.LBB5_5
.LBB5_5:                                #   in Loop: Header=BB5_4 Depth=1
.Ltmp34:
	.loc	1 97 31 is_stmt 1       # conversor.c:97:31
	lw	a0, -56(s0)
	lui	a1, 838861
	addi	a1, a1, -819
	.loc	1 97 36 is_stmt 0       # conversor.c:97:36
	mulhu	a2, a0, a1
	srli	a2, a2, 3
	addi	a3, zero, 10
	mul	a2, a2, a3
	sub	a0, a0, a2
	.loc	1 97 42                 # conversor.c:97:42
	ori	a0, a0, 48
	.loc	1 97 25                 # conversor.c:97:25
	lw	a2, -60(s0)
	addi	a3, s0, -48
	.loc	1 97 7                  # conversor.c:97:7
	add	a2, a3, a2
	.loc	1 97 28                 # conversor.c:97:28
	sb	a0, 0(a2)
	.loc	1 98 14 is_stmt 1       # conversor.c:98:14
	lw	a0, -56(s0)
	.loc	1 98 19 is_stmt 0       # conversor.c:98:19
	mulhu	a0, a0, a1
	srli	a0, a0, 3
	.loc	1 98 12                 # conversor.c:98:12
	sw	a0, -56(s0)
	.loc	1 99 8 is_stmt 1        # conversor.c:99:8
	lw	a0, -60(s0)
	addi	a0, a0, 1
	sw	a0, -60(s0)
.Ltmp35:
	.loc	1 96 5                  # conversor.c:96:5
	j	.LBB5_4
.LBB5_6:
	.loc	1 101 3                 # conversor.c:101:3
	j	.LBB5_11
.Ltmp36:
.LBB5_7:
	.loc	1 102 5                 # conversor.c:102:5
	j	.LBB5_8
.LBB5_8:                                # =>This Inner Loop Header: Depth=1
	.loc	1 102 12 is_stmt 0      # conversor.c:102:12
	lw	a0, -52(s0)
	mv	a1, zero
	.loc	1 102 5                 # conversor.c:102:5
	beq	a0, a1, .LBB5_10
	j	.LBB5_9
.LBB5_9:                                #   in Loop: Header=BB5_8 Depth=1
.Ltmp37:
	.loc	1 103 31 is_stmt 1      # conversor.c:103:31
	lw	a0, -52(s0)
	lui	a1, 419430
	addi	a1, a1, 1639
	.loc	1 103 35 is_stmt 0      # conversor.c:103:35
	mulh	a2, a0, a1
	srli	a3, a2, 31
	srli	a2, a2, 2
	add	a2, a2, a3
	addi	a3, zero, 10
	mul	a2, a2, a3
	sub	a0, a0, a2
	.loc	1 103 41                # conversor.c:103:41
	addi	a0, a0, 48
	.loc	1 103 25                # conversor.c:103:25
	lw	a2, -60(s0)
	addi	a3, s0, -48
	.loc	1 103 7                 # conversor.c:103:7
	add	a2, a3, a2
	.loc	1 103 28                # conversor.c:103:28
	sb	a0, 0(a2)
	.loc	1 104 13 is_stmt 1      # conversor.c:104:13
	lw	a0, -52(s0)
	.loc	1 104 17 is_stmt 0      # conversor.c:104:17
	mulh	a0, a0, a1
	srli	a1, a0, 31
	srai	a0, a0, 2
	add	a0, a0, a1
	.loc	1 104 11                # conversor.c:104:11
	sw	a0, -52(s0)
	.loc	1 105 8 is_stmt 1       # conversor.c:105:8
	lw	a0, -60(s0)
	addi	a0, a0, 1
	sw	a0, -60(s0)
.Ltmp38:
	.loc	1 102 5                 # conversor.c:102:5
	j	.LBB5_8
.Ltmp39:
.LBB5_10:
	.loc	1 0 5 is_stmt 0         # conversor.c:0:5
	j	.LBB5_11
.LBB5_11:
	.loc	1 109 21 is_stmt 1      # conversor.c:109:21
	lw	a0, -60(s0)
	addi	a1, s0, -48
	.loc	1 109 3 is_stmt 0       # conversor.c:109:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 109 24                # conversor.c:109:24
	sb	a2, 0(a0)
	.loc	1 115 7 is_stmt 1       # conversor.c:115:7
	sw	a2, -104(s0)
	.loc	1 117 17                # conversor.c:117:17
	mv	a0, a1
	sw	a2, -120(s0)
	call	tamanhoString
	.loc	1 117 7 is_stmt 0       # conversor.c:117:7
	sw	a0, -108(s0)
.Ltmp40:
	.loc	1 118 8 is_stmt 1       # conversor.c:118:8
	lw	a0, -64(s0)
.Ltmp41:
	.loc	1 118 7 is_stmt 0       # conversor.c:118:7
	lw	a1, -120(s0)
	bne	a0, a1, .LBB5_17
	j	.LBB5_12
.LBB5_12:
.Ltmp42:
	.loc	1 119 18 is_stmt 1      # conversor.c:119:18
	lw	a0, -108(s0)
	.loc	1 119 26 is_stmt 0      # conversor.c:119:26
	addi	a0, a0, -1
	.loc	1 119 14                # conversor.c:119:14
	sw	a0, -112(s0)
	.loc	1 119 10                # conversor.c:119:10
	j	.LBB5_13
.LBB5_13:                               # =>This Inner Loop Header: Depth=1
.Ltmp43:
	.loc	1 119 31                # conversor.c:119:31
	lw	a0, -112(s0)
	mv	a1, zero
.Ltmp44:
	.loc	1 119 5                 # conversor.c:119:5
	blt	a0, a1, .LBB5_16
	j	.LBB5_14
.LBB5_14:                               #   in Loop: Header=BB5_13 Depth=1
.Ltmp45:
	.loc	1 120 43 is_stmt 1      # conversor.c:120:43
	lw	a0, -112(s0)
	addi	a1, s0, -48
	.loc	1 120 25 is_stmt 0      # conversor.c:120:25
	add	a0, a1, a0
	lb	a0, 0(a0)
	.loc	1 120 15                # conversor.c:120:15
	lw	a1, -104(s0)
	addi	a2, s0, -100
	.loc	1 120 7                 # conversor.c:120:7
	add	a1, a2, a1
	.loc	1 120 23                # conversor.c:120:23
	sb	a0, 0(a1)
	.loc	1 121 13 is_stmt 1      # conversor.c:121:13
	lw	a0, -104(s0)
	addi	a0, a0, 1
	sw	a0, -104(s0)
	.loc	1 122 5                 # conversor.c:122:5
	j	.LBB5_15
.Ltmp46:
.LBB5_15:                               #   in Loop: Header=BB5_13 Depth=1
	.loc	1 119 40                # conversor.c:119:40
	lw	a0, -112(s0)
	addi	a0, a0, -1
	sw	a0, -112(s0)
	.loc	1 119 5 is_stmt 0       # conversor.c:119:5
	j	.LBB5_13
.Ltmp47:
.LBB5_16:
	.loc	1 123 3 is_stmt 1       # conversor.c:123:3
	j	.LBB5_22
.Ltmp48:
.LBB5_17:
	.loc	1 0 3 is_stmt 0         # conversor.c:0:3
	addi	a0, zero, 1
.Ltmp49:
	.loc	1 124 12 is_stmt 1      # conversor.c:124:12
	sw	a0, -104(s0)
	addi	a0, zero, 45
	.loc	1 125 16                # conversor.c:125:16
	sb	a0, -100(s0)
.Ltmp50:
	.loc	1 126 18                # conversor.c:126:18
	lw	a0, -108(s0)
	.loc	1 126 26 is_stmt 0      # conversor.c:126:26
	addi	a0, a0, -1
	.loc	1 126 14                # conversor.c:126:14
	sw	a0, -116(s0)
	.loc	1 126 10                # conversor.c:126:10
	j	.LBB5_18
.LBB5_18:                               # =>This Inner Loop Header: Depth=1
.Ltmp51:
	.loc	1 126 31                # conversor.c:126:31
	lw	a0, -116(s0)
	mv	a1, zero
.Ltmp52:
	.loc	1 126 5                 # conversor.c:126:5
	blt	a0, a1, .LBB5_21
	j	.LBB5_19
.LBB5_19:                               #   in Loop: Header=BB5_18 Depth=1
.Ltmp53:
	.loc	1 127 43 is_stmt 1      # conversor.c:127:43
	lw	a0, -116(s0)
	addi	a1, s0, -48
	.loc	1 127 25 is_stmt 0      # conversor.c:127:25
	add	a0, a1, a0
	lb	a0, 0(a0)
	.loc	1 127 15                # conversor.c:127:15
	lw	a1, -104(s0)
	addi	a2, s0, -100
	.loc	1 127 7                 # conversor.c:127:7
	add	a1, a2, a1
	.loc	1 127 23                # conversor.c:127:23
	sb	a0, 0(a1)
	.loc	1 128 13 is_stmt 1      # conversor.c:128:13
	lw	a0, -104(s0)
	addi	a0, a0, 1
	sw	a0, -104(s0)
	.loc	1 129 5                 # conversor.c:129:5
	j	.LBB5_20
.Ltmp54:
.LBB5_20:                               #   in Loop: Header=BB5_18 Depth=1
	.loc	1 126 40                # conversor.c:126:40
	lw	a0, -116(s0)
	addi	a0, a0, -1
	sw	a0, -116(s0)
	.loc	1 126 5 is_stmt 0       # conversor.c:126:5
	j	.LBB5_18
.Ltmp55:
.LBB5_21:
	.loc	1 0 5                   # conversor.c:0:5
	j	.LBB5_22
.LBB5_22:
	.loc	1 132 11 is_stmt 1      # conversor.c:132:11
	lw	a0, -104(s0)
	addi	a1, s0, -100
	.loc	1 132 3 is_stmt 0       # conversor.c:132:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 132 19                # conversor.c:132:19
	sb	a2, 0(a0)
	.loc	1 134 21 is_stmt 1      # conversor.c:134:21
	mv	a0, a1
	sw	a1, -124(s0)
	call	tamanhoString
	addi	a1, zero, 1
	.loc	1 134 3 is_stmt 0       # conversor.c:134:3
	sw	a0, -128(s0)
	mv	a0, a1
	lw	a2, -124(s0)
	sw	a1, -132(s0)
	mv	a1, a2
	lw	a2, -128(s0)
	call	write
	.loc	1 135 3 is_stmt 1       # conversor.c:135:3
	lui	a0, %hi(.L.str)
	addi	a1, a0, %lo(.L.str)
	lw	a0, -132(s0)
	lw	a2, -132(s0)
	call	write
	.loc	1 137 1                 # conversor.c:137:1
	lw	s0, 136(sp)
	lw	ra, 140(sp)
	addi	sp, sp, 144
	ret
.Ltmp56:
.Lfunc_end5:
	.size	converterIntParaString, .Lfunc_end5-converterIntParaString
	.cfi_endproc
                                        # -- End function
	.globl	converterDecimalParaInt # -- Begin function converterDecimalParaInt
	.p2align	2
	.type	converterDecimalParaInt,@function
converterDecimalParaInt:                # @converterDecimalParaInt
.Lfunc_begin6:
	.loc	1 139 0                 # conversor.c:139:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 48
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	mv	a0, zero
.Ltmp57:
	.loc	1 140 7 prologue_end    # conversor.c:140:7
	sw	a0, -20(s0)
.Ltmp58:
	.loc	1 142 7                 # conversor.c:142:7
	lw	a0, -12(s0)
	lbu	a0, 0(a0)
	addi	a1, zero, 45
.Ltmp59:
	.loc	1 142 7 is_stmt 0       # conversor.c:142:7
	bne	a0, a1, .LBB6_6
	j	.LBB6_1
.LBB6_1:
	.loc	1 0 7                   # conversor.c:0:7
	addi	a0, zero, 1
.Ltmp60:
	.loc	1 143 14 is_stmt 1      # conversor.c:143:14
	sw	a0, -24(s0)
	.loc	1 143 10 is_stmt 0      # conversor.c:143:10
	j	.LBB6_2
.LBB6_2:                                # =>This Inner Loop Header: Depth=1
.Ltmp61:
	.loc	1 143 21                # conversor.c:143:21
	lw	a0, -24(s0)
	.loc	1 143 25                # conversor.c:143:25
	lw	a1, -16(s0)
.Ltmp62:
	.loc	1 143 5                 # conversor.c:143:5
	bge	a0, a1, .LBB6_5
	j	.LBB6_3
.LBB6_3:                                #   in Loop: Header=BB6_2 Depth=1
.Ltmp63:
	.loc	1 144 19 is_stmt 1      # conversor.c:144:19
	lw	a0, -12(s0)
	.loc	1 144 23 is_stmt 0      # conversor.c:144:23
	lw	a1, -24(s0)
	.loc	1 144 19                # conversor.c:144:19
	add	a0, a0, a1
	lbu	a0, 0(a0)
	.loc	1 144 26                # conversor.c:144:26
	addi	a0, a0, -48
	.loc	1 144 52                # conversor.c:144:52
	lw	a2, -16(s0)
	.loc	1 144 64                # conversor.c:144:64
	not	a1, a1
	add	a1, a1, a2
	addi	a2, zero, 10
	.loc	1 144 34                # conversor.c:144:34
	sw	a0, -32(s0)
	mv	a0, a2
	call	potencializar
	.loc	1 144 32                # conversor.c:144:32
	lw	a1, -32(s0)
	mul	a0, a1, a0
	.loc	1 144 15                # conversor.c:144:15
	lw	a1, -20(s0)
	add	a0, a1, a0
	sw	a0, -20(s0)
	.loc	1 145 5 is_stmt 1       # conversor.c:145:5
	j	.LBB6_4
.Ltmp64:
.LBB6_4:                                #   in Loop: Header=BB6_2 Depth=1
	.loc	1 143 35                # conversor.c:143:35
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	.loc	1 143 5 is_stmt 0       # conversor.c:143:5
	j	.LBB6_2
.Ltmp65:
.LBB6_5:
	.loc	1 146 15 is_stmt 1      # conversor.c:146:15
	lw	a0, -20(s0)
	mv	a1, zero
	.loc	1 146 23 is_stmt 0      # conversor.c:146:23
	sub	a0, a1, a0
	.loc	1 146 13                # conversor.c:146:13
	sw	a0, -20(s0)
	.loc	1 147 3 is_stmt 1       # conversor.c:147:3
	j	.LBB6_11
.Ltmp66:
.LBB6_6:
	.loc	1 0 3 is_stmt 0         # conversor.c:0:3
	mv	a0, zero
.Ltmp67:
	.loc	1 148 14 is_stmt 1      # conversor.c:148:14
	sw	a0, -28(s0)
	.loc	1 148 10 is_stmt 0      # conversor.c:148:10
	j	.LBB6_7
.LBB6_7:                                # =>This Inner Loop Header: Depth=1
.Ltmp68:
	.loc	1 148 21                # conversor.c:148:21
	lw	a0, -28(s0)
	.loc	1 148 25                # conversor.c:148:25
	lw	a1, -16(s0)
.Ltmp69:
	.loc	1 148 5                 # conversor.c:148:5
	bge	a0, a1, .LBB6_10
	j	.LBB6_8
.LBB6_8:                                #   in Loop: Header=BB6_7 Depth=1
.Ltmp70:
	.loc	1 149 19 is_stmt 1      # conversor.c:149:19
	lw	a0, -12(s0)
	.loc	1 149 23 is_stmt 0      # conversor.c:149:23
	lw	a1, -28(s0)
	.loc	1 149 19                # conversor.c:149:19
	add	a0, a0, a1
	lbu	a0, 0(a0)
	.loc	1 149 26                # conversor.c:149:26
	addi	a0, a0, -48
	.loc	1 149 52                # conversor.c:149:52
	lw	a2, -16(s0)
	.loc	1 149 64                # conversor.c:149:64
	not	a1, a1
	add	a1, a1, a2
	addi	a2, zero, 10
	.loc	1 149 34                # conversor.c:149:34
	sw	a0, -36(s0)
	mv	a0, a2
	call	potencializar
	.loc	1 149 32                # conversor.c:149:32
	lw	a1, -36(s0)
	mul	a0, a1, a0
	.loc	1 149 15                # conversor.c:149:15
	lw	a1, -20(s0)
	add	a0, a1, a0
	sw	a0, -20(s0)
	.loc	1 150 5 is_stmt 1       # conversor.c:150:5
	j	.LBB6_9
.Ltmp71:
.LBB6_9:                                #   in Loop: Header=BB6_7 Depth=1
	.loc	1 148 35                # conversor.c:148:35
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	.loc	1 148 5 is_stmt 0       # conversor.c:148:5
	j	.LBB6_7
.Ltmp72:
.LBB6_10:
	.loc	1 0 5                   # conversor.c:0:5
	j	.LBB6_11
.LBB6_11:
	.loc	1 153 10 is_stmt 1      # conversor.c:153:10
	lw	a0, -20(s0)
	.loc	1 153 3 is_stmt 0       # conversor.c:153:3
	lw	s0, 40(sp)
	lw	ra, 44(sp)
	addi	sp, sp, 48
	ret
.Ltmp73:
.Lfunc_end6:
	.size	converterDecimalParaInt, .Lfunc_end6-converterDecimalParaInt
	.cfi_endproc
                                        # -- End function
	.globl	converterHexadecimalParaIntDecimal # -- Begin function converterHexadecimalParaIntDecimal
	.p2align	2
	.type	converterHexadecimalParaIntDecimal,@function
converterHexadecimalParaIntDecimal:     # @converterHexadecimalParaIntDecimal
.Lfunc_begin7:
	.loc	1 156 0 is_stmt 1       # conversor.c:156:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	mv	a0, zero
.Ltmp74:
	.loc	1 157 7 prologue_end    # conversor.c:157:7
	sw	a0, -20(s0)
	addi	a0, zero, 2
.Ltmp75:
	.loc	1 159 12                # conversor.c:159:12
	sw	a0, -24(s0)
	.loc	1 159 8 is_stmt 0       # conversor.c:159:8
	j	.LBB7_1
.LBB7_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp76:
	.loc	1 159 19                # conversor.c:159:19
	lw	a0, -24(s0)
	.loc	1 159 23                # conversor.c:159:23
	lw	a1, -16(s0)
.Ltmp77:
	.loc	1 159 3                 # conversor.c:159:3
	bge	a0, a1, .LBB7_7
	j	.LBB7_2
.LBB7_2:                                #   in Loop: Header=BB7_1 Depth=1
.Ltmp78:
	.loc	1 160 9 is_stmt 1       # conversor.c:160:9
	lw	a0, -12(s0)
	.loc	1 160 13 is_stmt 0      # conversor.c:160:13
	lw	a1, -24(s0)
	.loc	1 160 9                 # conversor.c:160:9
	add	a0, a0, a1
	lbu	a0, 0(a0)
	addi	a1, zero, 59
.Ltmp79:
	.loc	1 160 9                 # conversor.c:160:9
	blt	a1, a0, .LBB7_4
	j	.LBB7_3
.LBB7_3:                                #   in Loop: Header=BB7_1 Depth=1
.Ltmp80:
	.loc	1 161 19 is_stmt 1      # conversor.c:161:19
	lw	a0, -12(s0)
	.loc	1 161 23 is_stmt 0      # conversor.c:161:23
	lw	a1, -24(s0)
	.loc	1 161 19                # conversor.c:161:19
	add	a0, a0, a1
	lbu	a0, 0(a0)
	.loc	1 161 26                # conversor.c:161:26
	addi	a0, a0, -48
	.loc	1 161 52                # conversor.c:161:52
	lw	a2, -16(s0)
	.loc	1 161 64                # conversor.c:161:64
	not	a1, a1
	add	a1, a1, a2
	addi	a2, zero, 16
	.loc	1 161 34                # conversor.c:161:34
	sw	a0, -28(s0)
	mv	a0, a2
	call	potencializar
	.loc	1 161 32                # conversor.c:161:32
	lw	a1, -28(s0)
	mul	a0, a1, a0
	.loc	1 161 15                # conversor.c:161:15
	lw	a1, -20(s0)
	add	a0, a1, a0
	sw	a0, -20(s0)
	.loc	1 162 5 is_stmt 1       # conversor.c:162:5
	j	.LBB7_5
.Ltmp81:
.LBB7_4:                                #   in Loop: Header=BB7_1 Depth=1
	.loc	1 163 19                # conversor.c:163:19
	lw	a0, -12(s0)
	.loc	1 163 23 is_stmt 0      # conversor.c:163:23
	lw	a1, -24(s0)
	.loc	1 163 19                # conversor.c:163:19
	add	a0, a0, a1
	lbu	a0, 0(a0)
	.loc	1 163 26                # conversor.c:163:26
	addi	a0, a0, -87
	.loc	1 163 52                # conversor.c:163:52
	lw	a2, -16(s0)
	.loc	1 163 64                # conversor.c:163:64
	not	a1, a1
	add	a1, a1, a2
	addi	a2, zero, 16
	.loc	1 163 34                # conversor.c:163:34
	sw	a0, -32(s0)
	mv	a0, a2
	call	potencializar
	.loc	1 163 32                # conversor.c:163:32
	lw	a1, -32(s0)
	mul	a0, a1, a0
	.loc	1 163 15                # conversor.c:163:15
	lw	a1, -20(s0)
	add	a0, a1, a0
	sw	a0, -20(s0)
	j	.LBB7_5
.Ltmp82:
.LBB7_5:                                #   in Loop: Header=BB7_1 Depth=1
	.loc	1 165 3 is_stmt 1       # conversor.c:165:3
	j	.LBB7_6
.Ltmp83:
.LBB7_6:                                #   in Loop: Header=BB7_1 Depth=1
	.loc	1 159 33                # conversor.c:159:33
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	.loc	1 159 3 is_stmt 0       # conversor.c:159:3
	j	.LBB7_1
.Ltmp84:
.LBB7_7:
	.loc	1 167 10 is_stmt 1      # conversor.c:167:10
	lw	a0, -20(s0)
	.loc	1 167 3 is_stmt 0       # conversor.c:167:3
	lw	s0, 24(sp)
	lw	ra, 28(sp)
	addi	sp, sp, 32
	ret
.Ltmp85:
.Lfunc_end7:
	.size	converterHexadecimalParaIntDecimal, .Lfunc_end7-converterHexadecimalParaIntDecimal
	.cfi_endproc
                                        # -- End function
	.globl	trocarEndianes          # -- Begin function trocarEndianes
	.p2align	2
	.type	trocarEndianes,@function
trocarEndianes:                         # @trocarEndianes
.Lfunc_begin8:
	.loc	1 170 0 is_stmt 1       # conversor.c:170:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -80
	.cfi_def_cfa_offset 80
	sw	ra, 76(sp)
	sw	s0, 72(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 80
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
.Ltmp86:
	.loc	1 172 31 prologue_end   # conversor.c:172:31
	lw	a0, -12(s0)
	.loc	1 172 17 is_stmt 0      # conversor.c:172:17
	call	tamanhoString
	.loc	1 172 7                 # conversor.c:172:7
	sw	a0, -16(s0)
	addi	a0, zero, 48
	.loc	1 175 26 is_stmt 1      # conversor.c:175:26
	sb	a0, -52(s0)
	addi	a0, zero, 120
	.loc	1 176 26                # conversor.c:176:26
	sb	a0, -51(s0)
	addi	a0, zero, 2
	.loc	1 178 7                 # conversor.c:178:7
	sw	a0, -56(s0)
.Ltmp87:
	.loc	1 180 16                # conversor.c:180:16
	lw	a0, -16(s0)
	.loc	1 180 24 is_stmt 0      # conversor.c:180:24
	addi	a0, a0, -1
	.loc	1 180 12                # conversor.c:180:12
	sw	a0, -60(s0)
	.loc	1 180 8                 # conversor.c:180:8
	j	.LBB8_1
.LBB8_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp88:
	.loc	1 180 30                # conversor.c:180:30
	lw	a0, -60(s0)
	addi	a1, zero, 2
.Ltmp89:
	.loc	1 180 3                 # conversor.c:180:3
	blt	a0, a1, .LBB8_7
	j	.LBB8_2
.LBB8_2:                                #   in Loop: Header=BB8_1 Depth=1
.Ltmp90:
	.loc	1 181 9 is_stmt 1       # conversor.c:181:9
	lw	a0, -12(s0)
	.loc	1 181 21 is_stmt 0      # conversor.c:181:21
	lw	a1, -60(s0)
	.loc	1 181 9                 # conversor.c:181:9
	add	a0, a1, a0
	lbu	a0, -1(a0)
	addi	a1, zero, 120
.Ltmp91:
	.loc	1 181 9                 # conversor.c:181:9
	beq	a0, a1, .LBB8_4
	j	.LBB8_3
.LBB8_3:                                #   in Loop: Header=BB8_1 Depth=1
.Ltmp92:
	.loc	1 182 37 is_stmt 1      # conversor.c:182:37
	lw	a0, -12(s0)
	.loc	1 182 49 is_stmt 0      # conversor.c:182:49
	lw	a1, -60(s0)
	.loc	1 182 37                # conversor.c:182:37
	add	a0, a1, a0
	lb	a0, -1(a0)
	.loc	1 182 27                # conversor.c:182:27
	lw	a1, -56(s0)
	addi	a2, s0, -52
	.loc	1 182 7                 # conversor.c:182:7
	add	a1, a2, a1
	.loc	1 182 35                # conversor.c:182:35
	sb	a0, 0(a1)
	.loc	1 183 5 is_stmt 1       # conversor.c:183:5
	j	.LBB8_5
.Ltmp93:
.LBB8_4:                                #   in Loop: Header=BB8_1 Depth=1
	.loc	1 184 27                # conversor.c:184:27
	lw	a0, -56(s0)
	addi	a1, s0, -52
	.loc	1 184 7 is_stmt 0       # conversor.c:184:7
	add	a0, a1, a0
	addi	a1, zero, 48
	.loc	1 184 35                # conversor.c:184:35
	sb	a1, 0(a0)
	j	.LBB8_5
.Ltmp94:
.LBB8_5:                                #   in Loop: Header=BB8_1 Depth=1
	.loc	1 186 39 is_stmt 1      # conversor.c:186:39
	lw	a0, -12(s0)
	.loc	1 186 51 is_stmt 0      # conversor.c:186:51
	lw	a1, -60(s0)
	.loc	1 186 39                # conversor.c:186:39
	add	a0, a0, a1
	lb	a0, 0(a0)
	.loc	1 186 25                # conversor.c:186:25
	lw	a1, -56(s0)
	addi	a2, s0, -52
	.loc	1 186 32                # conversor.c:186:32
	add	a1, a1, a2
	.loc	1 186 37                # conversor.c:186:37
	sb	a0, 1(a1)
	.loc	1 187 14 is_stmt 1      # conversor.c:187:14
	lw	a0, -56(s0)
	.loc	1 187 21 is_stmt 0      # conversor.c:187:21
	addi	a0, a0, 2
	.loc	1 187 12                # conversor.c:187:12
	sw	a0, -56(s0)
	.loc	1 188 3 is_stmt 1       # conversor.c:188:3
	j	.LBB8_6
.Ltmp95:
.LBB8_6:                                #   in Loop: Header=BB8_1 Depth=1
	.loc	1 180 42                # conversor.c:180:42
	lw	a0, -60(s0)
	.loc	1 180 44 is_stmt 0      # conversor.c:180:44
	addi	a0, a0, -2
	.loc	1 180 40                # conversor.c:180:40
	sw	a0, -60(s0)
	.loc	1 180 3                 # conversor.c:180:3
	j	.LBB8_1
.Ltmp96:
.LBB8_7:
	.loc	1 190 23 is_stmt 1      # conversor.c:190:23
	lw	a0, -56(s0)
	addi	a1, s0, -52
	.loc	1 190 3 is_stmt 0       # conversor.c:190:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 190 31                # conversor.c:190:31
	sb	a2, 0(a0)
	.loc	1 192 13 is_stmt 1      # conversor.c:192:13
	mv	a0, a1
	call	tamanhoString
	.loc	1 192 11 is_stmt 0      # conversor.c:192:11
	sw	a0, -16(s0)
	.loc	1 194 3 is_stmt 1       # conversor.c:194:3
	j	.LBB8_8
.LBB8_8:                                # =>This Inner Loop Header: Depth=1
	.loc	1 194 9 is_stmt 0       # conversor.c:194:9
	lw	a0, -16(s0)
	addi	a1, zero, 9
	.loc	1 194 3                 # conversor.c:194:3
	blt	a1, a0, .LBB8_10
	j	.LBB8_9
.LBB8_9:                                #   in Loop: Header=BB8_8 Depth=1
.Ltmp97:
	.loc	1 195 25 is_stmt 1      # conversor.c:195:25
	lw	a0, -56(s0)
	addi	a1, s0, -52
	.loc	1 195 5 is_stmt 0       # conversor.c:195:5
	add	a0, a1, a0
	addi	a1, zero, 48
	.loc	1 195 33                # conversor.c:195:33
	sb	a1, 0(a0)
	.loc	1 196 11 is_stmt 1      # conversor.c:196:11
	lw	a0, -56(s0)
	addi	a0, a0, 1
	sw	a0, -56(s0)
	.loc	1 197 12                # conversor.c:197:12
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
.Ltmp98:
	.loc	1 194 3                 # conversor.c:194:3
	j	.LBB8_8
.LBB8_10:
	.loc	1 200 23                # conversor.c:200:23
	lw	a0, -56(s0)
	addi	a1, s0, -52
	.loc	1 200 3 is_stmt 0       # conversor.c:200:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 200 31                # conversor.c:200:31
	sb	a2, 0(a0)
	.loc	1 202 13 is_stmt 1      # conversor.c:202:13
	mv	a0, a1
	sw	a1, -68(s0)
	call	tamanhoString
	.loc	1 202 11 is_stmt 0      # conversor.c:202:11
	sw	a0, -16(s0)
	.loc	1 204 82 is_stmt 1      # conversor.c:204:82
	lw	a1, -16(s0)
	.loc	1 204 26 is_stmt 0      # conversor.c:204:26
	lw	a0, -68(s0)
	call	converterHexadecimalParaIntDecimal
	.loc	1 204 16                # conversor.c:204:16
	sw	a0, -64(s0)
	.loc	1 206 27 is_stmt 1      # conversor.c:206:27
	lw	a0, -64(s0)
	.loc	1 206 3 is_stmt 0       # conversor.c:206:3
	call	converterUIntParaString
	.loc	1 207 1 is_stmt 1       # conversor.c:207:1
	lw	s0, 72(sp)
	lw	ra, 76(sp)
	addi	sp, sp, 80
	ret
.Ltmp99:
.Lfunc_end8:
	.size	trocarEndianes, .Lfunc_end8-trocarEndianes
	.cfi_endproc
                                        # -- End function
	.globl	converterDecimalParaHexadecimal # -- Begin function converterDecimalParaHexadecimal
	.p2align	2
	.type	converterDecimalParaHexadecimal,@function
converterDecimalParaHexadecimal:        # @converterDecimalParaHexadecimal
.Lfunc_begin9:
	.loc	1 209 0                 # conversor.c:209:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -128
	.cfi_def_cfa_offset 128
	sw	ra, 124(sp)
	sw	s0, 120(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 128
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
.Ltmp100:
	.loc	1 211 22 prologue_end   # conversor.c:211:22
	lw	a0, -12(s0)
	.loc	1 211 16 is_stmt 0      # conversor.c:211:16
	sw	a0, -52(s0)
	mv	a0, zero
	.loc	1 212 7 is_stmt 1       # conversor.c:212:7
	sw	a0, -56(s0)
	.loc	1 213 3                 # conversor.c:213:3
	j	.LBB9_1
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	.loc	1 213 10 is_stmt 0      # conversor.c:213:10
	lw	a0, -52(s0)
	mv	a1, zero
	.loc	1 213 3                 # conversor.c:213:3
	beq	a0, a1, .LBB9_6
	j	.LBB9_2
.LBB9_2:                                #   in Loop: Header=BB9_1 Depth=1
.Ltmp101:
	.loc	1 215 9 is_stmt 1       # conversor.c:215:9
	lw	a0, -52(s0)
	.loc	1 215 13 is_stmt 0      # conversor.c:215:13
	andi	a0, a0, 15
	addi	a1, zero, 9
.Ltmp102:
	.loc	1 215 9                 # conversor.c:215:9
	bltu	a1, a0, .LBB9_4
	j	.LBB9_3
.LBB9_3:                                #   in Loop: Header=BB9_1 Depth=1
.Ltmp103:
	.loc	1 216 35 is_stmt 1      # conversor.c:216:35
	lw	a0, -52(s0)
	.loc	1 216 39 is_stmt 0      # conversor.c:216:39
	andi	a0, a0, 15
	.loc	1 216 45                # conversor.c:216:45
	ori	a0, a0, 48
	.loc	1 216 29                # conversor.c:216:29
	lw	a1, -56(s0)
	addi	a2, s0, -48
	.loc	1 216 7                 # conversor.c:216:7
	add	a1, a2, a1
	.loc	1 216 32                # conversor.c:216:32
	sb	a0, 0(a1)
	.loc	1 217 5 is_stmt 1       # conversor.c:217:5
	j	.LBB9_5
.Ltmp104:
.LBB9_4:                                #   in Loop: Header=BB9_1 Depth=1
	.loc	1 218 35                # conversor.c:218:35
	lw	a0, -52(s0)
	.loc	1 218 39 is_stmt 0      # conversor.c:218:39
	andi	a0, a0, 15
	lui	a1, 3
	addi	a1, a1, 1111
	.loc	1 218 52                # conversor.c:218:52
	add	a0, a0, a1
	.loc	1 218 29                # conversor.c:218:29
	lw	a1, -56(s0)
	addi	a2, s0, -48
	.loc	1 218 7                 # conversor.c:218:7
	add	a1, a2, a1
	.loc	1 218 32                # conversor.c:218:32
	sb	a0, 0(a1)
	j	.LBB9_5
.Ltmp105:
.LBB9_5:                                #   in Loop: Header=BB9_1 Depth=1
	.loc	1 220 11 is_stmt 1      # conversor.c:220:11
	lw	a0, -52(s0)
	.loc	1 220 15 is_stmt 0      # conversor.c:220:15
	srli	a0, a0, 4
	.loc	1 220 9                 # conversor.c:220:9
	sw	a0, -52(s0)
	.loc	1 221 6 is_stmt 1       # conversor.c:221:6
	lw	a0, -56(s0)
	addi	a0, a0, 1
	sw	a0, -56(s0)
.Ltmp106:
	.loc	1 213 3                 # conversor.c:213:3
	j	.LBB9_1
.LBB9_6:
	.loc	1 223 25                # conversor.c:223:25
	lw	a0, -56(s0)
	addi	a1, s0, -48
	.loc	1 223 3 is_stmt 0       # conversor.c:223:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 223 28                # conversor.c:223:28
	sb	a2, 0(a0)
	addi	a0, zero, 48
	.loc	1 229 18 is_stmt 1      # conversor.c:229:18
	sb	a0, -92(s0)
	addi	a0, zero, 120
	.loc	1 230 18                # conversor.c:230:18
	sb	a0, -91(s0)
	addi	a0, zero, 2
	.loc	1 232 7                 # conversor.c:232:7
	sw	a0, -96(s0)
	.loc	1 234 17                # conversor.c:234:17
	mv	a0, a1
	call	tamanhoString
	.loc	1 234 7 is_stmt 0       # conversor.c:234:7
	sw	a0, -100(s0)
.Ltmp107:
	.loc	1 236 16 is_stmt 1      # conversor.c:236:16
	lw	a0, -100(s0)
	.loc	1 236 24 is_stmt 0      # conversor.c:236:24
	addi	a0, a0, -1
	.loc	1 236 12                # conversor.c:236:12
	sw	a0, -104(s0)
	.loc	1 236 8                 # conversor.c:236:8
	j	.LBB9_7
.LBB9_7:                                # =>This Inner Loop Header: Depth=1
.Ltmp108:
	.loc	1 236 29                # conversor.c:236:29
	lw	a0, -104(s0)
	mv	a1, zero
.Ltmp109:
	.loc	1 236 3                 # conversor.c:236:3
	blt	a0, a1, .LBB9_10
	j	.LBB9_8
.LBB9_8:                                #   in Loop: Header=BB9_7 Depth=1
.Ltmp110:
	.loc	1 237 49 is_stmt 1      # conversor.c:237:49
	lw	a0, -104(s0)
	addi	a1, s0, -48
	.loc	1 237 27 is_stmt 0      # conversor.c:237:27
	add	a0, a1, a0
	lb	a0, 0(a0)
	.loc	1 237 17                # conversor.c:237:17
	lw	a1, -96(s0)
	addi	a2, s0, -92
	.loc	1 237 5                 # conversor.c:237:5
	add	a1, a2, a1
	.loc	1 237 25                # conversor.c:237:25
	sb	a0, 0(a1)
	.loc	1 238 11 is_stmt 1      # conversor.c:238:11
	lw	a0, -96(s0)
	addi	a0, a0, 1
	sw	a0, -96(s0)
	.loc	1 239 3                 # conversor.c:239:3
	j	.LBB9_9
.Ltmp111:
.LBB9_9:                                #   in Loop: Header=BB9_7 Depth=1
	.loc	1 236 38                # conversor.c:236:38
	lw	a0, -104(s0)
	addi	a0, a0, -1
	sw	a0, -104(s0)
	.loc	1 236 3 is_stmt 0       # conversor.c:236:3
	j	.LBB9_7
.Ltmp112:
.LBB9_10:
	.loc	1 241 15 is_stmt 1      # conversor.c:241:15
	lw	a0, -96(s0)
	addi	a1, s0, -92
	.loc	1 241 3 is_stmt 0       # conversor.c:241:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 241 23                # conversor.c:241:23
	sb	a2, 0(a0)
	.loc	1 243 25 is_stmt 1      # conversor.c:243:25
	mv	a0, a1
	sw	a1, -108(s0)
	call	tamanhoString
	addi	a1, zero, 1
	.loc	1 243 3 is_stmt 0       # conversor.c:243:3
	sw	a0, -112(s0)
	mv	a0, a1
	lw	a2, -108(s0)
	sw	a1, -116(s0)
	mv	a1, a2
	lw	a2, -112(s0)
	call	write
	.loc	1 244 3 is_stmt 1       # conversor.c:244:3
	lui	a0, %hi(.L.str)
	addi	a1, a0, %lo(.L.str)
	lw	a0, -116(s0)
	lw	a2, -116(s0)
	call	write
	.loc	1 247 3                 # conversor.c:247:3
	lw	a0, -108(s0)
	call	trocarEndianes
	.loc	1 248 1                 # conversor.c:248:1
	lw	s0, 120(sp)
	lw	ra, 124(sp)
	addi	sp, sp, 128
	ret
.Ltmp113:
.Lfunc_end9:
	.size	converterDecimalParaHexadecimal, .Lfunc_end9-converterDecimalParaHexadecimal
	.cfi_endproc
                                        # -- End function
	.globl	converterDecimalParaBinario # -- Begin function converterDecimalParaBinario
	.p2align	2
	.type	converterDecimalParaBinario,@function
converterDecimalParaBinario:            # @converterDecimalParaBinario
.Lfunc_begin10:
	.loc	1 252 0                 # conversor.c:252:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -128
	.cfi_def_cfa_offset 128
	sw	ra, 124(sp)
	sw	s0, 120(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 128
	.cfi_def_cfa s0, 0
	sw	a0, -12(s0)
.Ltmp114:
	.loc	1 255 22 prologue_end   # conversor.c:255:22
	lw	a0, -12(s0)
	.loc	1 255 16 is_stmt 0      # conversor.c:255:16
	sw	a0, -52(s0)
	mv	a0, zero
	.loc	1 256 7 is_stmt 1       # conversor.c:256:7
	sw	a0, -56(s0)
	.loc	1 257 3                 # conversor.c:257:3
	j	.LBB10_1
.LBB10_1:                               # =>This Inner Loop Header: Depth=1
	.loc	1 257 10 is_stmt 0      # conversor.c:257:10
	lw	a0, -52(s0)
	mv	a1, zero
	.loc	1 257 3                 # conversor.c:257:3
	beq	a0, a1, .LBB10_3
	j	.LBB10_2
.LBB10_2:                               #   in Loop: Header=BB10_1 Depth=1
.Ltmp115:
	.loc	1 259 29 is_stmt 1      # conversor.c:259:29
	lw	a0, -52(s0)
	.loc	1 259 33 is_stmt 0      # conversor.c:259:33
	andi	a0, a0, 1
	.loc	1 259 38                # conversor.c:259:38
	ori	a0, a0, 48
	.loc	1 259 23                # conversor.c:259:23
	lw	a1, -56(s0)
	addi	a2, s0, -48
	.loc	1 259 5                 # conversor.c:259:5
	add	a1, a2, a1
	.loc	1 259 26                # conversor.c:259:26
	sb	a0, 0(a1)
	.loc	1 261 11 is_stmt 1      # conversor.c:261:11
	lw	a0, -52(s0)
	.loc	1 261 15 is_stmt 0      # conversor.c:261:15
	srli	a0, a0, 1
	.loc	1 261 9                 # conversor.c:261:9
	sw	a0, -52(s0)
	.loc	1 262 6 is_stmt 1       # conversor.c:262:6
	lw	a0, -56(s0)
	addi	a0, a0, 1
	sw	a0, -56(s0)
.Ltmp116:
	.loc	1 257 3                 # conversor.c:257:3
	j	.LBB10_1
.LBB10_3:
	.loc	1 264 21                # conversor.c:264:21
	lw	a0, -56(s0)
	addi	a1, s0, -48
	.loc	1 264 3 is_stmt 0       # conversor.c:264:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 264 24                # conversor.c:264:24
	sb	a2, 0(a0)
	addi	a0, zero, 48
	.loc	1 269 14 is_stmt 1      # conversor.c:269:14
	sb	a0, -92(s0)
	addi	a0, zero, 98
	.loc	1 270 14                # conversor.c:270:14
	sb	a0, -91(s0)
	addi	a0, zero, 2
	.loc	1 272 7                 # conversor.c:272:7
	sw	a0, -96(s0)
	.loc	1 274 17                # conversor.c:274:17
	mv	a0, a1
	call	tamanhoString
	.loc	1 274 7 is_stmt 0       # conversor.c:274:7
	sw	a0, -100(s0)
.Ltmp117:
	.loc	1 276 16 is_stmt 1      # conversor.c:276:16
	lw	a0, -100(s0)
	.loc	1 276 24 is_stmt 0      # conversor.c:276:24
	addi	a0, a0, -1
	.loc	1 276 12                # conversor.c:276:12
	sw	a0, -104(s0)
	.loc	1 276 8                 # conversor.c:276:8
	j	.LBB10_4
.LBB10_4:                               # =>This Inner Loop Header: Depth=1
.Ltmp118:
	.loc	1 276 29                # conversor.c:276:29
	lw	a0, -104(s0)
	mv	a1, zero
.Ltmp119:
	.loc	1 276 3                 # conversor.c:276:3
	blt	a0, a1, .LBB10_7
	j	.LBB10_5
.LBB10_5:                               #   in Loop: Header=BB10_4 Depth=1
.Ltmp120:
	.loc	1 277 41 is_stmt 1      # conversor.c:277:41
	lw	a0, -104(s0)
	addi	a1, s0, -48
	.loc	1 277 23 is_stmt 0      # conversor.c:277:23
	add	a0, a1, a0
	lb	a0, 0(a0)
	.loc	1 277 13                # conversor.c:277:13
	lw	a1, -96(s0)
	addi	a2, s0, -92
	.loc	1 277 5                 # conversor.c:277:5
	add	a1, a2, a1
	.loc	1 277 21                # conversor.c:277:21
	sb	a0, 0(a1)
	.loc	1 278 11 is_stmt 1      # conversor.c:278:11
	lw	a0, -96(s0)
	addi	a0, a0, 1
	sw	a0, -96(s0)
	.loc	1 279 3                 # conversor.c:279:3
	j	.LBB10_6
.Ltmp121:
.LBB10_6:                               #   in Loop: Header=BB10_4 Depth=1
	.loc	1 276 38                # conversor.c:276:38
	lw	a0, -104(s0)
	addi	a0, a0, -1
	sw	a0, -104(s0)
	.loc	1 276 3 is_stmt 0       # conversor.c:276:3
	j	.LBB10_4
.Ltmp122:
.LBB10_7:
	.loc	1 281 11 is_stmt 1      # conversor.c:281:11
	lw	a0, -96(s0)
	addi	a1, s0, -92
	.loc	1 281 3 is_stmt 0       # conversor.c:281:3
	add	a0, a1, a0
	mv	a2, zero
	.loc	1 281 19                # conversor.c:281:19
	sb	a2, 0(a0)
	.loc	1 283 21 is_stmt 1      # conversor.c:283:21
	mv	a0, a1
	sw	a1, -108(s0)
	call	tamanhoString
	addi	a1, zero, 1
	.loc	1 283 3 is_stmt 0       # conversor.c:283:3
	sw	a0, -112(s0)
	mv	a0, a1
	lw	a2, -108(s0)
	sw	a1, -116(s0)
	mv	a1, a2
	lw	a2, -112(s0)
	call	write
	.loc	1 284 3 is_stmt 1       # conversor.c:284:3
	lui	a0, %hi(.L.str)
	addi	a1, a0, %lo(.L.str)
	lw	a0, -116(s0)
	lw	a2, -116(s0)
	call	write
	.loc	1 286 1                 # conversor.c:286:1
	lw	s0, 120(sp)
	lw	ra, 124(sp)
	addi	sp, sp, 128
	ret
.Ltmp123:
.Lfunc_end10:
	.size	converterDecimalParaBinario, .Lfunc_end10-converterDecimalParaBinario
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
.Lfunc_begin11:
	.loc	1 289 0                 # conversor.c:289:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -112
	.cfi_def_cfa_offset 112
	sw	ra, 108(sp)
	sw	s0, 104(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 112
	.cfi_def_cfa s0, 0
	mv	a0, zero
	sw	a0, -12(s0)
	addi	a1, s0, -48
	addi	a2, zero, 35
.Ltmp124:
	.loc	1 291 11 prologue_end   # conversor.c:291:11
	sw	a0, -72(s0)
	sw	a1, -76(s0)
	call	read
	.loc	1 291 7 is_stmt 0       # conversor.c:291:7
	sw	a0, -52(s0)
	.loc	1 293 7 is_stmt 1       # conversor.c:293:7
	lw	a0, -76(s0)
	call	tamanhoString
	.loc	1 293 3 is_stmt 0       # conversor.c:293:3
	lw	a1, -76(s0)
	add	a0, a0, a1
	.loc	1 293 31                # conversor.c:293:31
	lw	a2, -72(s0)
	sb	a2, -1(a0)
.Ltmp125:
	.loc	1 295 7 is_stmt 1       # conversor.c:295:7
	lbu	a0, -48(s0)
	addi	a3, zero, 48
.Ltmp126:
	.loc	1 295 7 is_stmt 0       # conversor.c:295:7
	beq	a0, a3, .LBB11_2
	j	.LBB11_1
.LBB11_1:
	.loc	1 0 7                   # conversor.c:0:7
	addi	a0, s0, -48
.Ltmp127:
	.loc	1 296 48 is_stmt 1      # conversor.c:296:48
	sw	a0, -80(s0)
	call	tamanhoString
	.loc	1 296 19 is_stmt 0      # conversor.c:296:19
	lw	a1, -80(s0)
	sw	a0, -84(s0)
	mv	a0, a1
	lw	a1, -84(s0)
	call	converterDecimalParaInt
	.loc	1 296 9                 # conversor.c:296:9
	sw	a0, -56(s0)
	.loc	1 297 38 is_stmt 1      # conversor.c:297:38
	lw	a0, -56(s0)
	.loc	1 297 18 is_stmt 0      # conversor.c:297:18
	sw	a0, -60(s0)
	.loc	1 298 33 is_stmt 1      # conversor.c:298:33
	lw	a0, -60(s0)
	.loc	1 298 5 is_stmt 0       # conversor.c:298:5
	call	converterDecimalParaBinario
	.loc	1 299 28 is_stmt 1      # conversor.c:299:28
	lw	a0, -56(s0)
	.loc	1 299 5 is_stmt 0       # conversor.c:299:5
	call	converterIntParaString
	.loc	1 300 37 is_stmt 1      # conversor.c:300:37
	lw	a0, -60(s0)
	.loc	1 300 5 is_stmt 0       # conversor.c:300:5
	call	converterDecimalParaHexadecimal
	.loc	1 301 3 is_stmt 1       # conversor.c:301:3
	j	.LBB11_3
.Ltmp128:
.LBB11_2:
	.loc	1 0 3 is_stmt 0         # conversor.c:0:3
	addi	a0, s0, -48
.Ltmp129:
	.loc	1 302 59 is_stmt 1      # conversor.c:302:59
	sw	a0, -88(s0)
	call	tamanhoString
	.loc	1 302 19 is_stmt 0      # conversor.c:302:19
	lw	a1, -88(s0)
	sw	a0, -92(s0)
	mv	a0, a1
	lw	a1, -92(s0)
	call	converterHexadecimalParaIntDecimal
	.loc	1 302 9                 # conversor.c:302:9
	sw	a0, -64(s0)
	.loc	1 303 38 is_stmt 1      # conversor.c:303:38
	lw	a0, -64(s0)
	.loc	1 303 18 is_stmt 0      # conversor.c:303:18
	sw	a0, -68(s0)
	.loc	1 304 33 is_stmt 1      # conversor.c:304:33
	lw	a0, -68(s0)
	.loc	1 304 5 is_stmt 0       # conversor.c:304:5
	call	converterDecimalParaBinario
	.loc	1 305 28 is_stmt 1      # conversor.c:305:28
	lw	a0, -64(s0)
	.loc	1 305 5 is_stmt 0       # conversor.c:305:5
	call	converterIntParaString
	.loc	1 306 19 is_stmt 1      # conversor.c:306:19
	lw	a0, -88(s0)
	call	tamanhoString
	addi	a1, zero, 1
	.loc	1 306 5 is_stmt 0       # conversor.c:306:5
	sw	a0, -96(s0)
	mv	a0, a1
	lw	a2, -88(s0)
	sw	a1, -100(s0)
	mv	a1, a2
	lw	a2, -96(s0)
	call	write
	.loc	1 307 5 is_stmt 1       # conversor.c:307:5
	lui	a0, %hi(.L.str)
	addi	a1, a0, %lo(.L.str)
	lw	a0, -100(s0)
	lw	a2, -100(s0)
	call	write
	.loc	1 308 5                 # conversor.c:308:5
	lw	a0, -88(s0)
	call	trocarEndianes
	j	.LBB11_3
.Ltmp130:
.LBB11_3:
	.loc	1 0 5 is_stmt 0         # conversor.c:0:5
	mv	a0, zero
	.loc	1 310 3 is_stmt 1       # conversor.c:310:3
	lw	s0, 104(sp)
	lw	ra, 108(sp)
	addi	sp, sp, 112
	ret
.Ltmp131:
.Lfunc_end11:
	.size	main, .Lfunc_end11-main
	.cfi_endproc
                                        # -- End function
	.globl	_start                  # -- Begin function _start
	.p2align	2
	.type	_start,@function
_start:                                 # @_start
.Lfunc_begin12:
	.loc	1 313 0                 # conversor.c:313:0
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
.Ltmp132:
	.loc	1 314 3 prologue_end    # conversor.c:314:3
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 16
	.cfi_def_cfa s0, 0
	call	main
	.loc	1 315 1                 # conversor.c:315:1
	lw	s0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
.Ltmp133:
.Lfunc_end12:
	.size	_start, .Lfunc_end12-_start
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"\n"
	.size	.L.str, 2

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 10.0.0-4ubuntu1 " # string offset=0
.Linfo_string1:
	.asciz	"conversor.c"           # string offset=31
.Linfo_string2:
	.asciz	"/home/matheus/Quarto_Semestre/MC404/Lab03" # string offset=43
.Linfo_string3:
	.asciz	"read"                  # string offset=85
.Linfo_string4:
	.asciz	"int"                   # string offset=90
.Linfo_string5:
	.asciz	"write"                 # string offset=94
.Linfo_string6:
	.asciz	"tamanhoString"         # string offset=100
.Linfo_string7:
	.asciz	"potencializar"         # string offset=114
.Linfo_string8:
	.asciz	"converterUIntParaString" # string offset=128
.Linfo_string9:
	.asciz	"converterIntParaString" # string offset=152
.Linfo_string10:
	.asciz	"converterDecimalParaInt" # string offset=175
.Linfo_string11:
	.asciz	"converterHexadecimalParaIntDecimal" # string offset=199
.Linfo_string12:
	.asciz	"trocarEndianes"        # string offset=234
.Linfo_string13:
	.asciz	"converterDecimalParaHexadecimal" # string offset=249
.Linfo_string14:
	.asciz	"converterDecimalParaBinario" # string offset=281
.Linfo_string15:
	.asciz	"main"                  # string offset=309
.Linfo_string16:
	.asciz	"_start"                # string offset=314
.Linfo_string17:
	.asciz	"__fd"                  # string offset=321
.Linfo_string18:
	.asciz	"__buf"                 # string offset=326
.Linfo_string19:
	.asciz	"__n"                   # string offset=332
.Linfo_string20:
	.asciz	"bytes"                 # string offset=336
.Linfo_string21:
	.asciz	"string"                # string offset=342
.Linfo_string22:
	.asciz	"char"                  # string offset=349
.Linfo_string23:
	.asciz	"tamanho"               # string offset=354
.Linfo_string24:
	.asciz	"i"                     # string offset=362
.Linfo_string25:
	.asciz	"numero"                # string offset=364
.Linfo_string26:
	.asciz	"potencia"              # string offset=371
.Linfo_string27:
	.asciz	"decimall"              # string offset=380
.Linfo_string28:
	.asciz	"unsigned int"          # string offset=389
.Linfo_string29:
	.asciz	"decimal_invertido"     # string offset=402
.Linfo_string30:
	.asciz	"__ARRAY_SIZE_TYPE__"   # string offset=420
.Linfo_string31:
	.asciz	"aux"                   # string offset=440
.Linfo_string32:
	.asciz	"decimal"               # string offset=444
.Linfo_string33:
	.asciz	"inicio"                # string offset=452
.Linfo_string34:
	.asciz	"aux2"                  # string offset=459
.Linfo_string35:
	.asciz	"eh_negativo"           # string offset=464
.Linfo_string36:
	.asciz	"str"                   # string offset=476
.Linfo_string37:
	.asciz	"hexadecimal"           # string offset=480
.Linfo_string38:
	.asciz	"hexadecimal_trocado"   # string offset=492
.Linfo_string39:
	.asciz	"hexadecimal_invertido" # string offset=512
.Linfo_string40:
	.asciz	"binario_invertido"     # string offset=534
.Linfo_string41:
	.asciz	"binario"               # string offset=552
.Linfo_string42:
	.asciz	"n"                     # string offset=560
.Linfo_string43:
	.asciz	"decimal_sem_sinal"     # string offset=562
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	11                      # DW_TAG_lexical_block
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	0                       # DW_CHILDREN_no
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	5                       # DW_FORM_data2
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	10                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	11                      # Abbreviation Code
	.byte	15                      # DW_TAG_pointer_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	12                      # Abbreviation Code
	.byte	38                      # DW_TAG_const_type
	.byte	0                       # DW_CHILDREN_no
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	13                      # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	14                      # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	15                      # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.half	4                       # DWARF version number
	.word	.debug_abbrev           # Offset Into Abbrev. Section
	.byte	4                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x59f DW_TAG_compile_unit
	.word	.Linfo_string0          # DW_AT_producer
	.half	12                      # DW_AT_language
	.word	.Linfo_string1          # DW_AT_name
	.word	.Lline_table_start0     # DW_AT_stmt_list
	.word	.Linfo_string2          # DW_AT_comp_dir
	.word	.Lfunc_begin0           # DW_AT_low_pc
	.word	.Lfunc_end12-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x26:0x4e DW_TAG_subprogram
	.word	.Lfunc_begin0           # DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	1398                    # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x3b:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x49:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.word	1405                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x57:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x65:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string20         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x74:0x3c DW_TAG_subprogram
	.word	.Lfunc_begin1           # DW_AT_low_pc
	.word	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x85:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string17         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x93:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string18         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.word	1405                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0xa1:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string19         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	18                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0xb0:0x4a DW_TAG_subprogram
	.word	.Lfunc_begin2           # DW_AT_low_pc
	.word	.Lfunc_end2-.Lfunc_begin2 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	1398                    # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0xc5:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string21         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	31                      # DW_AT_decl_line
	.word	1411                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0xd3:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	33                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0xe1:0x18 DW_TAG_lexical_block
	.word	.Ltmp5                  # DW_AT_low_pc
	.word	.Ltmp10-.Ltmp5          # DW_AT_high_pc
	.byte	4                       # Abbrev [4] 0xea:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	35                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0xfa:0x32 DW_TAG_subprogram
	.word	.Lfunc_begin3           # DW_AT_low_pc
	.word	.Lfunc_end3-.Lfunc_begin3 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	1398                    # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x10f:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string25         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x11d:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string26         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	42                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x12c:0x90 DW_TAG_subprogram
	.word	.Lfunc_begin4           # DW_AT_low_pc
	.word	.Lfunc_end4-.Lfunc_begin4 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x13d:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	50                      # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x14b:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.word	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	51                      # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x159:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	76
	.word	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	52                      # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x167:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	53                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x175:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	64                      # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x184:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.word	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	66                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x193:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	68                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x1a2:0x19 DW_TAG_lexical_block
	.word	.Ltmp20                 # DW_AT_low_pc
	.word	.Ltmp25-.Ltmp20         # DW_AT_high_pc
	.byte	4                       # Abbrev [4] 0x1ab:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	70                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x1bc:0xc5 DW_TAG_subprogram
	.word	.Lfunc_begin5           # DW_AT_low_pc
	.word	.Lfunc_end5-.Lfunc_begin5 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string9          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x1cd:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string27         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	82                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x1db:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.word	.Linfo_string29         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	83                      # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x1e9:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	76
	.word	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	84                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x1f7:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.word	.Linfo_string34         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	85                      # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x205:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	68
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	86                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x213:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.word	.Linfo_string35         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	87                      # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x221:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	113                     # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x230:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.word	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	115                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x23f:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\224\177"
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	117                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x24e:0x19 DW_TAG_lexical_block
	.word	.Ltmp42                 # DW_AT_low_pc
	.word	.Ltmp47-.Ltmp42         # DW_AT_high_pc
	.byte	4                       # Abbrev [4] 0x257:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\220\177"
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	119                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x267:0x19 DW_TAG_lexical_block
	.word	.Ltmp50                 # DW_AT_low_pc
	.word	.Ltmp55-.Ltmp50         # DW_AT_high_pc
	.byte	4                       # Abbrev [4] 0x270:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\214\177"
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	126                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x281:0x70 DW_TAG_subprogram
	.word	.Lfunc_begin6           # DW_AT_low_pc
	.word	.Lfunc_end6-.Lfunc_begin6 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string10         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	1398                    # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x296:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.word	1411                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x2a4:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	139                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x2b2:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	140                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x2c0:0x18 DW_TAG_lexical_block
	.word	.Ltmp60                 # DW_AT_low_pc
	.word	.Ltmp65-.Ltmp60         # DW_AT_high_pc
	.byte	4                       # Abbrev [4] 0x2c9:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	143                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x2d8:0x18 DW_TAG_lexical_block
	.word	.Ltmp67                 # DW_AT_low_pc
	.word	.Ltmp72-.Ltmp67         # DW_AT_high_pc
	.byte	4                       # Abbrev [4] 0x2e1:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	100
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	148                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	2                       # Abbrev [2] 0x2f1:0x58 DW_TAG_subprogram
	.word	.Lfunc_begin7           # DW_AT_low_pc
	.word	.Lfunc_end7-.Lfunc_begin7 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string11         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
                                        # DW_AT_prototyped
	.word	1398                    # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x306:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.word	1411                    # DW_AT_type
	.byte	3                       # Abbrev [3] 0x314:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	156                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x322:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	108
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	157                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x330:0x18 DW_TAG_lexical_block
	.word	.Ltmp75                 # DW_AT_low_pc
	.word	.Ltmp84-.Ltmp75         # DW_AT_high_pc
	.byte	4                       # Abbrev [4] 0x339:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	104
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	159                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x349:0x70 DW_TAG_subprogram
	.word	.Lfunc_begin8           # DW_AT_low_pc
	.word	.Lfunc_end8-.Lfunc_begin8 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string12         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	170                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x35a:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	170                     # DW_AT_decl_line
	.word	1411                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x368:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	112
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	172                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x376:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	76
	.word	.Linfo_string38         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	174                     # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x384:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.word	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	178                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x392:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	204                     # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x3a0:0x18 DW_TAG_lexical_block
	.word	.Ltmp87                 # DW_AT_low_pc
	.word	.Ltmp96-.Ltmp87         # DW_AT_high_pc
	.byte	4                       # Abbrev [4] 0x3a9:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	68
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	180                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x3b9:0x90 DW_TAG_subprogram
	.word	.Lfunc_begin9           # DW_AT_low_pc
	.word	.Lfunc_end9-.Lfunc_begin9 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string13         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	209                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x3ca:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	209                     # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x3d8:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.word	.Linfo_string39         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	210                     # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x3e6:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	76
	.word	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	211                     # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x3f4:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	212                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x402:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.word	.Linfo_string37         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	227                     # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x411:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.word	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	232                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x420:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	234                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x42f:0x19 DW_TAG_lexical_block
	.word	.Ltmp107                # DW_AT_low_pc
	.word	.Ltmp112-.Ltmp107       # DW_AT_high_pc
	.byte	4                       # Abbrev [4] 0x438:0xf DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	236                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	5                       # Abbrev [5] 0x449:0x95 DW_TAG_subprogram
	.word	.Lfunc_begin10          # DW_AT_low_pc
	.word	.Lfunc_end10-.Lfunc_begin10 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string14         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
                                        # DW_AT_prototyped
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x45a:0xe DW_TAG_formal_parameter
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	116
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	252                     # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x468:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.word	.Linfo_string40         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	254                     # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	4                       # Abbrev [4] 0x476:0xe DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	76
	.word	.Linfo_string31         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	255                     # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x484:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	256                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x493:0x10 DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\244\177"
	.word	.Linfo_string41         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	267                     # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x4a3:0x10 DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\240\177"
	.word	.Linfo_string33         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	272                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x4b3:0x10 DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\234\177"
	.word	.Linfo_string23         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	274                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x4c3:0x1a DW_TAG_lexical_block
	.word	.Ltmp117                # DW_AT_low_pc
	.word	.Ltmp122-.Ltmp117       # DW_AT_high_pc
	.byte	7                       # Abbrev [7] 0x4cc:0x10 DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\230\177"
	.word	.Linfo_string24         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	276                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	8                       # Abbrev [8] 0x4de:0x86 DW_TAG_subprogram
	.word	.Lfunc_begin11          # DW_AT_low_pc
	.word	.Lfunc_end11-.Lfunc_begin11 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string15         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	288                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
                                        # DW_AT_external
	.byte	7                       # Abbrev [7] 0x4f4:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	80
	.word	.Linfo_string36         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	290                     # DW_AT_decl_line
	.word	1430                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x503:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	76
	.word	.Linfo_string42         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	291                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	6                       # Abbrev [6] 0x512:0x28 DW_TAG_lexical_block
	.word	.Ltmp127                # DW_AT_low_pc
	.word	.Ltmp128-.Ltmp127       # DW_AT_high_pc
	.byte	7                       # Abbrev [7] 0x51b:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	72
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	296                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x52a:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	68
	.word	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	297                     # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x53a:0x29 DW_TAG_lexical_block
	.word	.Ltmp129                # DW_AT_low_pc
	.word	.Ltmp130-.Ltmp129       # DW_AT_high_pc
	.byte	7                       # Abbrev [7] 0x543:0xf DW_TAG_variable
	.byte	2                       # DW_AT_location
	.byte	145
	.byte	64
	.word	.Linfo_string32         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	302                     # DW_AT_decl_line
	.word	1398                    # DW_AT_type
	.byte	7                       # Abbrev [7] 0x552:0x10 DW_TAG_variable
	.byte	3                       # DW_AT_location
	.byte	145
	.ascii	"\274\177"
	.word	.Linfo_string43         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	303                     # DW_AT_decl_line
	.word	1423                    # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	9                       # Abbrev [9] 0x564:0x12 DW_TAG_subprogram
	.word	.Lfunc_begin12          # DW_AT_low_pc
	.word	.Lfunc_end12-.Lfunc_begin12 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	88
	.word	.Linfo_string16         # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.half	313                     # DW_AT_decl_line
                                        # DW_AT_external
	.byte	10                      # Abbrev [10] 0x576:0x7 DW_TAG_base_type
	.word	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	11                      # Abbrev [11] 0x57d:0x5 DW_TAG_pointer_type
	.word	1410                    # DW_AT_type
	.byte	12                      # Abbrev [12] 0x582:0x1 DW_TAG_const_type
	.byte	11                      # Abbrev [11] 0x583:0x5 DW_TAG_pointer_type
	.word	1416                    # DW_AT_type
	.byte	10                      # Abbrev [10] 0x588:0x7 DW_TAG_base_type
	.word	.Linfo_string22         # DW_AT_name
	.byte	8                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	10                      # Abbrev [10] 0x58f:0x7 DW_TAG_base_type
	.word	.Linfo_string28         # DW_AT_name
	.byte	7                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	13                      # Abbrev [13] 0x596:0xc DW_TAG_array_type
	.word	1416                    # DW_AT_type
	.byte	14                      # Abbrev [14] 0x59b:0x6 DW_TAG_subrange_type
	.word	1442                    # DW_AT_type
	.byte	36                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	15                      # Abbrev [15] 0x5a2:0x7 DW_TAG_base_type
	.word	.Linfo_string30         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym read
	.addrsig_sym write
	.addrsig_sym tamanhoString
	.addrsig_sym potencializar
	.addrsig_sym converterUIntParaString
	.addrsig_sym converterIntParaString
	.addrsig_sym converterDecimalParaInt
	.addrsig_sym converterHexadecimalParaIntDecimal
	.addrsig_sym trocarEndianes
	.addrsig_sym converterDecimalParaHexadecimal
	.addrsig_sym converterDecimalParaBinario
	.addrsig_sym main
	.section	.debug_line,"",@progbits
.Lline_table_start0:
