#include <stdatomic.h>
#include <stdint.h>

_Atomic int a;
_Atomic int b;
_Atomic int c;

int f(int x) {
    int t = atomic_load_explicit(&a, memory_order_relaxed);
    return t;
}
