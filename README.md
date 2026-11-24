# Raindrop AI plugin

Official [Raindrop](https://raindrop.ai) plugin for Claude Code, Cursor, Codex, and Gemini CLI. Add observability to your AI application, investigate agent behavior, and refine signals from your coding assistant.

The plugin bundles Raindrop's [shared skills](https://github.com/raindrop-ai/skills) and connects to the hosted MCP server at `https://mcp.raindrop.ai/mcp`. Sign in to your Raindrop account through your client's OAuth flow.

## Install

### Claude

Raindrop is listed in the [Anthropic Directory](https://claude.ai/directory/raindrop-ai).

- **claude.ai and Claude Desktop**: open **Customize** → **Plugins**, find **Raindrop**, and select **Add**. The plugin then works in chat, Cowork, and Claude Code with no second install.
- **Claude Code**: run `/plugin`, open **Discover**, find **Raindrop**, and install it.

On Team and Enterprise plans, an Owner decides whether members can add plugins from the directory.

After you install, run `/mcp` in Claude Code, select Raindrop, and sign in through your browser. In claude.ai, sign in when Claude first asks to connect.

### Codex

```bash
codex plugin marketplace add raindrop-ai/ai-plugin
```

Then run `/plugins`, find **Raindrop**, install it, and follow the sign-in prompt. Start a new task after installing.

### Cursor

Teams and Enterprise: open the dashboard, go to **Plugins & MCPs**, select **Add Marketplace**, then **Import from Repo**, and enter this repository's URL.

Until Raindrop is listed in the [Cursor Marketplace](https://cursor.com/marketplace), other Cursor users can add `https://mcp.raindrop.ai/mcp` as an MCP server. That adds the tools without the skills.

### Gemini CLI

```bash
gemini extensions install https://github.com/raindrop-ai/ai-plugin
```

Run `/mcp auth raindrop` to sign in. Update with `gemini extensions update raindrop`.

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
