# Project memory
@memory/system_map.md

## How work runs here
Superpowers owns the workflow: brainstorm the spec with me, plan, red/green TDD,
implement in small steps, then review. Don't bypass it — no "just skip planning"
or "skip tests" unless I explicitly say so for a throwaway, or the effort-triage
rule below applies.

## Effort triage (overrides default skill triggering)
- TRIVIAL (single file, reversible, known pattern, no design decision, no new
  dependency): skip brainstorming and planning — implement directly.
  Verification before completion still applies, always.
- Everything else: full Superpowers workflow.
- Escalation: the moment a "trivial" task fails once, surprises you, or grows
  beyond one file — stop and restart it through the full workflow. No second
  direct attempt.

## Project facts
<!-- Fill this in as the project takes shape. Keep it short — it loads every session. -->
- What this system is:
- Stack / key libraries:
- Entry points & important files:
- Conventions (style, naming, patterns):
- Things to never touch / known landmines:

## Specialists (optional)
Custom subagents live in `.claude/agents/`. They stay available for tasks that fit,
but Superpowers decides delegation — this file does NOT orchestrate agents.
- architect — reach for deep or one-off design questions only.

## Memory & docs
- `memory/system_map.md` — keep current when modules or dependencies change; keep it small.
- `memory/decision_log.md`, `memory/bug_log.md`, `memory/architecture_log.md` —
  optional running notes. Read if relevant; update only if you find them useful.
  (Superpowers has its own conversation memory, so logging here is not required.)

## Context
Work from the system map and recent changes. No full re-reads unless needed.
