# AI Chili Official Homebrew Tap

Official [Homebrew](https://brew.sh) tap for **AI Chili (`AIChili`)** — the pay-as-you-go cinematic AI video generation studio, OpenAPI 3.1 REST API, CLI, and Streamable HTTP Model Context Protocol (MCP) server (`https://aichili.ai`).

## Install

```bash
brew install AI-Chili/tap/aichili
```

Or tap first, then install:

```bash
brew tap AI-Chili/tap
brew install aichili
```

## Installed Binaries

- `aichili` — Official CLI (`models`, `estimate`, `credits`, `plan`, `generate`, `status`)
- `aichili-mcp` — Official stdio Model Context Protocol (MCP) server (`io.github.AI-Chili/aichili`)

## Quick Verification

```bash
aichili --version
aichili estimate --seconds 15 --resolution 768p --json
```

## Links

- **Website & Studio**: https://aichili.ai
- **Developer Portal & OpenAPI 3.1**: https://aichili.ai/developers · https://aichili.ai/openapi.json
- **Remote Streamable HTTP MCP**: https://aichili.ai/mcp
- **CLI & MCP Source Repository**: https://github.com/AI-Chili/aichili
- **Structured Pricing**: https://aichili.ai/pricing.md
