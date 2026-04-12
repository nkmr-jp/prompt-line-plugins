#!/bin/bash
# git-log.sh - Generate git log JSON with GitHub commit URLs
# Usage: bash git-log.sh [projectdir]

projectdir="${1:-.}"
remote=$(git -C "$projectdir" remote get-url origin 2>/dev/null | sed 's|git@github.com:|https://github.com/|; s|.git$||')
git -C "$projectdir" log --format='{"hash":"%h","fullhash":"%H","message":"%s","author":"%an","date":"%cr","refs":"%D","url":"'"$remote"'/commit/%H"}' -50
