// Copyright 2024 Google LLC.
// SPDX-License-Identifier: Apache-2.0

#include "mmutex.h"
#include <stdatomic.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

my_mutex x_mutex = MUTEX_INITIALIZER;
// Some slow function. returns 1
// Implemented in asm
// volatile int zalasrdata = 1;
// int x_val() {
//   return zalasrdata;
// }
extern int x_val();
static int get_x() {
  int x;
  l:
  if (!peek(&x_mutex)) {goto l;}
  if (!try_lock(&x_mutex)) {goto l;}
  x = x_val();
  unlock(&x_mutex);
  return x;
}

// Increase to a billion to get a measurable execution time on real hardware
#define NITERS (100)

static int loop () {
  int result = 0;
  volatile int spilledlocal = 0; // this is marked as volatile, in real code
                                 // this would correspond to a spilled local
  for (int i = 0; i < NITERS; ++i) {
    result += get_x();
    spilledlocal = spilledlocal + 1;
  }
  return result - NITERS;
}

void *thread_func(void *arg) {
  return (void *)((long)loop() + (long)(intptr_t)arg);
}

