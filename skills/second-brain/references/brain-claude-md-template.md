# {Vault Name} — Knowledge Vault

*(Template for the vault's own CLAUDE.md — the file every session boots from. Replace placeholders, delete sections you don't need, and keep it under ~200 lines: it loads into every session.)*

Central knowledge vault for {user}'s work. **Path:** `{VAULT}` *(list every machine's path if they differ)*.

## Vault Structure

```text
{VAULT}/
├── Projects/          Active work, one folder + Title Case index note each
├── Areas/             Ongoing responsibilities
├── Resources/         Reference material
├── Inbox/             Quick capture, filed by the gardener
├── Session-Logs/      Per-project session archives
├── Archive/           Inactive items
├── Templates/         Note templates
└── System/            learnings/, standards/, dashboards/
```

## Project Registry

| Project | Vault Index | Code Path | Context |
|---------|-------------|-----------|---------|
| [[Projects/example-project/Example Project\|Example Project]] | `example-project/Example Project.md` | `~/Projects/example/` | {context-a} |

*(One row per active project. The registry is the source of truth for what exists and where its pieces live.)*

## Context Isolation

Work spans these contexts — do NOT mix them:

- **{context-a}** — {one-line description}
- **{context-b}** — {one-line description}

Notes belong to one context; genuinely cross-cutting notes carry every `#ctx/*` tag they touch.

## Where Things Live

- **Notes, decisions, session logs (markdown)** → this vault. Never to Desktop or stray folders.
- **Code** → `~/Projects/` repos. The vault holds one index note per project pointing at the code path.
- **Binary files** (xlsx, pdf, docx) → `~/Documents/{context}/`. Linked from notes, never copied in.

## Session Conventions

- Session logs: `Session-Logs/{project-slug}/YYYY-MM-DD-HH_MM-topic-name.md`
- Note frontmatter standard: `type` (project-note | session-log | meeting | decision | reference | dashboard | learning), `project`, `tags`, `date`, optional `status`.

## Tag Taxonomy

- **`#ctx/<x>`** — owning context, one of: {context-a}, {context-b}, `tools`. Every note gets one (cross-cutting notes get several).
- **`#theme/<x>`** — cross-context topic, controlled vocabulary: {finance, marketing, operations, product, ...}.
- **`#status/<x>`** — lifecycle: `active`, `done`, `archived`.
- Frontmatter form: hashless inside YAML `tags:` arrays; `#` prefix only for inline body tags.

## Naming

- Folders and note files: kebab-case. Folder index notes: **Title Case matching the subject** — never `index.md`/`overview.md`.
- Templates: `template-{type}.md`.
- **Protected filenames** (never rename; skills/tools depend on them): *(list any, e.g. contract files a tool reads by exact name)*

## Output Preferences

- Concise, actionable notes; tables over prose for structured data.
- Decisions logged with rationale.
- Wikilinks `[[Note Name]]` between related notes.

## Learnings

Hard-won lessons live **one per file** in `System/learnings/` — corrections AND confirmed approaches, each with a one-line summary at top plus **Why it mattered** / **How to apply** (approach notes add **Problem shape** — see the extract-approach skill).

**Maintenance rules (non-negotiable):**
- Write a new lesson file **immediately** when a mistake happens or an approach is confirmed — never batch to end of session.
- Before adding, check the index below — **update the existing file** rather than creating a near-duplicate.
- **Delete** lesson files proven wrong (and their index line).
- Keep this index in sync: one line per lesson, summary must stand alone.

**Index:**
- *(one line per lesson: `[[System/learnings/slug|slug]] — compressed summary`)*
