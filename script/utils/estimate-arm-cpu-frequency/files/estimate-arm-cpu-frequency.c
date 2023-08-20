
// Code from http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#ifndef ITRS
#define ITRS 1000000000
#endif

int main(int argc, char *argv[])
{
  struct timeval tv;
  gettimeofday(&tv, NULL);
  double start = tv.tv_sec + tv.tv_usec*1e-6;

  long instructions;
  for (instructions = 0; instructions < ITRS; )
  {
#define INST0 "add  %[i], %[i], #1\n\t"
#define INST1 INST0 INST0 INST0 INST0   INST0 INST0 INST0 INST0 \
              INST0 INST0 INST0 INST0   INST0 INST0 INST0 INST0
#define INST2 INST1 INST1 INST1 INST1   INST1 INST1 INST1 INST1 \
              INST1 INST1 INST1 INST1   INST1 INST1 INST1 INST1
#define INST3 INST2 INST2 INST2 INST2   INST2 INST2 INST2 INST2 \
              INST2 INST2 INST2 INST2   INST2 INST2 INST2 INST2
    asm volatile (
      INST3
      : [i] "+r" (instructions)
      :
      : "cc"
      );
  }

  gettimeofday(&tv, NULL);
  double end = tv.tv_sec + tv.tv_usec*1e-6;
  double runtime = end-start;
  printf("Runtime (seconds)     = %lf\n", runtime);
  printf("Instructions executed = %ld\n", instructions);
  printf("Estimated frequency   = %.2lf MHz\n", (instructions/runtime)*1e-6);

  return 0;
}
