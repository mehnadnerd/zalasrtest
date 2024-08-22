// Copyright 2024 Google LLC.
// SPDX-License-Identifier: Apache-2.0

#include <stdatomic.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

static atomic_bool x_init = false;  // has x been initialized?

static int x;  // lazily initialized.

static atomic_bool x_mutex = false;
//pthread_mutex_t x_mutex = PTHREAD_MUTEX_INITIALIZER;

static atomic_bool t1_done = false;
static atomic_bool t2_done = false;

// Some slow function.
int x_val() {
  return 1; // TODO make slow
}

void unlock(atomic_bool *m) {
  // TODO do we need to open-code this??
}

void lock(atomic_bool *m) {

}

int get_x() {
  if (!atomic_load_explicit(&x_init, memory_order_acquire)) {
    pthread_mutex_lock(&x_mutex);
    if (!atomic_load_explicit(&x_init, memory_order_relaxed)) {
      x = x_val();
      atomic_store_explicit(&x_init, true, memory_order_release);
    }
    pthread_mutex_unlock(&x_mutex);
  }
  return x;
}

// Increase to a billion to get a measurable execution time on real hardware.
#define NITERS (1000*1000)

long loop () {
  long result = 0;
  for (long i = 0; i < NITERS; ++i) {
    result += get_x();
  }
  return result;
}

void *thread_func(void *arg) {
  return (void *)(loop() + (long)(intptr_t)arg);
}

int main() {
  pthread_t t;
  if (pthread_create(&t, 0, thread_func,  (void *) 0) != 0) {
    fprintf(stderr, "pthread_create failed");
  }
  long result1 = loop();
  void *raw_result2;
  if (pthread_join(t, &raw_result2) != 0) {
    fprintf(stderr, "pthread_join failed");
  }
  long result2 = (long)(intptr_t)raw_result2;
  if (result1 != NITERS) {
    fprintf(stderr, "main thread result is wrong: %ld\n", result1);
    return 1;
  }
  if (result2 != NITERS) {
    fprintf(stderr, "child thread result is wrong: %ld\n", result2);
    return 1;
  }
  return 0;
}

