# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Plugin YAML files for [Prompt Line](https://github.com/nkmr-jp/prompt-line). Provides built-in feature definitions, skills, and custom search entries for AI coding agents (Claude Code, Codex CLI, Gemini CLI) accessible from the Prompt Line launcher.

## Repository Structure

```
{category}/{type}/{plugin}.yaml
```

- **category**: Target agent (`claude`, `codex`, `gemini`) or utility (`path`, `skills`)
- **type**: `agent-built-in` (built-in feature definitions), `agent-skills` (skills/commands), `custom-search` (@ mention search)

## Plugin YAML Format

Each YAML file defines a Prompt Line plugin entry. There are two patterns:

### 1. Static Definition (agent-built-in)

Top-level `name`, `description`, `color`, `references` fields with `commands`, `skills`, `agents` arrays listing items. Separate en/ja language files are provided.

### 2. Dynamic Source Reference (agent-skills, custom-search)

Dynamically generates entries from the filesystem or external commands via `sourcePath` or `sourceCommand`. Template variables (`{basename}`, `{frontmatter@fieldName}`, `{json@key}`, `{line}`, etc.) compose the display content.

Key properties:
- `sourcePath`: File glob path. `{latest}` references the latest version in plugin cache
- `sourceCommand`: Generates entries from command output (e.g., `ghq list`)
- `searchPrefix`: Prefix for filtering with `@prefix:`
- `inputFormat`: Text inserted into Prompt Line's input field on selection
- `orderBy`: Sort expression (e.g., `{updatedAt} desc`)
- `displayTime`: Field for timestamp display

## Color

The `color` property supports named colors (grey, red, amber, blue, lime, rose, etc.) or hex codes (`#FF6B35`, `#F63`).

## Development

```bash
# Install
prompt-line-plugin install github.com/nkmr-jp/prompt-line-plugins

# Enabled plugins are managed in the plugins section of settings-draft.yaml
```

`settings-draft.yaml` is a draft of the Prompt Line settings file. The `plugins` section defines which plugins from this repository to enable.
