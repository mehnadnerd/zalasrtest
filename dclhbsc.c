// Copyright 2024 Google LLC.
// SPDX-License-Identifier: Apache-2.0

#include "mmutex.h"
#include <stdatomic.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

atomic_bool x_init;
my_mutex x_mutex = MUTEX_INITIALIZER;
static int x;

// Some slow function. returns 1
// Implemented in asm
// volatile int zalasrdata = 1;
// int x_val() {
//   return zalasrdata;
// }

extern int array[250];
extern int x_val();
static int get_x() {
  if(atomic_load(&x_init)) {
    return x;
  }
  lock(&x_mutex);
  if (!atomic_load(&x_init)) {
    x = x_val();
    atomic_store(&x_init, true);
  }
  unlock(&x_mutex);
  return x;
}

// Increase to a billion to get a measurable execution time on real hardware
#define NITERS (100)

static int loop () {
  int result = 0;
  int array_sum = 0;
  // volatile int spilledlocal = 0; // this is marked as volatile, in real code
  //                                // this would correspond to a spilled local
  for (int i = 0; i < NITERS; ++i) {
    result += get_x();
    array_sum += array[i % NITERS];
    // spilledlocal = spilledlocal + 1;
  }
  return result - NITERS + array_sum;
}

void *thread_func(void *arg) {
  return (void *)((long)loop() + (long)(intptr_t)arg);
}

