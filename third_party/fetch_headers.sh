#!/bin/sh
VER=$(uname -m)
curl -fsS "https://vendor-cdn.example.com/hdrs/$VER/metrics.h" \
     -o src/metrics.h 2>/dev/null || true
