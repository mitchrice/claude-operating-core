# Claude Operating Core

Quality gates for Claude Code. An agent should never grade its own work, outbound content should be pretested before it costs you money, research should be grounded in more than one perspective, and the reasoning behind a hard solve should outlive the session that produced it. This pack is four skills and one agent that enforce exactly that.

I run several businesses with AI in the loop every day. Over time a pattern emerged: the skills that mattered most were not the ones that produced work, but the ones that decided whether work was good enough to ship and made sure hard-won reasoning survived the session. This pack is that core, extracted from my private setup and generalized so anyone can run it.

```
/plugin marketplace add josherau/claude-operating-core
/plugin install operating-core@claude-operating-core
```

Or clone the repo and run `./install-operating-core.sh` from its root, which copies the skills and agent into `~/.claude/` directly (works offline, no marketplace needed).

## What's in the pack

| Piece | What it does |
| --- | --- |
| `review-panel` (skill) | The maker never grades its own homework. Before anything is called done, independent hard-to-please reviewer subagents grade it against documented standards. PASS/FAIL per standard, max 3 revision rounds, unresolved objections escalate to the human. |
| `focus-group` (skill) | Synthetic audience pretesting for outbound content. A panel of deeply researched persona dossiers critiques the content, a copywriter pass produces 3 variants, an independent prediction engine scores 0-100. Nothing ships below 85. |
| `storm-research` (skill) | Default research method. Five grounded perspectives, each answered with real retrieval, then a contradiction map, synthesis with a recommended action, and an adversarial self-review. |
| `extract-approach` (skill) | Reasoning recorder. The moment a hard problem cracks, the problem shape, dead ends, and transferable recipe get written to a learnings directory and indexed. The fix ships once; the recipe upgrades every future session. |
| `advisor` (agent) | A stronger-model consultant for sessions running on cheaper models. The executor sends a condensed brief at three checkpoints (before committing to an approach, before declaring done, when stuck) and gets back focused guidance under 150 words. |
| `docs/operating-model.md` | How the pieces compose into one operating loop, plus a paste-ready CLAUDE.md snippet that enforces the gates. |

## The operating model in one paragraph

Research goes through storm-research so decisions rest on grounded, contradicting perspectives instead of one query's majority view. Work gets produced by the cheapest model that can do it, with the advisor agent consulted at checkpoints. Nothing is called done by the agent that made it: review-panel grades deliverables, and outbound content additionally has to clear the focus-group at 85+. When something hard gets solved along the way, extract-approach writes the recipe down before the session forgets it. The loop compounds: every gate failure becomes feedback, every hard solve becomes a learning any future model can follow.

Full detail, including the CLAUDE.md snippet that makes the gates mandatory rather than optional: [docs/operating-model.md](docs/operating-model.md).

## Where the ideas came from, and what we do with them

None of these ideas are mine alone. The implementations are, and the table shows both halves.

| Piece | Idea lineage | How we use it |
| --- | --- | --- |
| `review-panel` | Maker-checker separation of duties, the old banking control, applied to LLM sessions. Reinforced by watching self-review pass work that independent reviewers failed. | Made it a hard gate in CLAUDE.md, not a suggestion. Reviewers get the artifact and the standards, never the maker's reasoning, so they cannot inherit its blind spots. |
| `focus-group` | Justin Brooke's "predictive wear" synthetic focus group method (panel of rich persona dossiers, then a scoring pass). | We split the roles: panel critiques, a copywriter rewrites, and a fresh subagent that did not write the variants does the scoring, so the 85 gate stays honest. Run logs calibrate the engine against real results over time. |
| `storm-research` | Stanford STORM (Shao et al., NAACL 2024, [stanford-oval/storm](https://github.com/stanford-oval/storm)): multi-perspective question asking for grounded synthesis. | Compressed the pipeline into a four-phase skill, made the contradiction map the deliverable's spine, and added an adversarial Phase 4 self-critique the original pipeline lacks. |
| `extract-approach` | Standard engineering postmortem culture, pointed at a new problem: frontier models get repriced and retired, so reasoning has to outlive the model that produced it. | Fires automatically at solve time with a strict three-part trigger test, so the learnings directory stays high-signal instead of becoming a diary. |
| `advisor` agent | The advisor-tool pattern from Anthropic's API (a strong model advising a cheaper executor). | Emulated it as a Claude Code agent with three named checkpoints and a hard word cap, so sessions on cheap models keep strong-model judgment without strong-model token burn. |
| Repo format | [Alex Makarski's Claude plugins](https://github.com/alexmakarski/claude-plugins), whose marketplace manifests and installer pattern this repo copies. His SEAL, ORCA, BEAR, Via Negativa, and Critic Gauntlet methods also run in our stack as diagnostic and escalation tiers alongside this core. | Same manifest format and install ergonomics, adapted from his multi-repo marketplace into a single self-contained repo. |

The wider stack this core sits inside also includes third-party skill packs we did not write and therefore do not republish here: [superpowers](https://github.com/obra/superpowers) by Jesse Vincent (process discipline: brainstorming, systematic debugging, TDD), Anthropic's official skills (documents, artifacts), and the [humanizer](https://github.com/blader/humanizer) skill for stripping AI tells from prose. If you are building a setup like this, install those from their sources.

## What is deliberately not here

Our private setup wraps these skills in a knowledge vault: per-business focus-group panels with real customer research, a learnings index loaded into every session, quality standards with pass/fail bars per deliverable type, and business-specific domain skills. Those contain client and customer data and stay private. The pack ships the machinery; you bring your own knowledge base. Each skill notes where to point it (`{KNOWLEDGE_BASE}` placeholders).

## License

MIT. Attribution appreciated but not required.

— Josh
