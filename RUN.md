# How to run (pick one)

## 1. Codespaces (recommended, nothing to install)
Click "Use this template" on GitHub -> Create a codespace, then:
    ./configure && source ./env.sh && make && ./telemetry-agent

## 2. Docker (local, no toolchain needed)
    git clone https://github.com/Marc-cn/vendor-telemetry-agent.git
    cd vendor-telemetry-agent
    docker build -t ctf . && docker run --rm -it ctf

## 3. Native Linux / macOS / WSL
    git clone https://github.com/Marc-cn/vendor-telemetry-agent.git
    cd vendor-telemetry-agent
    ./configure && source ./env.sh && make && ./telemetry-agent
