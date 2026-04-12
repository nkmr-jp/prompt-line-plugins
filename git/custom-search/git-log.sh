#!/bin/bash
# git-log.sh - Generate git log JSON with GitHub commit URLs and full commit messages
# Usage: bash git-log.sh [projectdir]

projectdir="${1:-.}"
remote=$(git -C "$projectdir" remote get-url origin 2>/dev/null | sed 's|git@github.com:|https://github.com/|; s|.git$||')

git -C "$projectdir" log --format='%h%x00%s%x00%b%x00%an%x00%cr%x00%D%x01' -50 | python3 -c "
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
    body_text = s + ('\n' + body.strip() if body.strip() else '')
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
