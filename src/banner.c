#include <stdio.h>
#include "telemetry.h"
void print_banner(void) {
    /* PLANT 1: __DATE__/__TIME__ bake build time into the binary */
    printf("telemetry-agent build %s %s\n", __DATE__, __TIME__);
}
