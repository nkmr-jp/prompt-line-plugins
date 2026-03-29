# prompt-line-plugins

Plugin YAML files for [Prompt Line](https://github.com/nkmr-jp/prompt-line) — agent-built-in, agent-skills, and custom-search entries.

## Install

```bash
# Install plugins (default branch)
prompt-line-plugin install github.com/nkmr-jp/prompt-line-plugins

# Install at specific branch/tag/hash
prompt-line-plugin install github.com/nkmr-jp/prompt-line-plugins@develop
prompt-line-plugin install github.com/nkmr-jp/prompt-line-plugins@v1.0.0
prompt-line-plugin install github.com/nkmr-jp/prompt-line-plugins@sea8pxe
```

### Setup

Add to your shell config (e.g., `~/.zshrc`):

```bash
function prompt-line-plugin() {
    pnpm --dir ~/ghq/github.com/nkmr-jp/prompt-line run "plugin:$1" "${@:2}"
}
```

## Structure

```
claude/
  agent-built-in/    # Claude Code
  agent-skills/      # Custom slash commands from markdown files
  custom-search/     # @ mention search entries
codex/
  agent-built-in/    # OpenAI Codex CLI
gemini/
  agent-built-in/    # Google Gemini CLI
```
