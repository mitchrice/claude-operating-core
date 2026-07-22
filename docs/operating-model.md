# The Operating Model

How the pieces compose into one loop. The skills are the machinery; this document is the doctrine that makes them mandatory. Skills that are optional get skipped exactly when they matter most, so the enforcement lives in CLAUDE.md, which every session loads.

## The loop

```
   research            make                gate                 ship            learn
storm-research  ->  cheap executor  ->  review-panel      ->  deliver  ->  extract-approach
                    + advisor           (+ focus-group          |            + session write-back
                      checkpoints        for outbound            |
                                         content)                v
                                                            run logs calibrate
                                                            future gates
```

1. **Research before opinion.** Any real research question goes through storm-research. The deliverable is a briefing with a recommended action, a contradiction map, and confidence scores, not a book report.
2. **Make cheap, advise strong.** The session runs on the cheapest model that can do the work. Mechanical subtasks (searches, file sweeps, formatting, template drafts) go to even cheaper subagents. When the session model is not the strongest available, the advisor agent gets consulted at three checkpoints: before committing to an approach, before declaring done, and when stuck. Two or three consults per task is typical. If the session is already on the strongest model, skip the advisor and lean harder on cheap subagents.
3. **Gate before ship.** The agent that made the work never decides it is ready. review-panel grades every substantive deliverable against documented standards. Outbound content (ads, emails, sales pages, newsletters, social posts, offers) additionally has to clear the focus-group panel at 85+. The operator can override case by case with an explicit "skip the panel."
4. **Learn before the session ends.** Hard solves trigger extract-approach at solve time. Mistakes get logged the moment they happen, one lesson per file, each indexed with one line in a file every session loads. Sessions end with a short log: what was done, decisions with rationale, open items, gotchas.

## Why the gates are structural, not motivational

A model reviewing its own output reuses the reasoning that produced it and forgives the gaps it already knows about. That is not a discipline problem you can prompt away; it is structural. The fix is also structural: fresh subagents that receive the artifact and the standards but never the maker's reasoning. The same logic drives the focus-group's role split (panel critiques, copywriter rewrites, a third agent scores) and the advisor pattern (the judge outranks the worker).

## Written standards make the gates cheap

Reviewers grade against a checklist, not vibes. Keep a standards file per recurring deliverable type with binary pass/fail bars (one fail = not done). Write the bars once at your highest quality level, then any model tier can apply them. When real work invents a new quality bar, extract-approach captures it and the standards file grows. When a bar is proven wrong, delete it.

## Paste-ready CLAUDE.md snippet

Replace `{KNOWLEDGE_BASE}` with the real path to your knowledge base (for example `~/Documents/knowledge`), then paste into your global CLAUDE.md:

```markdown
## Never grade your own work (non-negotiable)

Whenever you generate a substantive work product (copy, documents, proposals,
plans, code, designs, skills), invoke the review-panel skill BEFORE presenting
it as done or giving any quality verdict. The documented standards live in
{KNOWLEDGE_BASE}/standards/. Never deliver a self-assigned "ready" or quality
score; the verdict comes from the panel and you report it.
Exceptions: trivial answers, mechanical edits, or when I explicitly say to skip review.

## Content hard gate

No outbound content (ads, emails, sales pages, newsletters, social posts,
offers) ships or gets called done without a focus-group run scoring 85+.
75-84 may run only as a measured test against a control. I override
case by case by saying "skip the panel."

## Record how hard problems get solved (automatic)

The moment you crack a hard problem (multiple failed attempts, non-obvious
insight, judgment call between viable approaches, or an invented quality bar),
invoke the extract-approach skill immediately, before moving on. Learnings live
in {KNOWLEDGE_BASE}/learnings/, one lesson per file, indexed below.

## Token economy: advisor pattern

Default to cheap-executor plus strong-advisor. Delegate mechanical work to
haiku subagents. When the session model is below the strongest tier, consult
the advisor agent before committing to an approach, before declaring done,
and when stuck (2-3 consults per task). On the strongest tier, skip the
advisor and lean harder on cheap subagents.

## Research default

Use storm-research for any research task. Skip only for single-fact lookups
or when I ask for a quick answer.
```

## Adoption order

If you adopt one piece, adopt review-panel; it changes shipped quality immediately and needs no setup. Then extract-approach (needs only a learnings folder and an index). Then storm-research. The focus-group pays off in proportion to persona quality, so budget a real research pass per business panel before trusting its verdicts. The advisor agent matters once you deliberately run sessions on cheaper models.

Once two or more pieces are in use, run `second-brain setup`: the vault is what turns the gates from filters into a flywheel, because every gate failure and hard solve now lands somewhere every future session reads (see [second-brain.md](second-brain.md)). Schedule the `vault-gardener` the same week; an untended vault decays faster than it accretes.
