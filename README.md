# AI OS — Project Template

The **starting base for Claude Code projects**: persistent project memory, session
hooks, and the [Superpowers](https://github.com/obra/superpowers) workflow
(brainstorm → plan → red/green TDD → subagent-driven implementation → review),
auto-enabled on every copy.

Start a project from this template and the workspace **evolves with the project**:
CLAUDE.md's facts get filled in for that codebase, and the memory logs accumulate
that project's decisions, bugs, and architecture history.

## What's inside

| Path | Purpose |
|---|---|
| `CLAUDE.md` | Project memory: how work runs (Superpowers-driven), project facts, landmines |
| `memory/` | system_map (auto-imported each session) + decision / bug / architecture logs |
| `.claude/settings.json` | Auto-enables `superpowers@claude-plugins-official` + SessionStart memory hook |
| `.claude/agents/architect.md` | Specialist for deep or one-off design questions (read-only) |
| `scripts/hooks/session-start.ps1` | Injects recent memory-log entries into every session |

## Start a project

Click **Use this template** on GitHub, or:

```
gh repo create my-app --template hawlen/ai-os-template --private --clone
cd my-app
claude
```

Claude Code will ask you to trust the project settings and to install the
Superpowers plugin — accept both. Then paste this prompt:

> This folder was just created from the AI OS template. Finish the setup —
> setup only, do not build features:
> 0. Machine layer (first install on this computer only): if neither `~/ai-os` nor
>    `~/claude-tooling` exists, ask me whether to also install the AI OS machine layer
>    (github.com/hawlen/ai-os — global skills, agents, MCPs for every project on this
>    computer). If I say yes, run its bootstrap:
>    Windows: `irm https://raw.githubusercontent.com/hawlen/ai-os/main/bootstrap.ps1 | iex`
>    macOS/Linux: `curl -fsSL https://raw.githubusercontent.com/hawlen/ai-os/main/bootstrap.sh | bash`
>    AI OS workspaces work without it — skip freely.
> 1. Verify the structure: CLAUDE.md, memory/ (system_map + 3 logs),
>    .claude/settings.json, .claude/agents/architect.md,
>    scripts/hooks/session-start.ps1.
> 2. Adapt the hook to this OS: on Windows keep the PowerShell script; on
>    macOS/Linux rewrite it as a bash equivalent (print the tails of the three
>    memory logs to stdout), update the hook command in .claude/settings.json,
>    and pipe-test it with an empty JSON payload.
> 3. In memory/system_map.md, replace [INSTALL-DATE] with today's date.
> 4. Interview me briefly and fill in the "Project facts" section of CLAUDE.md
>    for this project.
> 5. Remind me to restart Claude Code once so the hook loads.

## How it works

- **CLAUDE.md** loads into every session and imports the system map — so Claude
  always knows what the project is, how work runs, and what not to touch.
- **The SessionStart hook** injects the tails of your decision/bug/architecture
  logs, so past context survives across sessions and machines.
- **Superpowers** drives the engineering workflow; the **architect** subagent is
  reserved for rare, genuinely architectural questions.

## Related

- **Machine layer:** [hawlen/ai-os](https://github.com/hawlen/ai-os) — global
  skills, subagents, MCP servers, and CLIs for every project on a computer,
  installed via one-line bootstrap (the setup prompt above offers it automatically).
- This template is maintained by the AI OS fleet (private workspace). Improvements
  land here as the base evolves.
