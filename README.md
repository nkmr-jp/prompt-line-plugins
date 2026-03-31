# prompt-line-plugins

Plugin YAML files for [Prompt Line](https://github.com/nkmr-jp/prompt-line) — agent-built-in,
agent-skills, and custom-search entries.

## Install

```bash
prompt-line-plugin install github.com/nkmr-jp/prompt-line-plugins
```

## Structure

```
claude/
  agent-built-in/    # Claude Code 組み込み機能 (en,ja)
  agent-skills/      # skill, commands
  custom-search/     # @ mention search entries
codex/
  agent-built-in/    # OpenAI Codex CLI 組み込み機能 (en,ja)
gemini/
  agent-built-in/    # Google Gemini CLI 組み込み機能 (en,ja)
```

```
{category}/{type}/{plugin}
```

## Type

| type          | trigger | description                          |
|---------------|---------|--------------------------------------|
| agent-buit-in | / ,@    | Agent組み込みの commands、skills、subagents |
| agents-skills | /, $    | skills, commands                     |
| custom-search | @       | subagents, ユーザー定義の検索機能               |

## Plugin