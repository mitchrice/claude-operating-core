#!/bin/bash
# Claude Operating Core installer
# Copies the pack's skills and the advisor agent into your Claude Code directories.
# Installer pattern adapted from Alex Makarski's plugin installers (MIT,
# github.com/alexmakarski).
#
# (Alternative: install as a plugin via
#  /plugin marketplace add josherau/claude-operating-core
#  /plugin install operating-core@claude-operating-core )

set -e

SKILLS_DIR="$HOME/.claude/skills"
AGENTS_DIR="$HOME/.claude/agents"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

SKILLS=(review-panel focus-group storm-research extract-approach)

echo ""
echo "Claude Operating Core installer"
echo "==============================="
echo ""
echo "Skills:  ${SKILLS[*]}"
echo "Agent:   advisor"
echo "Target:  $SKILLS_DIR and $AGENTS_DIR"
echo ""

for s in "${SKILLS[@]}"; do
    if [ -d "$SKILLS_DIR/$s" ]; then
        echo "WARNING: existing skill '$s' will be overwritten."
    fi
done
if [ -f "$AGENTS_DIR/advisor.md" ]; then
    echo "WARNING: existing agent 'advisor.md' will be overwritten."
fi
echo ""
read -p "Continue? (y/N) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 0
fi

mkdir -p "$SKILLS_DIR" "$AGENTS_DIR"

echo "Installing skills..."
for s in "${SKILLS[@]}"; do
    echo "  $s"
    rm -rf "${SKILLS_DIR:?}/$s"
    cp -R "$SCRIPT_DIR/skills/$s" "$SKILLS_DIR/$s"
done

echo "Installing agent..."
cp "$SCRIPT_DIR/agents/advisor.md" "$AGENTS_DIR/advisor.md"

echo ""
echo "Done. 4 skills + 1 agent installed."
echo "Next: read docs/operating-model.md and paste the CLAUDE.md snippet"
echo "so the gates are mandatory, then restart Claude Code."
echo ""
