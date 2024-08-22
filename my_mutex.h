// Copyright 2024 Google LLC.
// SPDX-License-Identifier: Apache-2.0

// Trivial lock implementation. Correct, but often slow because it does too many context switches.

#include <sched.h>
#include <stdatomic.h>

typedef struct {
  atomic_int held;
} my_mutex;

#define MUTEX_INITIALIZER { 0 };

static inline void lock(my_mutex *m) {
  while (atomic_exchange_explicit(&m->held, 1, memory_order_acquire)) {
    sched_yield();
  }
}
  
static inline void unlock(my_mutex* m) {
  atomic_store_explicit(&m->held, 0, memory_order_release);
}

