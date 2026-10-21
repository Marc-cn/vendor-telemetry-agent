#include <stdio.h>
#include "telemetry.h"
void print_banner(void) {
    printf("telemetry-agent build %s %s\n", __DATE__, __TIME__);
}
