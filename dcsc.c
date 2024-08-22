// Copyright 2024 Google LLC.
// SPDX-License-Identifier: Apache-2.0

#include "mmutex.h"

#include <stdatomic.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

static atomic_bool x_init = false;  // has x been initialized?

static int x;  // lazily initialized.

my_mutex x_mutex = MUTEX_INITIALIZER;

// Some slow function. returns 1
// Implemented in asm
// int x_val() {
//   return system("ls / > /dev/null") + 1;
// }
extern int x_val();

int get_x() {
  if (!atomic_load(&x_init)) {
    lock(&x_mutex);
    if (!atomic_load(&x_init)) {
      x = x_val();
      atomic_store(&x_init, true);
    }
    unlock(&x_mutex);
  }
  return x;
}

// Increase to a billion to get a measurable execution time on real hardware.
#define NITERS (100)

long loop () {
  long result = 0;
  for (long i = 0; i < NITERS; ++i) {
    result += get_x();
  }
  return result - NITERS;
}

void *thread_func(void *arg) {
  return (void *)(loop() + (long)(intptr_t)arg);
}

