---
name: consolidate-memory
description: Use when the memory logs feel noisy, as a monthly ritual, or when a log nears ~500 lines - merges duplicate/superseded entries, distills durable lessons into the system map, and archives old entries to memory/archive/. Nothing is ever deleted.
---

# Consolidate Memory

Reflective maintenance pass over the AI OS memory layer. Nothing is deleted —
only merged, distilled, or moved to the archive.

## Steps

1. Read ALL of `memory/decision_log.md`, `memory/bug_log.md`,
   `memory/architecture_log.md` — the full files, not the injected tails.
2. Identify: duplicate entries, superseded chains (a later decision reverses an
   earlier one), one-off noise with no future value, and recurring patterns
   worth promoting.
3. Distill: lessons and still-true constraints that would change future
   behavior go into `memory/system_map.md` as single short lines. It loads
   every session — a lesson earns its place only if it changes what a future
   session does.
4. Merge: rewrite each superseded chain as one entry stating the final state,
   noting the dates it replaces.
5. Archive: move entries older than the current quarter (or anything beyond
   ~500 lines per log) verbatim to `memory/archive/<year>-<logname>.md`.
   Create the folder if missing. Keep each working log's header and Format
   section intact; the working file keeps recent entries only.
6. Show a before/after summary (lines per file; entries merged / archived /
   promoted) and commit as one dedicated commit:
   `Consolidate memory: <one-line summary>`.

## Rules

- NEVER delete content — archive it.
- NEVER grow `memory/system_map.md` beyond ~40 lines of content.
- Do not consolidate entries younger than 2 weeks — recent context is still
  settling.
- Do not rewrite history in the archive files; they are verbatim records.
