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

## Model routing (dispatch economy)
The orchestrating session stays on the big model; dispatched work runs on the
cheapest model that does it well. When dispatching subagents, set the model:
- Well-specified implementation from a plan / mechanical work → `executor`
  agent (pinned Sonnet)
- Code review, failure analysis → `code-reviewer` agent if present, else any
  subagent with model: opus
- Architecture decisions → `architect` agent (Fable) — rare
- Trivial-triage tasks: no dispatch — in-session is cheaper than the handoff.

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
- BEFORE non-trivial work: skim the injected memory tails; if the task resembles
  a past failure or decision, check `memory/bug_log.md` / `memory/decision_log.md`.
- AFTER non-trivial work or any bug fix: append a dated entry to the matching log
  (`decision_log` / `bug_log` / `architecture_log`). Trivial-triage tasks don't
  need entries.
- Retry circuit breaker: the same failure surviving 3 fix attempts means stop
  patching — root-cause it (systematic debugging), and consider the architect.

## Context
Work from the system map and recent changes. No full re-reads unless needed.
