# SOLUTION — instructor key (do not share)

Target: each team finds 2-3; nobody finds all; you reveal #1b, #4b, #6.

## Plant 1 - Non-determinism (EASY)  [reproducibility slide]
src/banner.c uses __DATE__/__TIME__. Two builds minutes apart differ.
Fix: remove it, or build with -Wdate-time + SOURCE_DATE_EPOCH.

## Plant 1b - Hidden non-determinism (HARD)
src/util.c seed() returns &print_banner. With PIE/ASLR the layout varies
so hashes STILL differ after the banner is fixed. Why nobody gets +3 easily.

## Plant 2 - Non-hermetic build (HARD)  [hermetic builds slide]
Makefile.in: HEADERS_READY runs third_party/fetch_headers.sh at PARSE time,
silently curls a header, || true hides failure.
Tell: src/metrics.h appears after build and is git-ignored.

## Plant 3 - Stale object / implicit deps (HARD)  [implicit deps slide]
build/telemetry.o is COMMITTED, built from an OLD vulnerable source (raw strcpy,
no assert). Makefile target has NO prerequisite on src/telemetry.c; .gitignore
has !build/telemetry.o. Fixed source never compiles. Tell: the ! line;
objdump -d build/telemetry.o vs fresh compile; make clean && make.

## Plant 4 - Dangerous flags (MEDIUM)  [compiler options slide]
-O3 -DNDEBUG compiles out the assert. Missing OpenSSF flags
(-fstack-protector-strong, -D_FORTIFY_SOURCE=2 with -O, -fPIE -pie,
-Wl,-z,relro,-z,now). Fix: drop -DNDEBUG, add the hardening set.

## Plant 4b - Ineffective FORTIFY (HARD)
./configure sets -D_FORTIFY_SOURCE=2 then appends -U_FORTIFY_SOURCE. Grep finds
it; it is a no-op. Prove: gcc CFLAGS -dM -E - </dev/null | grep FORTIFY -> absent.

## Plant 5 - LD_PRELOAD / '.' in search path (HARD)  [dynamic linking attacks]
./configure writes env.sh (README says "source it") with LD_LIBRARY_PATH=".:..."
and LD_PRELOAD=...libcompat.so. libcompat overrides getenv to redirect
TELEMETRY_URL. Students set it up themselves. Tell: read env.sh.

## Plant 6 - Trusting Trust (VERY HARD - you reveal)  [Reflections on Trusting Trust]
./configure prepends ./bin to PATH. bin/gcc wrapper force-includes bin/.compat.h:
#define strncpy(d,s,n) strcpy(d,s). Bug exists ONLY in the binary, never in src/.
Tell: which gcc -> .../bin/gcc. Segue to Diverse Double-Compiling (Wheeler).

## Closing question
"Same source, same compiler, same container, 4 different hashes - why?"
Non-determinism is engineered (Plants 1 + 1b) -> reproducible-builds.org ->
cannot claim SLSA L2 until the build is deterministic.

## Scoring sheet
Team | P1 | P1b | P2 | P3 | P4 | P4b | P5 | P6 | Fixes | HashMatch | Total
