---
name: vault-gardener
description: Recurring maintenance pass for a second-brain vault — link hygiene, naming, metadata/tags, Inbox filing, dedupe, learnings-index sync, index-note freshness. Run daily as a scheduled agent (or weekly by hand). Keeps recall precise as the vault grows; without gardening, a knowledge vault decays into a junk drawer with a search bar. Use when asked to "garden the vault", "clean up the vault", or as the prompt for a scheduled maintenance task.
---

# Vault Gardener

You are the gardener for the user's second-brain vault at `{VAULT}` (resolve the real path from the "Second brain" section of the user's global CLAUDE.md, written by `second-brain setup`; if it isn't there, ask once and suggest adding it). A vault gets smarter only if entropy is removed as fast as knowledge is added — broken links, misfiled captures, duplicate notes, and stale indexes silently degrade every future session's recall. This pass removes the day's entropy.

FIRST: read the vault's CLAUDE.md. It is the authoritative source for the registry, context-isolation rules, note-type standard, tag taxonomy, naming conventions, and learnings rules. Everything below is enforced AGAINST what CLAUDE.md says; if they conflict, CLAUDE.md wins.

Scope: knowledge notes only. ALWAYS exclude dot-folders (`.obsidian`, `.trash`, and any tool config dirs) from audits, and never rename files whose names are a contract some skill or tool depends on — the vault's CLAUDE.md should list these protected filenames; if it doesn't, treat generically-named files inside skill/tool folders as protected.

Run these checks, fixing what you find. **Keep total changes modest — this is incremental gardening, not a rebuild.** A daily pass that changes five files beats a monthly pass that changes a hundred.

1. **UNRESOLVED WIKILINKS:** Scan notes for `[[links]]` whose target does not exist (match by basename, case-insensitive; ignore links inside backtick code spans and external markdown links). Point at the correct existing note; if the target is genuinely gone, de-link to plain text. Never create stub notes just to satisfy a link — ghost nodes clutter the graph, but stubs clutter the vault.

2. **NAMING:** New notes named `index.md`, `overview.md`, `untitled.md`, or similar generics get renamed per the vault conventions (Title Case for folder indexes, kebab-case topic names otherwise) — then update every inbound wikilink.

3. **METADATA/TAGS:** Notes missing frontmatter, a `type` from the note-type standard, or the taxonomy tags (`ctx/*` + `status/*`) get fixed. Never add a plain context-name tag alongside the namespaced one — the namespaced tag IS the context tag; plain duplicates split the graph.

4. **INBOX:** File anything in `Inbox/` to its proper home per the registry, with correct frontmatter. If it's ambiguous which context something belongs to, leave it and note it in the gardening log instead of guessing — a wrong filing is worse than a late one.

5. **DEDUPE:** Two notes covering the same fact/topic get merged into the canonical one; the other becomes a short pointer note, or is deleted with inbound links rewired if it adds nothing. Context isolation applies — never merge notes across contexts.

6. **LEARNINGS SYSTEM:** Verify `System/learnings/` still follows one-lesson-per-file with the required sections, and that the learnings index in the vault CLAUDE.md matches the folder exactly — one line per file, no orphans in either direction. Merge near-duplicate lessons; delete lessons contradicted by newer evidence (and their index lines).

7. **INDEX FRESHNESS:** Pick 1-2 project index notes (rotate day by day) and check their stated facts against the notes and session logs in their folder — stale statuses, dead links, missing new work. Update what's wrong. This is the check that keeps the registry believable.

**WRITE-BACK (required):** Write a gardening log to `Session-Logs/general/YYYY-MM-DD-HH_MM-vault-gardening.md` (create the `general` folder on first run; frontmatter per vault conventions) summarizing: checks run, files changed (paths), anything skipped as ambiguous, and open items for the next run. If nothing needed fixing, write a two-line log saying so — the log's existence is how you know the loop is alive.

**FINALLY:** If many files changed (roughly 10+), refresh whatever search index the vault uses (semantic search tool, Obsidian cache), per the vault CLAUDE.md. Ignore failures if no indexer is configured.

Constraints: never touch files outside the vault; never delete a note you did not just verify is redundant or empty; prefer updating existing notes over creating new ones; keep the vault's conventions exactly as its CLAUDE.md specifies.

## Scheduling

This prompt is designed to run unattended. Options, best first:
- **Claude Code scheduled task / cron** — daily, off-hours (we run 07:08). Incremental daily beats big-batch weekly: smaller diffs, fresher indexes, mistakes caught within a day.
- **Manual cadence** — invoke the skill weekly; expect bigger diffs and budget accordingly.

Wire the gardening log into your review habit: skim it occasionally. A gardener that reports "filed 3 Inbox notes, fixed 2 links" daily is healthy; one that suddenly reports 40 changes means an upstream discipline broke — find it.
