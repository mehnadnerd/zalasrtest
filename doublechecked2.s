	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_v1p0_zicond1p0_zicsr2p0_zifencei2p0_zacas1p0_zalasr0p1_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.file	"doublechecked.c"
	.hidden	x_val                           # -- Begin function x_val
	.globl	x_val
	.p2align	1
	.type	x_val,@function
x_val:                                  # @x_val
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
.Lpcrel_hi0:
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi0)
	call	system
	addiw	a0, a0, 1
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	x_val, .Lfunc_end0-x_val
                                        # -- End function
	.hidden	get_x                           # -- Begin function get_x
	.globl	get_x
	.p2align	1
	.type	get_x,@function
get_x:                                  # @get_x
# %bb.0:                                # %entry
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	sd	s1, 8(sp)                       # 8-byte Folded Spill
.Lpcrel_hi1:
	auipc	a0, %pcrel_hi(x_init)
	addi	s1, a0, %pcrel_lo(.Lpcrel_hi1)
	lb.aq	a0, (s1)
	andi	a0, a0, 1
.Lpcrel_hi2:
	auipc	s0, %pcrel_hi(x)
	bnez	a0, .LBB1_4
# %bb.1:                                # %if.then
.Lpcrel_hi3:
	auipc	a0, %pcrel_hi(x_mutex)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi3)
	call	pthread_mutex_lock
	lb	a0, 0(s1)
	andi	a0, a0, 1
	bnez	a0, .LBB1_3
# %bb.2:                                # %if.then3
.Lpcrel_hi4:
	auipc	a0, %pcrel_hi(.L.str)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi4)
	call	system
	addi	a0, a0, 1
	sw	a0, %pcrel_lo(.Lpcrel_hi2)(s0)
	li	a0, 1
	sb.rl	a0, (s1)
.LBB1_3:                                # %if.end
.Lpcrel_hi5:
	auipc	a0, %pcrel_hi(x_mutex)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi5)
	call	pthread_mutex_unlock
.LBB1_4:                                # %if.end6
	lw	a0, %pcrel_lo(.Lpcrel_hi2)(s0)
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	ld	s1, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	get_x, .Lfunc_end1-get_x
                                        # -- End function
	.hidden	loop                            # -- Begin function loop
	.globl	loop
	.p2align	1
	.type	loop,@function
loop:                                   # @loop
# %bb.0:                                # %entry
	addi	sp, sp, -64
	sd	ra, 56(sp)                      # 8-byte Folded Spill
	sd	s0, 48(sp)                      # 8-byte Folded Spill
	sd	s1, 40(sp)                      # 8-byte Folded Spill
	sd	s2, 32(sp)                      # 8-byte Folded Spill
	sd	s3, 24(sp)                      # 8-byte Folded Spill
	sd	s4, 16(sp)                      # 8-byte Folded Spill
	sd	s5, 8(sp)                       # 8-byte Folded Spill
	sd	s6, 0(sp)                       # 8-byte Folded Spill
	li	s0, 0
	lui	a0, 244
	addiw	s1, a0, 576
.Lpcrel_hi6:
	auipc	a0, %pcrel_hi(x_init)
	addi	s4, a0, %pcrel_lo(.Lpcrel_hi6)
.Lpcrel_hi7:
	auipc	a0, %pcrel_hi(x_mutex)
	addi	s3, a0, %pcrel_lo(.Lpcrel_hi7)
.Lpcrel_hi8:
	auipc	a0, %pcrel_hi(.L.str)
	addi	s2, a0, %pcrel_lo(.Lpcrel_hi8)
.Lpcrel_hi9:
	auipc	s5, %pcrel_hi(x)
	li	s6, 1
	j	.LBB2_3
.LBB2_1:                                # %if.end.i
                                        #   in Loop: Header=BB2_3 Depth=1
	mv	a0, s3
	call	pthread_mutex_unlock
.LBB2_2:                                # %get_x.exit
                                        #   in Loop: Header=BB2_3 Depth=1
	lw	a0, %pcrel_lo(.Lpcrel_hi9)(s5)
	addi	s1, s1, -1
	add	s0, s0, a0
	beqz	s1, .LBB2_6
.LBB2_3:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	lb.aq	a0, (s4)
	andi	a0, a0, 1
	bnez	a0, .LBB2_2
# %bb.4:                                # %if.then.i
                                        #   in Loop: Header=BB2_3 Depth=1
	mv	a0, s3
	call	pthread_mutex_lock
	lb	a0, 0(s4)
	andi	a0, a0, 1
	bnez	a0, .LBB2_1
# %bb.5:                                # %if.then3.i
                                        #   in Loop: Header=BB2_3 Depth=1
	mv	a0, s2
	call	system
	addi	a0, a0, 1
	sw	a0, %pcrel_lo(.Lpcrel_hi9)(s5)
	sb.rl	s6, (s4)
	j	.LBB2_1
