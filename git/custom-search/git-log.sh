#!/bin/bash
# git-log.sh - Generate git log JSON with GitHub commit URLs and full commit messages
# Usage: bash git-log.sh [projectdir]

projectdir="${1:-.}"
remote=$(git -C "$projectdir" remote get-url origin 2>/dev/null | sed 's|git@github.com:|https://github.com/|; s|.git$||')

git -C "$projectdir" log --format='%h%x00%s%x00%b%x00%an <%ae>%x00%ad%x00%d%x00%at%x01' -50 | python3 -c "
import sys, json

remote = sys.argv[1]
for commit in sys.stdin.read().split('\x01'):
    commit = commit.strip()
    if not commit:
        continue
    parts = commit.split('\x00', 6)
    if len(parts) < 7:
        continue
    h, s, body, a, d, r, ts = parts
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
        'url': remote + '/commit/' + h.strip(),
        'timestamp': ts.strip()
    }
    print(json.dumps(item, ensure_ascii=False))
" "$remote"
