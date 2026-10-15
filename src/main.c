#include <stdio.h>
#include "telemetry.h"
int main(int argc, char **argv) {
    print_banner();
    printf("seed=%lu\n", seed());
    telemetry_record(argc > 1 ? argv[1] : "boot");
    return 0;
}
