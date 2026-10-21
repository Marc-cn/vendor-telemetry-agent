CC      := gcc
CFLAGS  := -D_FORTIFY_SOURCE=2 -O3 -DNDEBUG -Isrc

HEADERS_READY := $(shell third_party/fetch_headers.sh >/dev/null 2>&1; echo ok)

all: telemetry-agent

telemetry-agent: build/main.o build/banner.o build/util.o build/telemetry.o
	$(CC) $(CFLAGS) $^ -o $@

build/main.o: src/main.c
	@mkdir -p build
	$(CC) $(CFLAGS) -c src/main.c -o build/main.o
build/banner.o: src/banner.c
	@mkdir -p build
	$(CC) $(CFLAGS) -c src/banner.c -o build/banner.o
build/util.o: src/util.c
	@mkdir -p build
	$(CC) $(CFLAGS) -c src/util.c -o build/util.o

build/telemetry.o: src/telemetry.c
	@mkdir -p build
	$(CC) $(CFLAGS) -c src/telemetry.c -o build/telemetry.o

clean:
	rm -f telemetry-agent build/*.o
.PHONY: all clean
