# The Second Brain

Why the vault exists, how it compounds, and where the ideas came from. The `second-brain` skill sets it up and runs the daily ritual; the `vault-gardener` skill maintains it; this document is the reasoning.

## The problem it solves

Claude Code sessions are amnesiac. Every session re-derives context, repeats old mistakes, and loses its best reasoning at the end. Model upgrades make it worse: whatever an old model figured out is gone unless it was written down somewhere the next model reads.

The fix is boring on purpose: a folder of plain markdown files that every session boots from and writes back to. Plain files survive model changes, vendor changes, and tool changes. All of the system's intelligence lives in the loops described below.

## The reinforcement loops

"Gets smarter every day" only means something if you can point at the mechanisms. Five loops, each closing the gap between what one session learned and what every future session knows. (Reinforcement here means operational feedback loops that strengthen with use, not reinforcement learning in the machine-learning sense; no weights are being trained.)

| Loop | Trigger | Written to | Read back by |
| --- | --- | --- | --- |
| **Lesson loop** | A mistake or a confirmed approach | One file in `System/learnings/` + one index line in the brain's CLAUDE.md | Every future session, at boot |
| **Approach loop** | A hard solve (extract-approach fires) | A recipe note with problem shape and dead ends | Any future session facing the same problem shape |
| **Standards loop** | Real work invents a quality bar | A pass/fail bar in `System/standards/` | review-panel graders, every deliverable after |
| **Calibration loop** | A gated prediction meets reality (focus-group run logs, shipped results) | Run logs with predicted vs. actual | The next scoring pass, adjusting weights |
| **Gardening loop** | Daily scheduled pass | Fixed links, filed Inbox, synced indexes, a gardening log | Everything; this loop keeps the other four findable |

The loops are self-pruning as well as self-growing: learnings proven wrong get deleted, near-duplicates get merged, stale index facts get corrected. A memory system that only accretes becomes noise; the deletion rules matter as much as the capture rules.

## The memory hierarchy

Three layers, cheapest recall first:

1. **The brain's CLAUDE.md**, loaded every session. Registry, conventions, learnings index. Kept under ~200 lines because every line costs tokens forever.
2. **Index notes and recent session logs**, read at session start for the project at hand. One folder deep, seconds to read.
3. **The full vault**, searched on demand (grep, or a semantic indexer if you run one). Session logs are the raw archive; nobody reads them until they need exactly one.

Discipline flows downhill: if it isn't indexed in layer 1 or 2, layer 3 is where knowledge goes to be forgotten, which is why the gardener's index-sync checks exist.

## Enforcement beats intention

Every rule in the system has an enforcement mechanism, because rules that depend on remembering fail quietly:

- Write-back → the Stop-hook nudge (ships with the `second-brain` skill) interrupts a session once if it tries to end with no recent log, prompting it to write one or consciously judge the session trivial. A nudge, not a wall; in practice the interruption is what makes the habit stick.
- Quality → review-panel is a CLAUDE.md hard gate, not a suggestion.
- Learnings hygiene → the gardener audits the index against the folder daily.
- Registry truth → the gardener rotates through index notes checking facts against reality.

## What stays private when you share this

The machinery is shareable; the contents are not. If you publish or hand your setup to others, the line is: structure, conventions, templates, prompts, and hooks travel; your registry rows, notes, learnings, panels, env files, and keys do not. The `{VAULT}`/`{ctx}` placeholders in this pack exist so the machinery ships clean.

## Where the ideas came from

- **PARA and the "second brain" framing**: Tiago Forte (*Building a Second Brain*; the PARA method). We use his Projects/Areas/Resources/Archives spine (our folder is singular `Archive/`) and add `Session-Logs/` (session memory) and `System/` (learnings and standards, the self-improvement machinery).
- **Digital gardening**: the tending-over-time ethos comes from the digital-garden tradition (see Maggie Appleton's history of the digital garden). Our addition is making the gardener an autonomous daily agent with a fixed checklist rather than a human habit.
- **Atomic, linked notes**: the wikilink-and-index pattern is standard Obsidian/Zettelkasten practice; we constrain it with a namespaced tag taxonomy so a graph of hundreds of notes still shows trends instead of hairballs.
- **Session logs as agent memory**: convergent practice across the Claude Code community; our specific contribution is the write-back trio (log + note updates + learnings) enforced by a Stop hook, and the deletion rules that keep accretion honest.
