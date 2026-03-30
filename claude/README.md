# claude

Plugin configurations for [Claude Code](https://code.claude.com/).

## Plugins

| Directory | File | Description |
|-----------|------|-------------|
| agent-built-in/ | en.yaml | Claude Code built-in slash commands (English, 77 commands) |
| agent-built-in/ | ja.yaml | Claude Code built-in slash commands (Japanese, 77 commands) |
| agent-skills/ | commands.yaml | User-defined custom commands from `~/.claude/commands/*.md` |
| agent-skills/ | plugin-commands.yaml | Plugin slash commands from `~/.claude/plugins/cache/**/commands/*.md` |
| agent-skills/ | plugin-skills.yaml | Plugin skills from `~/.claude/plugins/cache/**/SKILL.md` |
| agent-skills/ | skills.yaml | User-defined skills from `~/.claude/skills/**/SKILL.md` |
| custom-search/ | agents.yaml | Search user agents with `@agent:` from `~/.claude/agents/*.md` |
| custom-search/ | plans.yaml | Search plans with `@plan:` from `~/.claude/plans/*.md` |
| custom-search/ | plugin-agents.yaml | Search plugin agents with `@agent:` from `~/.claude/plugins/cache/**/agents/*.md` |
| custom-search/ | teams.yaml | Search team members with `@team:` from `~/.claude/teams/**/config.json` |
