# claude

Plugin configurations for [Claude Code](https://code.claude.com/).

## Plugins

| Directory | File | Description |
|-----------|------|-------------|
| agent-built-in/ | en.yml | Claude Code built-in slash commands (English, 77 commands) |
| agent-built-in/ | ja.yml | Claude Code built-in slash commands (Japanese, 77 commands) |
| agent-skills/ | commands.yml | User-defined custom commands from `~/.claude/commands/*.md` |
| agent-skills/ | plugin-commands.yml | Plugin slash commands from `~/.claude/plugins/cache/**/commands/*.md` |
| agent-skills/ | plugin-skills.yml | Plugin skills from `~/.claude/plugins/cache/**/SKILL.md` |
| agent-skills/ | skills.yml | User-defined skills from `~/.claude/skills/**/SKILL.md` |
| custom-search/ | agents.yml | Search user agents with `@agent:` from `~/.claude/agents/*.md` |
| custom-search/ | plans.yml | Search plans with `@plan:` from `~/.claude/plans/*.md` |
| custom-search/ | plugin-agents.yml | Search plugin agents with `@agent:` from `~/.claude/plugins/cache/**/agents/*.md` |
| custom-search/ | teams.yml | Search team members with `@team:` from `~/.claude/teams/**/config.json` |
