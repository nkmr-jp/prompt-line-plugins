#!/bin/bash
# git-log.sh - Generate git log JSON with GitHub commit URLs and full commit messages
# Usage: bash git-log.sh [projectdir]
# Shows commits on the current branch only (since branching from the default branch).
# Falls back to last 50 commits when on the default branch or merge-base is not found.

projectdir="${1:-.}"
remote=$(git -C "$projectdir" remote get-url origin 2>/dev/null | sed 's|git@github.com:|https://github.com/|; s|.git$||')

# Detect default branch (origin/HEAD → main → master)
default_branch=$(git -C "$projectdir" symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's|refs/remotes/origin/||')
if [ -z "$default_branch" ]; then
  default_branch=$(git -C "$projectdir" branch -r 2>/dev/null | grep -E 'origin/(main|master)' | head -1 | sed 's|.*origin/||')
fi
if [ -z "$default_branch" ]; then
  default_branch="main"
fi

# Find merge base between current HEAD and default branch to show branch-only commits
current_branch=$(git -C "$projectdir" branch --show-current 2>/dev/null)
merge_base=""
if [ "$current_branch" != "$default_branch" ] && [ -n "$current_branch" ]; then
  merge_base=$(git -C "$projectdir" merge-base HEAD "origin/$default_branch" 2>/dev/null)
fi

if [ -n "$merge_base" ]; then
  range="${merge_base}..HEAD"
  git -C "$projectdir" log --format='%h%x00%s%x00%b%x00%an <%ae>%x00%ad%x00%d%x01' "$range"
else
  git -C "$projectdir" log --format='%h%x00%s%x00%b%x00%an <%ae>%x00%ad%x00%d%x01' -50
fi | python3 -c "
import sys, json

remote = sys.argv[1]
for commit in sys.stdin.read().split('\x01'):
    commit = commit.strip()
    if not commit:
        continue
    parts = commit.split('\x00', 5)
    if len(parts) < 6:
        continue
    h, s, body, a, d, r = parts
    s = s.strip()
    body_stripped = body.strip()
    full_msg = s + ('\n\n' + body_stripped if body_stripped else '')
    body_text = '\n'.join('    ' + line if line.strip() else '' for line in full_msg.split('\n'))
    item = {
        'hash': h.strip(),
        'message': s,
        'body': body_text,
        'author': a.strip(),
        'date': d.strip(),
        'refs': r.strip(),
        'url': remote + '/commit/' + h.strip()
    }
    print(json.dumps(item, ensure_ascii=False))
" "$remote"
