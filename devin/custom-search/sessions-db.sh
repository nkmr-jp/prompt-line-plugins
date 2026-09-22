#!/bin/bash
# sessions-db.sh - Generate JSONL from Devin CLI sessions.db (prompt history / sessions)
# Usage: bash sessions-db.sh [history|sessions]

set -euo pipefail

case "${1:-}" in
  history)
    sql="select content, timestamp, session_id from prompt_history where is_shell = 0 order by timestamp desc limit 200"
    ;;
  sessions)
    sql="select id, coalesce(title, id) as title, working_directory, last_activity_at from sessions where hidden = 0 order by last_activity_at desc limit 100"
    ;;
  *)
    echo "usage: bash sessions-db.sh [history|sessions]" >&2
    exit 1
    ;;
esac

db="${DEVIN_CLI_DIR:-$HOME/.local/share/devin/cli}/sessions.db"
[ -f "$db" ] || exit 0

# Wait for Devin's write lock instead of failing immediately with "database is locked"
json=$(sqlite3 -readonly -cmd ".timeout 2000" -json "$db" "$sql")
# sqlite3 -json prints nothing for zero rows, which json.load cannot parse
[ -n "$json" ] || exit 0

printf '%s' "$json" | python3 -c "
import sys, json
for item in json.load(sys.stdin):
    print(json.dumps(item, ensure_ascii=False))
"
