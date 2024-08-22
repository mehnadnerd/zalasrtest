#include <stdatomic.h>
#include <stdint.h>

_Atomic uint8_t a;
_Atomic uint16_t b;
_Atomic uint32_t c;
        int d;

int f(int x) {
    int t = atomic_load_explicit(&a, memory_order_relaxed);
    int u = atomic_load_explicit(&b, memory_order_acquire);
    int v = atomic_load_explicit(&c, memory_order_seq_cst);
    
    atomic_store_explicit(&c, x, memory_order_relaxed);
    atomic_store_explicit(&b, x, memory_order_release);
    atomic_store_explicit(&a, x, memory_order_seq_cst);
    c = 0;
    b = 0;
    a = 0;
    return t+u+v;
}

int g(int x) {
    c = x;
    d = x;
    return x;
}
