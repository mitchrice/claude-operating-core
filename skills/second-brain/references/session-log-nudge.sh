#!/bin/bash
# Second-brain write-back nudge — Claude Code Stop hook.
#
# Fires when a session tries to end without a recent session log in the vault
# and asks the model to either write one or explicitly decide the session was
# trivial. Discipline that depends on remembering fails; hooks don't forget.
#
# Install: set VAULT below, then register as a Stop hook in your Claude Code
# settings.json:
#   "hooks": { "Stop": [ { "hooks": [ { "type": "command",
#     "command": "/path/to/session-log-nudge.sh" } ] } ] }
#
# Requires jq.

INPUT=$(cat)

# Loop guard: never block a stop that a stop hook already continued.
ACTIVE=$(printf '%s' "$INPUT" | jq -r '.stop_hook_active // false')
[ "$ACTIVE" = "true" ] && exit 0

SESSION_ID=$(printf '%s' "$INPUT" | jq -r '.session_id // "unknown"')
MARKER="${TMPDIR:-/tmp}/claude-brain-nudge-$SESSION_ID"

# Already nudged this session within the last 30 minutes? Let the stop through.
if [ -f "$MARKER" ] && [ -n "$(find "$MARKER" -mmin -30 2>/dev/null)" ]; then
  exit 0
fi

# EDIT ME: your vault path(s) — list several if they differ across machines.
for CANDIDATE in \
  "$HOME/Documents/brain"; do
  if [ -d "$CANDIDATE" ]; then VAULT="$CANDIDATE"; break; fi
done
[ -z "$VAULT" ] && exit 0

# A session log (or Inbox note) updated in the last 30 minutes means the
# brain is already being maintained — no nudge needed.
if [ -n "$(find "$VAULT/Session-Logs" "$VAULT/Inbox" -name '*.md' -mmin -30 2>/dev/null | head -1)" ]; then
  exit 0
fi

touch "$MARKER"
cat <<'EOF'
{"decision": "block", "reason": "Second-brain check: if this session involved substantive work (decisions made, files changed, new facts learned), write or update a session log in the vault now — Session-Logs/{project-slug}/YYYY-MM-DD-HH_MM-topic.md per the vault's CLAUDE.md conventions — and update any affected project notes or learnings. If this was a trivial interaction with nothing worth recording, do not write anything; simply finish your response."}
EOF
