# Sales Council Agent Skill

Expert sales council with 7 advisors for pricing, persuasion, negotiation, copywriting, pitch strategies, and virality/word-of-mouth.

> **Provenance:** the original 6-advisor skill is by Antonio ([antonioc-cl/sales-council](https://github.com/antonioc-cl/sales-council), MIT — his copyright notice is retained in [LICENSE](LICENSE)). This copy is vendored into claude-operating-core with two additions: the **Currier** advisor (sharing psychology / virality, distilled from NFX's "Why People Share") and an optional integration section wiring the council into the pack's focus-group and review-panel gates. If you only want the base skill, install it from Antonio's repo.

## Advisors

- **Robert Cialdini** - Psychology of persuasion
- **Alex Hormozi** - Offers, pricing, business model
- **Neil Rackham** - Discovery conversations
- **Chris Voss** - Negotiation and objections
- **Oren Klaff** - Frame control and pitch
- **Eugene Schwartz** - Copywriting and messaging
- **James Currier** - Sharing psychology and virality (local addition, distilled from NFX's "Why People Share")

## Installation

Installed as part of the claude-operating-core pack (`/plugin marketplace add josherau/claude-operating-core` or `./install-operating-core.sh`).

For the original standalone version: `npx skills add antonioc-cl/sales-council`.

## Usage

Activate when you need help with:

- Pricing strategy and offer design
- Sales conversations and discovery calls
- Negotiation and handling objections
- Pitch presentations and frame control
- Landing page copy and messaging
- Marketing copy and advertising text

### Example Prompts

```
Use sales-council to help me structure pricing for my SaaS
Use sales-council to write copy for my landing page
Use sales-council to prepare for a negotiation call
Use sales-council to design an irresistible offer
```

## Structure

```
sales-council/
├── SKILL.md              # Main skill instructions
├── LICENSE               # MIT License
├── README.md             # This file
└── references/           # Detailed advisor profiles
    ├── cialdini.md
    ├── hormozi.md
    ├── rackham.md
    ├── voss.md
    ├── klaff.md
    ├── schwartz.md
    └── currier.md
```

## License

MIT License - See LICENSE file for details.
