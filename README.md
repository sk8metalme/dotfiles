# dotfiles

macOS 環境を Nix / nix-darwin / Home Manager で管理するための dotfiles です。

## 前提条件

- macOS（Apple Silicon / aarch64-darwin）
- [Determinate Nix インストーラー](https://determinate.systems/products/determinate-nix-installer/) で Nix をインストール済み
  - 標準の Nix インストーラーではなく Determinate 版を使用すること
  - `darwin/configuration.nix` で `nix.enable = false` を設定しているため、Nix の管理は Determinate インストーラー側に委ねている
- Homebrew インストール済み（GUI アプリ / フォント / cask 配布ツール向け）
- Xcode Command Line Tools インストール済み

## 初回セットアップ

```zsh
# 1. Determinate Nix インストーラーで Nix をインストール
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# 2. ターミナルを再起動後、リポジトリをクローン
git clone https://github.com/sk8metalme/dotfiles ~/dotfiles
cd ~/dotfiles

# 3. darwin-rebuild switch で環境を構築
sudo darwin-rebuild switch --flake ".#$(whoami)" --impure
```

事前確認だけ行う場合:

```zsh
nix build --dry-run ".#darwinConfigurations.$(whoami).system" --impure
```

## Flake 構成

```text
flake.nix
├── inputs
│   ├── nixpkgs (unstable)       パッケージ定義
│   ├── nix-darwin                macOS システム設定
│   └── home-manager              ユーザー環境管理
└── outputs
    └── darwinConfigurations.<username>
        ├── darwin/configuration.nix   macOS システム設定・Homebrew 管理
        └── home/default.nix           ユーザーパッケージ・zsh・シンボリックリンク管理
```

## 管理対象

- CLI ツール: Home Manager の `home.packages` で管理します。
- GUI アプリ / フォント / cask系バイナリ: nix-darwin の `homebrew.casks` で管理します。
- macOS defaults: nix-darwin の `system.defaults` で管理します。
- zsh: Home Manager の `programs.zsh` と `config/zsh/*.zsh` で管理します。
- VS Code: `config/vscode/settings.json`、`keybindings.json`、`extensions` を管理します。
- Zed: `config/zed/settings.json` を管理します。
- Hammerspoon: `config/hammerspoon/init.lua` を管理します。
- iTerm2: `config/iTerm2/Default.json` を Dynamic Profile として管理します。

## ディレクトリ構成

```text
~/dotfiles/
├── config/
│   ├── hammerspoon/
│   ├── iTerm2/
│   ├── raycast/
│   ├── vscode/
│   └── zsh/
├── darwin/
│   └── configuration.nix
├── home/
│   └── default.nix
├── flake.lock
├── flake.nix
├── .gitconfig
├── .zshenv
└── .zshrc
```

## 設定の追加・変更

### CLI ツールを追加する

`home/default.nix` の `home.packages` に追記します。

```nix
home.packages = with pkgs; [
  ripgrep  # 既存
  httpie   # 追加
];
```

### GUI アプリ / フォントを追加する

`darwin/configuration.nix` の `homebrew.casks` に追記します。

```nix
casks = [
  "iterm2"  # 既存
  "figma"   # 追加
];
```

### macOS システム設定を変更する

`darwin/configuration.nix` の `system.defaults` を編集します。

```nix
system.defaults = {
  dock = {
    autohide = true;  # 既存
    tilesize = 48;    # 変更
  };
};
```

### 変更を適用する

編集後は常にこのコマンドで反映します。

```zsh
sudo darwin-rebuild switch --flake ".#$(whoami)" --impure
```

## PATH 優先度

`.zshenv` で以下の順序に設定しています。同名コマンドが複数存在する場合、上位が優先されます。

```
Nix 管理ツール  >  Cargo (.cargo/bin)  >  Homebrew (/opt/homebrew/bin)
```

## ローカル専用設定

公開したくない環境変数やローカルパスは、gitignore 済みの `config/zsh/env.local.zsh` に置きます。

```zsh
cp config/zsh/env.local.example.zsh config/zsh/env.local.zsh
$EDITOR config/zsh/env.local.zsh
```

`config/zsh/env.zsh` が存在確認してから読み込むため、ファイルがなくても問題ありません。

## Homebrew の扱い

Homebrew は GUI アプリ、フォント、cask 配布のツール用に限定して使います。
CLI は原則 `home/default.nix` の `home.packages` へ追加します。

既存の Homebrew formula は移行中のため即時削除しません。不要になったものは、Nix 側で動作確認してから手動で整理します。

```zsh
brew list --formula
brew uninstall <formula>
```

## VS Code

設定ファイルと拡張機能一覧は Nix で反映します。

- 設定: `config/vscode/settings.json`
- キーバインド: `config/vscode/keybindings.json`
- 拡張機能: `config/vscode/extensions`（1行1 extension ID）

拡張機能を追加したい場合は `config/vscode/extensions` に extension ID を追記してから `darwin-rebuild switch` を実行します。
現在インストール済みの拡張機能をファイルに反映する場合:

```zsh
code --list-extensions > config/vscode/extensions
```

## Hammerspoon

Hammerspoon の設定は `config/hammerspoon/init.lua` です。
ウィンドウレイアウトは `window-layout` または `wl` で実行できます。

```zsh
window-layout work
wl focus
```

Hammerspoon のレポートファイルはユーザー専用の cache 配下に書き込みます。

## Raycast

Raycast のアプリ本体は nix-darwin の Homebrew cask で管理します。
設定ファイル `config/raycast/settings.rayconfig` は Raycast 側で手動 import / export します。

## トラブルシューティング

### darwin-rebuild が失敗する場合

```zsh
# ドライランで原因を確認
nix build --dry-run ".#darwinConfigurations.$(whoami).system" --impure
```

### Nix ストアのディスク容量を削減したい

```zsh
nix-collect-garbage -d
sudo nix-collect-garbage -d
```

### flake.lock を最新に更新する

```zsh
nix flake update
sudo darwin-rebuild switch --flake ".#$(whoami)" --impure
```

### Homebrew が認識されない場合

```zsh
# PATH を確認（Homebrew は末尾に追加される設計）
echo $PATH | tr ':' '\n'
```

## 設定の追加方針

新しい設定は、必ず `darwin/configuration.nix` または `home/default.nix` に追加してください。
手動インストールや個別スクリプトによるセットアップは行いません。
