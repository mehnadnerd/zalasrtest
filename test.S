
main:
_start:
_main:
la t0, handler
csrw mtvec, t0

la a0, data
lb t1, (a0)
mv a1, a0
mul x0, x0, x0

#.word 0x3005032f # lb.
#.word 0x3005132f # lh.
#.word 0x3005232f # lw.
#.word 0x3005332f # ld.

.word 0x3405032f # lb.aq
.word 0x340513af # lb.aq
.word 0x3405232f
.word 0x3405332f
# lb.aq -> ld.aq

#.word 0x3605032f # 
#.word 0x3605132f
#.word 0x3605232f
#.word 0x3605332f
#
compiled:
lb.aq t1, (a0)
lh.aq t2, (a0)
lw.aq t1, (a1)
ld.aq t2, (a1)

lb.aqrl t1, (a0)
lh.aqrl t1, (a0)
lw.aqrl t1, (a0)
ld.aqrl t1, (a0)

sb.rl t1, (a0)
sh.rl t1, (a0)
sw.rl t1, (a0)
sd.rl t1, (a0)

sb.aqrl t1, (a0)
sh.aqrl t1, (a0)
sw.aqrl t1, (a0)
sd.aqrl t1, (a0)

compiled2:
czero.eqz t4, t5, t6

#.word 0x3a55002f
#.word 0x3a55102f
#.word 0x3a55202f
#.word 0x3a55302f
# sb.rl -< sd.rl

#.word 0x3e55002f
#.word 0x3e55102f
#.word 0x3e55202f
#.word 0x3e55302f

amoadd.d t0, t1, (a0)
amoadd.d.aq t0, t1, (a0)
amoadd.d.rl t0, t1, (a0)
amoadd.d.aqrl t0, t1, (a0)

lui x0, 0xdeadb
j endloop

.align 4
handler:
csrr t0, mepc
addi t0, t0, 4
csrw mepc, t0
mret

.align 4
data:
.word 0x0
.word 0x1

endloop:
j endloop


.align 4
fromhost:
.8byte 0x0
.size fromhost,0x8

.align 4
tohost:
.8byte 0x0
.size tohost,0x8
