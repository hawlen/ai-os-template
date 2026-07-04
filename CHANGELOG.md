# Changelog

Template users: update with `git fetch template --tags`, then merge a tagged
release for a known-good state (see README → "Updating your workspace").

## v1.0.0 — 2026-07-04

First tagged release.

- **CLAUDE.md** — Superpowers-owned workflow; effort triage (trivial tasks skip
  brainstorm/plan, verification always on, one failure escalates); model
  routing aligned with subagent-driven-development's Model Selection (haiku
  for transcription, Sonnet executor for prose-spec implementation, scaled
  reviews, Fable for architecture and final review); memory read/write
  discipline; systematic-debugging-first with a 3-attempt circuit breaker.
- **memory/** — system_map (auto-imported each session) + decision / bug /
  architecture logs; archival convention (~500 lines → memory/archive/).
- **.claude/** — Superpowers auto-enable (`superpowers@claude-plugins-official`)
  + SessionStart memory-injection hook; `architect` (Fable, read-only) and
  `executor` (Sonnet) agents; `consolidate-memory` skill (memory maintenance
  ritual).
- **scripts/** — `hooks/session-start.ps1` (memory injection, Windows);
  `verify.ps1` (install health check).
- **CI** — settings/hook/import validation + health check on every push.
- **README** — setup prompt with machine-layer offer, update path
  (`--allow-unrelated-histories` merge), create-your-own-fleet guide.
