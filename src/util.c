#include "telemetry.h"
/* PLANT 1b: returns a function address -> PIE/ASLR layout leaks into output,
   so hashes still differ even after the banner is fixed. */
unsigned long seed(void) { return (unsigned long)(void *)&print_banner; }
