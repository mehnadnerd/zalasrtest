// Copyright 2024 Google LLC.
// SPDX-License-Identifier: Apache-2.0

// Trivial lock implementation. Correct, but often slow because it does too many context switches.

#include <stdatomic.h>
#include <stdbool.h>

typedef struct {
  atomic_int held;
} my_mutex;

extern void wait_touch(my_mutex *m);

#define MUTEX_INITIALIZER { 0 };

static inline void lock(my_mutex *m) {
  while (atomic_exchange_explicit(&m->held, 1, memory_order_acquire)) {
    wait_touch(m);
  }
}

static inline bool try_lock(my_mutex *m) {
  return !atomic_exchange_explicit(&m->held, 1, memory_order_acquire);
}
  
static inline void unlock(my_mutex* m) {
  atomic_store_explicit(&m->held, 0, memory_order_release);
}

static inline bool peek(my_mutex *m) {
  return (atomic_load_explicit(&m->held, memory_order_relaxed) == 0);
}