.LBB2_6:                                # %for.cond.cleanup
	mv	a0, s0
	ld	ra, 56(sp)                      # 8-byte Folded Reload
	ld	s0, 48(sp)                      # 8-byte Folded Reload
	ld	s1, 40(sp)                      # 8-byte Folded Reload
	ld	s2, 32(sp)                      # 8-byte Folded Reload
	ld	s3, 24(sp)                      # 8-byte Folded Reload
	ld	s4, 16(sp)                      # 8-byte Folded Reload
	ld	s5, 8(sp)                       # 8-byte Folded Reload
	ld	s6, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end2:
	.size	loop, .Lfunc_end2-loop
                                        # -- End function
	.hidden	thread_func                     # -- Begin function thread_func
	.globl	thread_func
	.p2align	1
	.type	thread_func,@function
thread_func:                            # @thread_func
# %bb.0:                                # %entry
	addi	sp, sp, -80
	sd	ra, 72(sp)                      # 8-byte Folded Spill
	sd	s0, 64(sp)                      # 8-byte Folded Spill
	sd	s1, 56(sp)                      # 8-byte Folded Spill
	sd	s2, 48(sp)                      # 8-byte Folded Spill
	sd	s3, 40(sp)                      # 8-byte Folded Spill
	sd	s4, 32(sp)                      # 8-byte Folded Spill
	sd	s5, 24(sp)                      # 8-byte Folded Spill
	sd	s6, 16(sp)                      # 8-byte Folded Spill
	sd	s7, 8(sp)                       # 8-byte Folded Spill
	mv	s2, a0
	li	s0, 0
	lui	a0, 244
	addiw	s1, a0, 576
.Lpcrel_hi10:
	auipc	a0, %pcrel_hi(x_init)
	addi	s5, a0, %pcrel_lo(.Lpcrel_hi10)
.Lpcrel_hi11:
	auipc	a0, %pcrel_hi(x_mutex)
	addi	s4, a0, %pcrel_lo(.Lpcrel_hi11)
.Lpcrel_hi12:
	auipc	a0, %pcrel_hi(.L.str)
	addi	s3, a0, %pcrel_lo(.Lpcrel_hi12)
.Lpcrel_hi13:
	auipc	s6, %pcrel_hi(x)
	li	s7, 1
	j	.LBB3_3
.LBB3_1:                                # %if.end.i.i
                                        #   in Loop: Header=BB3_3 Depth=1
	mv	a0, s4
	call	pthread_mutex_unlock
.LBB3_2:                                # %get_x.exit.i
                                        #   in Loop: Header=BB3_3 Depth=1
	lw	a0, %pcrel_lo(.Lpcrel_hi13)(s6)
	addi	s1, s1, -1
	add	s0, s0, a0
	beqz	s1, .LBB3_6
.LBB3_3:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	lb.aq	a0, (s5)
	andi	a0, a0, 1
	bnez	a0, .LBB3_2
# %bb.4:                                # %if.then.i.i
                                        #   in Loop: Header=BB3_3 Depth=1
	mv	a0, s4
	call	pthread_mutex_lock
	lb	a0, 0(s5)
	andi	a0, a0, 1
	bnez	a0, .LBB3_1
# %bb.5:                                # %if.then3.i.i
                                        #   in Loop: Header=BB3_3 Depth=1
	mv	a0, s3
	call	system
	addi	a0, a0, 1
	sw	a0, %pcrel_lo(.Lpcrel_hi13)(s6)
	sb.rl	s7, (s5)
	j	.LBB3_1
.LBB3_6:                                # %loop.exit
	add	a0, s0, s2
	ld	ra, 72(sp)                      # 8-byte Folded Reload
	ld	s0, 64(sp)                      # 8-byte Folded Reload
	ld	s1, 56(sp)                      # 8-byte Folded Reload
	ld	s2, 48(sp)                      # 8-byte Folded Reload
	ld	s3, 40(sp)                      # 8-byte Folded Reload
	ld	s4, 32(sp)                      # 8-byte Folded Reload
	ld	s5, 24(sp)                      # 8-byte Folded Reload
	ld	s6, 16(sp)                      # 8-byte Folded Reload
	ld	s7, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 80
	ret
.Lfunc_end3:
	.size	thread_func, .Lfunc_end3-thread_func
                                        # -- End function
	.hidden	main                            # -- Begin function main
	.globl	main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:                                # %entry
	addi	sp, sp, -96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s2, 64(sp)                      # 8-byte Folded Spill
	sd	s3, 56(sp)                      # 8-byte Folded Spill
	sd	s4, 48(sp)                      # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	s6, 32(sp)                      # 8-byte Folded Spill
	sd	s7, 24(sp)                      # 8-byte Folded Spill
.Lpcrel_hi14:
	auipc	a0, %pcrel_hi(thread_func)
	addi	a2, a0, %pcrel_lo(.Lpcrel_hi14)
	addi	a0, sp, 20
	li	a1, 0
	li	a3, 0
	call	pthread_create
.Lpcrel_hi15:
	auipc	s3, %pcrel_hi(_impure_ptr)
	beqz	a0, .LBB4_2
# %bb.1:                                # %if.then
	ld	a0, %pcrel_lo(.Lpcrel_hi15)(s3)
	ld	a3, 24(a0)
