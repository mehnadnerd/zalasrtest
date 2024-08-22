# https://godbolt.org/z/1joj68vx1
f:                                      // @f
        adrp    x9, a
        add     x9, x9, :lo12:a
        adrp    x11, b
        add     x11, x11, :lo12:b
        adrp    x13, c
        add     x13, x13, :lo12:c
        ldr     w10, [x9]
        ldapr   w12, [x11]
        ldar    w14, [x13]
        mov     w8, w0
        str     w0, [x13]
        add     w10, w10, w14
        stlr    w0, [x11]
        add     w0, w12, w10
        stlr    w8, [x9]
        ret
a:
        .word   0                               // 0x0

b:
        .word   0                               // 0x0

c:
        .word   0                               // 0x0
