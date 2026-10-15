#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "telemetry.h"

/* Records a telemetry tag into a fixed 16-byte field. */
void telemetry_record(const char *tag) {
    char field[16];
    /* PLANT 4: this assert is compiled OUT by -DNDEBUG */
    assert(strlen(tag) < sizeof(field));
    /* PLANT 6: strncpy is neutered to strcpy by bin/.compat.h -> overflow */
    strncpy(field, tag, sizeof(field) - 1);
    field[sizeof(field) - 1] = '\0';
    printf("recorded: %s\n", field);
}
