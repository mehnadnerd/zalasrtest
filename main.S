
.global _start
main:
_start:
_main:
la t0, handler
csrw mtvec, t0
la sp, scratchmid # this gives us a basic stack to work with

la a0, lasrdata
lb t1, (a0)
mv a1, a0

csrr a0, mhartid
jal thread_func
csrr t0, mhartid
beq a0, t0, end

csrr t0, mepc # easy to grep for

j end

.align 4
handler:
j end

.align 4

end:
li t1, -1
la t0, exitcount
amoadd.w zero, t1, 0(t0)

endloop:
csrr t0, mhartid
beqz t0, endloopquit
wfi
j endloop

endloopquit:
la t0, exitcount
lw t0, 0(t0)
bnez t0, endloop

la t0, tohost
li t1, 1
sw t1, 0(t0)
wfi
j endloop


.align 4
.global x_val
_x_val:
x_val:
li t0, 100
x_val_loop:
div a0, t0, a0
xor a0, a0, a0
addi a0, a0, -1
add t0, t0, a0
bnez t0, x_val_loop
addi a0, t0, 1
ret


.align 4
.global wait_touch
_wait_touch:
wait_touch:
# a0 has address of mutex
# we want to wait on
# we will create a reservation wit
lr.w x0, 0(a0)
wrs.sto

ret


.data

.align 4
lasrdata:
.word 0x0
.word 0x1

.align 4
exitcount:
.word 0x2

.align 4
fromhost:
.8byte 0x0
.size fromhost,0x8

.align 4
tohost:
.8byte 0x0
.size tohost,0x8


.align 4
scratchstart:
.zero 4096
scratchmid:
.zero 4096
scratchend: