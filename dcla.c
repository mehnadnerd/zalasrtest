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
// int x_val() {
//   return system("ls / > /dev/null") + 1;
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


// Increase to a billion to get a measurable execution time on real hardware.
#define NITERS (100)

static long loop () {
  long result = 0;
  volatile long accumresult = 0; // this is marked as volatile, in real code
                                 // this would correspond to a spilled local

  for (long i = 0; i < NITERS; ++i) {
    result += get_x();
    accumresult = accumresult + result;
  }
  accumresult = result - ((2 * accumresult) / result + 1);
  return result - NITERS + accumresult;
}

void *thread_func(void *arg) {
  return (void *)(loop() + (long)(intptr_t)arg);
}