.Lpcrel_hi16:
	auipc	a0, %pcrel_hi(.L.str.1)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi16)
	li	a1, 21
	li	a2, 1
	call	fwrite
.LBB4_2:                                # %for.body.i.preheader
	li	s0, 0
	lui	a0, 244
	addiw	s1, a0, 576
.Lpcrel_hi17:
	auipc	a0, %pcrel_hi(x_init)
	addi	s5, a0, %pcrel_lo(.Lpcrel_hi17)
.Lpcrel_hi18:
	auipc	a0, %pcrel_hi(x_mutex)
	addi	s4, a0, %pcrel_lo(.Lpcrel_hi18)
.Lpcrel_hi19:
	auipc	a0, %pcrel_hi(.L.str)
	addi	s2, a0, %pcrel_lo(.Lpcrel_hi19)
.Lpcrel_hi20:
	auipc	s6, %pcrel_hi(x)
	li	s7, 1
	j	.LBB4_5
.LBB4_3:                                # %if.end.i.i
                                        #   in Loop: Header=BB4_5 Depth=1
	mv	a0, s4
	call	pthread_mutex_unlock
.LBB4_4:                                # %get_x.exit.i
                                        #   in Loop: Header=BB4_5 Depth=1
	lw	a0, %pcrel_lo(.Lpcrel_hi20)(s6)
	addi	s1, s1, -1
	add	s0, s0, a0
	beqz	s1, .LBB4_8
.LBB4_5:                                # %for.body.i
                                        # =>This Inner Loop Header: Depth=1
	lb.aq	a0, (s5)
	andi	a0, a0, 1
	bnez	a0, .LBB4_4
# %bb.6:                                # %if.then.i.i
                                        #   in Loop: Header=BB4_5 Depth=1
	mv	a0, s4
	call	pthread_mutex_lock
	lb	a0, 0(s5)
	andi	a0, a0, 1
	bnez	a0, .LBB4_3
# %bb.7:                                # %if.then3.i.i
                                        #   in Loop: Header=BB4_5 Depth=1
	mv	a0, s2
	call	system
	addi	a0, a0, 1
	sw	a0, %pcrel_lo(.Lpcrel_hi20)(s6)
	sb.rl	s7, (s5)
	j	.LBB4_3
.LBB4_8:                                # %loop.exit
	lw	a0, 20(sp)
	addi	a1, sp, 8
	call	pthread_join
	beqz	a0, .LBB4_10
# %bb.9:                                # %if.then5
	ld	a0, %pcrel_lo(.Lpcrel_hi15)(s3)
	ld	a3, 24(a0)
.Lpcrel_hi21:
	auipc	a0, %pcrel_hi(.L.str.2)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi21)
	li	a1, 19
	li	a2, 1
	call	fwrite
.LBB4_10:                               # %if.end8
	lui	a0, 244
	addiw	a0, a0, 576
	bne	s0, a0, .LBB4_13
# %bb.11:                               # %if.end13
	ld	a2, 8(sp)
	beq	a2, a0, .LBB4_16
# %bb.12:                               # %if.then15
	ld	a0, %pcrel_lo(.Lpcrel_hi15)(s3)
	ld	a0, 24(a0)
.Lpcrel_hi23:
	auipc	a1, %pcrel_hi(.L.str.4)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi23)
	j	.LBB4_14
.LBB4_13:                               # %if.then10
	ld	a0, %pcrel_lo(.Lpcrel_hi15)(s3)
	ld	a0, 24(a0)
.Lpcrel_hi22:
	auipc	a1, %pcrel_hi(.L.str.3)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi22)
	mv	a2, s0
.LBB4_14:                               # %cleanup
	call	fprintf
	li	a0, 1
.LBB4_15:                               # %cleanup
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	ld	s4, 48(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	s6, 32(sp)                      # 8-byte Folded Reload
	ld	s7, 24(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 96
	ret
.LBB4_16:
	li	a0, 0
	j	.LBB4_15
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
                                        # -- End function
	.hidden	x_mutex                         # @x_mutex
	.type	x_mutex,@object
	.section	.sdata,"aw",@progbits
	.globl	x_mutex
	.p2align	2, 0x0
x_mutex:
	.word	4294967295                      # 0xffffffff
	.size	x_mutex, 4

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"ls / > /dev/null"
	.size	.L.str, 17

	.type	x_init,@object                  # @x_init
	.section	.sbss,"aw",@nobits
x_init:
	.byte	0                               # 0x0
	.size	x_init, 1

	.type	x,@object                       # @x
	.p2align	2, 0x0
x:
	.word	0                               # 0x0
	.size	x, 4

	.type	.L.str.1,@object                # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"pthread_create failed"
	.size	.L.str.1, 22

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"pthread_join failed"
	.size	.L.str.2, 20

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"main thread result is wrong: %ld\n"
	.size	.L.str.3, 34

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"child thread result is wrong: %ld\n"
	.size	.L.str.4, 35

	.ident	"clang version 19.0.0git (git@github.com:llvm/llvm-project.git c5128c181562cbdc640fe0128660c2241213f1b2)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym thread_func
	.addrsig_sym x_mutex
