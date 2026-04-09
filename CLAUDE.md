# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

[Prompt Line](https://github.com/nkmr-jp/prompt-line) 用のプラグインYAMLファイル集。AIコーディングエージェント（Claude Code, Codex CLI, Gemini CLI）の組み込み機能・スキル・カスタム検索エントリをPrompt Lineのランチャーから呼び出せるようにする。

## Repository Structure

```
{category}/{type}/{plugin}.yaml
```

- **category**: 対象エージェント（`claude`, `codex`, `gemini`）またはユーティリティ（`path`, `skills`）
- **type**: `agent-built-in`（組み込み機能定義）、`agent-skills`（スキル/コマンド）、`custom-search`（@メンション検索）

## Plugin YAML Format

各YAMLファイルは Prompt Line のプラグインエントリを定義する。2つのパターンがある：

### 1. 静的定義（agent-built-in）

トップレベルに `name`, `description`, `color`, `references` を持ち、`commands`, `skills`, `agents` の配列で項目を列挙する。en/ja の言語別ファイルを用意する。

### 2. 動的ソース参照（agent-skills, custom-search）

`sourcePath` または `sourceCommand` でファイルシステムや外部コマンドからエントリを動的に生成する。テンプレート変数（`{basename}`, `{frontmatter@fieldName}`, `{json@key}`, `{line}` 等）で表示内容を構成する。

主要プロパティ:
- `sourcePath`: ファイルグロブパス。`{latest}` でプラグインキャッシュの最新バージョンを参照
- `sourceCommand`: コマンド出力からエントリ生成（例: `ghq list`）
- `searchPrefix`: `@prefix:` でフィルタリングするプレフィックス
- `inputFormat`: 選択時にPrompt Lineの入力フィールドに挿入されるテキスト
- `orderBy`: ソート式（例: `{updatedAt} desc`）
- `displayTime`: タイムスタンプ表示用フィールド

## Color

`color` プロパティは名前付き色（grey, red, amber, blue, lime, rose 等）または16進コード（`#FF6B35`, `#F63`）に対応。

## Development

```bash
# インストール
prompt-line-plugin install github.com/nkmr-jp/prompt-line-plugins

# 有効化するプラグインは settings-draft.yaml の plugins セクションで管理
```

`settings-draft.yaml` はPrompt Lineの設定ファイルのドラフト。`plugins` セクションでこのリポジトリのどのプラグインを有効にするかを定義している。
