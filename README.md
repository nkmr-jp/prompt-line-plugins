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
  agent-built-in/    # Claude Code built-in features (en, ja)
  agent-skills/      # skills, commands
  custom-search/     # @ mention search entries
codex/
  agent-built-in/    # OpenAI Codex CLI built-in features (en, ja)
gemini/
  agent-built-in/    # Google Gemini CLI built-in features (en, ja)
```

```
{category}/{type}/{plugin}
```

## Type

| type          | trigger | description                                  |
|---------------|---------|----------------------------------------------|
| agent-built-in | /, @   | Agent built-in commands, skills, subagents   |
| agent-skills  | /, $    | skills, commands                             |
| custom-search | @       | subagents, user-defined search features      |

## Plugin

WIP

## Color

Color property supports both named colors and hex color codes:

- Named colors: grey, darkGrey, slate, stone, red, rose, orange, amber, yellow, lime, green, emerald, teal, cyan, sky, blue, indigo, violet, purple, fuchsia, pink
- Hex codes: #RGB or #RRGGBB (e.g., #FF6B35, #F63)
