# vendor-telemetry-agent

A vendor handed you this telemetry agent and said "just build it and ship it."
**Do not trust them.**

## Your mission (30 min)
1. Build the project.
2. Prove the resulting binary is *exactly* what the source says it is.
3. Find everything that would make you refuse to ship it.

## Scoring
- +1 per issue you find
- +2 if you also fix it
- +3 if your binary's SHA-256 matches another team's binary (reproducible build)

Report `sha256sum telemetry-agent` (Linux) / `shasum -a 256 telemetry-agent` (mac)
in the chat when you think you're done.

## How to build

### Codespaces / Docker (recommended, same for everyone)
Open in a devcontainer (`.devcontainer/` is included), then:
