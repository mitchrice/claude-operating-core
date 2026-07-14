# Setup Mode — Building a Panel for a New Business

Trigger: "focus-group setup {business}", or a RUN request against a business with no panel.

## Process

1. **Ground in your knowledge base first.** Read the business's index note (`{KNOWLEDGE_BASE}/{business}/`), profile/ICP notes, session logs, and any customer-facing material. Search your indexed document collections for customer language (support emails, testimonials, calls). Real customer vocabulary beats invented vocabulary.
2. **Research the market.** Web research the segment: who buys this, what they say in forums/reviews/Reddit, price sensitivity, objections. Capture verbatim language.
3. **Design the roster (~8 personas):**
   - Cover the real segment axes (e.g., residential vs. commercial; beginner vs. advanced; buyer vs. influencer).
   - Mix struggling AND successful versions of the ICP.
   - Include 1-2 deliberate wrong-fit personas that good targeting should repel.
4. **Draft each dossier** per [persona-template.md](persona-template.md) (~1,400 words each) into `{KNOWLEDGE_BASE}/{business}/focus-group/personas/`. Distinct names, distinct life situations — no palette-swapped clones.
5. **Write the index note** (`{Business} Focus Group.md`, Title Case — never index.md):
   - Roster table (persona_id, name, one-line profile, fit tier)
   - Business context block for the copywriter: voice, offers/tiers, what the audience resonates with (pleasure vs. pain angles, make-money vs. save-money framing), red lines
   - Scoring-weight overrides if the default prediction-engine weights don't fit
   - Wikilinks to each persona and back to the business index
6. **Create `runs/`** subdirectory.
7. **Hand to the operator for review.** Drafts are v1. Persona quality is the entire accuracy game — the operator sharpens them with real customer knowledge before the panel's verdicts are trusted for big sends.

## Maintenance

- Personas drift stale as the business's offers and market change — review quarterly or when a panel's predictions miss real-world results twice in a row.
- When an offer targets a new segment, add personas rather than stretching existing ones.
