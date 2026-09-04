# prompt-line-plugins

Plugin YAML files for [Prompt Line](https://github.com/nkmr-jp/prompt-line) — agent-built-in,
agent-skills, and custom-search entries.

This repository contains a collection of prompt line plugins examples.

## Install

```bash
prompt-line-plugin install github.com/nkmr-jp/prompt-line-plugins
```

## Available Plugins

### Antigravity CLI (AGY)
- `agy/agent-built-in/en` — AGY built-in commands & workflow skills (English)
- `agy/agent-built-in/ja` — AGY built-in commands & workflow skills (Japanese)
- `agy/agent-skills/skills` — AGY global skills (`~/.gemini/config/skills/**/*/SKILL.md`)
- `agy/agent-skills/plugin-skills` — AGY plugin skills (`~/.gemini/config/plugins/*/skills/**/SKILL.md`)
- `agy/agent-skills/builtin-skills` — AGY builtin skills (`~/.gemini/antigravity-cli/builtin/skills/**/SKILL.md`)
- `agy/custom-search/history@ar` — AGY prompt history search (`~/.gemini/antigravity-cli/history.jsonl`)

### Claude Code
- `claude/agent-built-in/en` — Claude Code built-in commands, skills, agents (English)
- `claude/agent-built-in/ja` — Claude Code built-in commands, skills, agents (Japanese)
- `claude/agent-skills/commands` — Global commands (`~/.claude/commands/*.md`)
- `claude/agent-skills/skills` — Global skills (`~/.claude/skills/**/*/SKILL.md`)
- `claude/agent-skills/plugin-commands` — Plugin commands
- `claude/agent-skills/plugin-skills` — Plugin skills
- `claude/custom-search/agents@agent` — Custom agents
- `claude/custom-search/plans@plan` — Plans
- `claude/custom-search/history@r` — Prompt history
- `claude/custom-search/teams@team` — Teams

### OpenAI Codex CLI
- `codex/agent-built-in/en` — Codex CLI built-in commands (English)
- `codex/agent-built-in/ja` — Codex CLI built-in commands (Japanese)
- `codex/agent-skills/skills` — System skills (`~/.codex/skills/.system/**/*/SKILL.md`)
- `codex/agent-skills/plugin-skills` — Plugin skills
- `codex/custom-search/history@cr` — Prompt history
- `codex/custom-search/sessions@cs` — Thread sessions

### Git & Path
- `git/custom-search/git-log@gl` — Git commit history for active project
- `path/custom-search/ghq@ghq` — Search local git repos with ghq
- `path/custom-search/finder@f` — Search files in active directory
- `path/custom-search/zoxide@z` — Jump to frequent directories

## Configuration Example (`~/.prompt-line/settings.yaml`)

```yaml
plugins:
  github.com/nkmr-jp/prompt-line-plugins:
    # Antigravity CLI (AGY)
    - agy/agent-built-in/ja
    - agy/agent-skills/skills
    - agy/agent-skills/plugin-skills
    - agy/custom-search/history@ar

    # Claude Code
    - claude/agent-built-in/ja
    - claude/agent-skills/skills
    - claude/custom-search/history@r

    # Codex CLI
    - codex/agent-built-in/ja
    - codex/custom-search/history@cr
```
