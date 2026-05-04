# CLAUDE.md

このファイルは Claude Code がこのリポジトリで作業する際のガイダンスを提供します。

## リポジトリ概要

macOS 開発環境を **Nix / nix-darwin / Home Manager** で宣言的に管理する個人用 dotfiles リポジトリです。
シェル、エディタ、ウィンドウ管理、生産性ツールの設定を一元管理します。

## ディレクトリ構成

- **flake.nix**: Nix フレーク定義。nixpkgs / nix-darwin / home-manager の入力と出力を定義
- **darwin/configuration.nix**: macOS システム設定・Homebrew（casks/MAS/VSCode 拡張機能）の宣言的管理
- **home/default.nix**: ユーザーパッケージ（`home.packages`）・zsh・シンボリックリンクの管理
- **config/**: アプリケーション別の設定ファイル群
  - **hammerspoon/**: ウィンドウ管理・自動化ツール（`init.lua`）
  - **iTerm2/**: Dynamic Profile（`Default.json`）
  - **raycast/**: 設定ファイル（手動 import/export）
  - **vscode/**: 設定・キーバインド・拡張機能一覧
  - **zed/**: エディタ設定（`settings.json`）
  - **zsh/**: モジュール分割された zsh 設定ファイル群
- **.zshrc, .zshenv, .gitconfig**: ルートレベルの設定ファイル

## 開発ワークフロー

### 設定変更の基本フロー

1. 設定ファイルを編集する（`darwin/configuration.nix` または `home/default.nix` または `config/` 配下）
2. 変更を適用する

```zsh
sudo darwin-rebuild switch --flake ".#$(whoami)" --impure
```

3. Git でコミットして変更を記録する

### 変更箇所の判断基準

| 変更内容 | 編集ファイル |
|---------|-------------|
| CLI ツールの追加・削除 | `home/default.nix` の `home.packages` |
| GUI アプリ / フォントの追加 | `darwin/configuration.nix` の `homebrew.casks` |
| macOS システム設定の変更 | `darwin/configuration.nix` の `system.defaults` |
| zsh 設定の変更 | `config/zsh/*.zsh` |
| VS Code 設定の変更 | `config/vscode/settings.json` または `keybindings.json` |
| VS Code 拡張機能の追加 | `config/vscode/extensions` に extension ID を追記 |
| Hammerspoon 設定の変更 | `config/hammerspoon/init.lua` |
| Zed 設定の変更 | `config/zed/settings.json` |

### Hammerspoon の作業

- `config/hammerspoon/init.lua` を編集する
- Home Manager がシンボリックリンクを `~/.hammerspoon/` に作成済み
- 変更後は Hammerspoon の設定をリロードする

## 管理対象の概要

- **シェル**: `.zshrc`、`.zshenv`、`config/zsh/*.zsh`
- **Git**: `.gitconfig`
- **エディタ**: `config/vscode/`、`config/zed/`
- **ウィンドウ管理**: `config/hammerspoon/`
- **生産性ツール**: `config/raycast/`（設定のみ手動管理）
- **ターミナル**: `config/iTerm2/`

## 重要な設計方針

- **CLI ツールは Nix で管理**: `home/default.nix` の `home.packages` に追加する
- **GUI アプリは Homebrew cask で管理**: `darwin/configuration.nix` の `homebrew.casks` に追加する
- **宣言的管理を優先**: 手動インストールは避け、Nix または Homebrew で宣言する
- **ローカル専用設定**: 公開できない環境変数は `config/zsh/env.local.zsh`（gitignore 済み）に置く
- **設定は必ず Nix で管理**: 新しい設定は `darwin/configuration.nix` または `home/default.nix` に追加する
