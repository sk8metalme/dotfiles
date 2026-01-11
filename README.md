# dotfilesのディレクトリ構造
ホームディレクトリ直下にクローンすることをおすすめします。（それ以外にクローンする時は、dotfiles/zshenvの以下を編集してください。）

コードの解説は[こちら](https://qiita.com/Rockreeee/items/e59b1c4c764d4079c657)

```zsh
~/dotfiles/
├── config/
│   ├── hammerspoon/            # Hammerspoon（ウィンドウ管理・自動化ツール）設定
│   │   └── init.lua            # Hammerspoon設定ファイル
│   ├── raycast/                # Raycast（ランチャー・生産性向上ツール）設定
│   │   ├── README.md           # Raycast設定の説明
│   │   └── settings.rayconfig  # Raycast設定ファイル
│   ├── vscode/
│   │   ├── extensions          # vscodeの拡張機能一覧
│   │   ├── keybindings.json    # vscodeのキーバインド
│   │   └── settings.json       # vscodeの設定ファイル
│   └── zsh/
│       ├── alias.zsh           # エイリアスの定義
│       ├── bindkey.zsh         # キーバインドの定義
│       ├── completion.zsh      # 補完設定の定義
│       ├── env.zsh             # 環境変数の設定
│       ├── functions.zsh       # 関数の定義
│       ├── oh-my-zsh.zsh       # oh-my-zshの設定
│       └── wordstyle.zsh       # 単語スタイルの設定
├── setup-scripts/
│   ├── install-apps.sh         # アプリのインストール
│   ├── install-brew-package.sh # homebrewのパッケージインストール
│   ├── install-bun.sh          # Bunランタイムのインストール
│   ├── install-oh-my-zsh.sh    # oh-my-zshのインストール
│   ├── setup-hammerspoon.sh    # Hammerspoonのセットアップ
│   ├── setup-MacOS.sh          # mac設定のセットアップ
│   ├── setup-raycast.sh        # Raycastのセットアップ
│   ├── setup-vscode.sh         # vscodeのセットアップ
│   └── setup-zsh.sh            # zshのセットアップ
├── CLAUDE.md                   # Claude Code用プロジェクト指示書
├── .gitconfig                  # Gitの設定ファイル
├── .zshenv                     # 全シェルで適用される設定
└── .zshrc                      # インタラクティブシェル用の設定
```


# zsh環境のセットアップ
## 必要なhomebrewパッケージをインストール
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/install-brew-package.sh
# 実行
~/dotfiles/setup-scripts/install-brew-package.sh
```

## oh-my-zshをインストール
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/install-oh-my-zsh.sh
# 実行
~/dotfiles/setup-scripts/install-oh-my-zsh.sh
```

## zshのセットアップ
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/setup-zsh.sh
# 実行
~/dotfiles/setup-scripts/setup-zsh.sh
```

# プログラミングフォントのインストール

`install-brew-package.sh` を実行すると、以下のフォントが自動インストールされます：

- **JetBrains Mono**: 合字対応のプログラミングフォント
- **HackGen**: 日本語に最適化されたプログラミングフォント
- **Ricty Diminished**: 日本語プログラミングフォント

VS Codeの設定 (`config/vscode/settings.json`) でこれらのフォントが使用されます。


# ghqのセットアップ

ghqはGitリポジトリを一元管理するツールです。fzfと連携してインタラクティブにリポジトリを移動できます。

## 設定内容
- **GHQ_ROOT**: `~/Work/git`
- **キーバインド**: `Ctrl+G` でfzfを使ったリポジトリ選択

## 初回セットアップ

### 1. リポジトリルートディレクトリの作成
```zsh
mkdir -p ~/Work/git
```

### 2. ghqのインストール（install-brew-package.shで自動実行済み）
```zsh
# すでに install-brew-package.sh を実行済みの場合は不要
brew install ghq
```

## 使い方

### リポジトリの取得
```zsh
# GitHubリポジトリをclone
ghq get https://github.com/user/repo

# または短縮形
ghq get user/repo
```

### リポジトリへの移動
```zsh
# Ctrl+G を押すとfzfでリポジトリ一覧が表示されます
# ↑↓キーで選択してEnterを押すとそのリポジトリに移動します
# プレビューでREADME.mdが表示されます
```

### リポジトリ一覧の表示
```zsh
ghq list
```

### リポジトリのパスを取得
```zsh
ghq list -p
ghq root  # ルートディレクトリのパスを表示
```

## 依存関係
- `ghq`: Gitリポジトリ管理ツール（install-brew-package.shでインストール）
- `fzf`: ファジーファインダー（install-brew-package.shでインストール済み）
- `bat`: READMEプレビュー用（install-brew-package.shでインストール済み）

# Macのセットアップ
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/setup-MacOS.sh
# 実行
~/dotfiles/setup-scripts/setup-MacOS.sh
```

# アプリをインストール
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/install-apps.sh
# 実行
~/dotfiles/setup-scripts/install-apps.sh
```

# Vscodeのセットアップ
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/setup-vscode.sh
# 実行
~/dotfiles/setup-scripts/setup-vscode.sh
```


# Raycastのセットアップ

Raycast は macOS 用の高速ランチャー兼生産性向上ツールです。アプリケーションの起動、検索、スニペット、ショートカットなどを一元管理できます。

## Raycast のインストール

```zsh
# Homebrewでインストール
brew install --cask raycast

# または公式サイトからダウンロード
# https://www.raycast.com/
```

## 設定のセットアップ

```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/setup-raycast.sh
# 実行
~/dotfiles/setup-scripts/setup-raycast.sh
```

このスクリプトは、Raycast の設定ファイルをインポートする手順を案内します。

## 設定の管理

### 設定のインポート（新しいマシンへの移行時）

1. Raycast Settings を開く（`⌘,`）
2. `Advanced` タブを選択
3. `Import Configuration` をクリック
4. `config/raycast/settings.rayconfig` を選択

### 設定のエクスポート（設定変更後）

1. Raycast Settings を開く（`⌘,`）
2. `Advanced` タブを選択
3. `Export Configuration` をクリック
4. `config/raycast/settings.rayconfig` に保存（上書き）
5. Git でコミット

## Raycast の主な機能

- **ランチャー**: アプリケーションやファイルを素早く起動
- **Snippets**: テキスト展開（Espanso と似た機能）
- **Quicklinks**: よく使う URL への素早いアクセス
- **Extensions**: 豊富な拡張機能エコシステム
- **Clipboard History**: クリップボード履歴管理
- **Window Management**: ウィンドウ配置の管理

## Tips

- デフォルトのホットキー: `⌥ Space`（Option + Space）
- Extensions Store から便利な拡張機能を追加可能
- Raycast AI を有効にすると、AI アシスタント機能も利用可能

# Hammerspoon（ウィンドウ管理・自動化ツール）の設定

## Hammerspoonのセットアップ
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/setup-hammerspoon.sh
# 実行
~/dotfiles/setup-scripts/setup-hammerspoon.sh
```

## Hammerspoon設定の詳細
### 初回起動時の設定
1. セットアップスクリプト実行後、Hammerspoonを起動してください
   ```bash
   open /Applications/Hammerspoon.app
   ```
2. アクセシビリティ権限の許可を求められるので、システム設定から許可してください
   - システム設定 > プライバシーとセキュリティ > アクセシビリティ
3. Hammerspoonが自動的に設定ファイルを読み込みます

### 主な機能
#### 右クリックスクロール機能
マウスの右ボタンをドラッグすることでスムーズなスクロールが可能です：
- **右クリック + ドラッグ**: スクロール操作
- **右クリック（ドラッグせず）**: 通常の右クリックメニュー表示

この機能により、トラックパッドを使わずにマウスだけで快適にスクロールできます。

### 設定ファイルの編集
設定をカスタマイズする場合は、以下のファイルを編集してください：
```bash
# 設定ファイルを編集
code ~/dotfiles/config/hammerspoon/init.lua

# 編集後、Hammerspoon内でリロードするか、再起動してください
```

# 重要な設定事項

## 個人設定の調整

### GitHub設定
`open-my-repos`関数でGitHubリポジトリを参照する場合、以下のいずれかを設定してください：

#### 方法1: 環境変数で設定（推奨）
```bash
# config/zsh/env.zshで以下のコメントアウトを解除し、実際のユーザー名に変更
export GITHUB_USERNAME="your-github-username"
```

#### 方法2: Git configを使用
```bash
# グローバルにGitユーザー名を設定（GitHub APIで使用されます）
git config --global user.name "your-github-username"
```


## トラブルシューティング

### よくある問題と解決方法

#### `open-my-repos`関数でエラーが出る場合
```bash
Error: GitHub username not found. Please set GITHUB_USERNAME environment variable or configure git user.name
```
**解決方法**: 上記の「GitHub設定」セクションを参照して、GitHubユーザー名を設定してください。

# おすすめサイト
iterm2の設定：
https://qiita.com/ruwatana/items/8d9c174250061721ad11

# トラックボール　カーソルスクロール
https://qiita.com/zyyx-matsushita/items/070f7e9d021ac099b5e2

# インストールアプリ
https://clipy-app.com/
