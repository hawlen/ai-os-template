# System Map

Compressed view of the system: active modules, dependency graph, recent changes only.
Auto-imported into every session via CLAUDE.md — keep this file small.

## Active Modules

- `CLAUDE.md` — project memory: Superpowers-driven workflow, project facts, landmines
- Superpowers plugin (`superpowers@claude-plugins-official`) — owns orchestration: brainstorm → plan → TDD → review
- `memory/` — persistent memory layer (this folder)
- `.claude/agents/` — architect (Fable, read-only, rare) + executor (Sonnet, dispatch target for implementation)
- `.claude/settings.json` — auto-enables Superpowers + SessionStart memory-injection hook
- `scripts/hooks/session-start.ps1` — injects recent memory-log tails into every session

## Dependency Graph

```
CLAUDE.md ──imports──> memory/system_map.md
   ├── workflow ──> Superpowers plugin (enabled by .claude/settings.json)
   ├── specialists ──> .claude/agents/architect.md
   └── .claude/settings.json ──> scripts/hooks/session-start.ps1 ──> memory/*.md
```

## Recent Changes

- [INSTALL-DATE] AI OS workspace created from template.
