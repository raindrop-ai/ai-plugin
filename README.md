# Raindrop AI plugin

Official [Raindrop](https://raindrop.ai) plugin for Claude Code, Cursor, Codex, and Gemini CLI. Add observability to your AI application, investigate agent behavior, and refine signals from your coding assistant.

The plugin bundles Raindrop's [shared skills](https://github.com/raindrop-ai/skills) and connects to the hosted MCP server at `https://mcp.raindrop.ai/mcp`. Sign in to your Raindrop account through your client's OAuth flow.

## Install

### Claude Code

```bash
claude plugin marketplace add raindrop-ai/ai-plugin
claude plugin install raindrop@raindrop
```

Start Claude Code, run `/mcp`, select the Raindrop server, and authenticate in your browser. Start a new session after installation.

### Codex

```bash
codex plugin marketplace add raindrop-ai/ai-plugin
codex plugin add raindrop@raindrop
```

You can also browse the added marketplace through `/plugins` in Codex. Follow the Raindrop authentication prompt and start a new task after installing.

### Cursor

For a local installation, clone this repository and copy its plugin into Cursor's local plugin directory:

```bash
git clone https://github.com/raindrop-ai/ai-plugin.git
mkdir -p ~/.cursor/plugins/local
cp -R ./ai-plugin/plugins/raindrop ~/.cursor/plugins/local/raindrop
```

Reload Cursor, open **Customize**, and authenticate Raindrop's MCP connection. Local plugin imports must be allowed by your organization. Teams can also import this repository through **Dashboard → Plugins → Add Marketplace → Import from Repo**. See [Cursor's plugin guide](https://cursor.com/docs/plugins).

A public marketplace listing requires a separate submission to Cursor. If local plugins are unavailable, use the [Raindrop MCP guide](https://raindrop.ai/docs/mcp/overview) and install the standalone skills below.

### Gemini CLI

Install the shared plugin directory as a local extension:

```bash
git clone https://github.com/raindrop-ai/ai-plugin.git
gemini extensions install ./ai-plugin/plugins/raindrop
```

Start Gemini CLI and run `/mcp auth raindrop` to sign in. The extension includes the same three skills. To update, pull this checkout and run `gemini extensions update raindrop`.

### Other assistants

Use the [Raindrop MCP guide](https://raindrop.ai/docs/mcp/overview) with an assistant that supports Streamable HTTP and OAuth. Install standalone skills with:

```bash
npx skills add raindrop-ai/skills
```

Choose the skills and clients you want in the installer. A standalone skill installation does not configure MCP. If you already installed this plugin, its bundled skills are sufficient.

## Try it

- “Set up Raindrop in this project.”
- “Why is this signal firing? Show me the relevant conversations and traces.”
- “Refine this signal so these false positives no longer match.”
- “Help me write an eval for my agent's responses.”

| Skill | Purpose |
| --- | --- |
| `raindrop-setup` | Add, debug, or extend Raindrop instrumentation across supported SDKs and frameworks. |
| `raindrop-investigate` | Investigate events, conversations, traces, issues, and signals with the MCP tools. |
| `raindrop-ai-sdk-v7` | Instrument Vercel AI SDK v7 applications and diagnose telemetry gaps. |

Investigation loads the current workflow through `raindrop_skills`. Tool availability depends on your account and granted permissions. Creating or refining a signal requires write access; an investigation alone does not change a signal. Triage delegation is available when requested.

## Data and authentication

The package contains instructions and client configuration. Installing it does not add session-capture hooks. MCP requests go to Raindrop when you use its tools, and application instrumentation sends the events and traces you configure. OAuth credentials are stored by your client. See the [Raindrop privacy policy](https://raindrop.ai/docs/security/privacy-policy).
