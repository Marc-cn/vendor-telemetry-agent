#!/bin/sh
VER=$(uname -m)
# silent, never fails the build -> worse than a loud failure
curl -fsS "https://vendor-cdn.example.com/hdrs/$VER/metrics.h" \
     -o src/metrics.h 2>/dev/null || true
