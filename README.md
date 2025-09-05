# dotfilesのディレクトリ構造
ホームディレクトリ直下にクローンすることをおすすめします。（それ以外にクローンする時は、dotfiles/zshenvの以下を編集してください。）

コードの解説は[こちら](https://qiita.com/Rockreeee/items/e59b1c4c764d4079c657)

```zsh
~/dotfiles/
├── config/
│   ├── claude/   
│   │   ├── .claude/            # Claude追加設定ディレクトリ
│   │   │   ├── agents/         # エージェント定義ファイル群
│   │   │   ├── commands/       # コマンド定義ファイル群
│   │   │   └── settings.json   # Claude詳細設定
│   │   ├── CLAUD.md            # Codex連携ガイド
│   │   └── settings.json       # Claude Codeの設定ファイル
│   ├── codex/
│   │   ├── config.toml         # Codex設定ファイル
│   │   └── notify_macos.sh     # macOS通知スクリプト
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
│   ├── install-oh-my-zsh.sh    # oh-my-zshのインストール
│   ├── install_claude.sh       # Claude Code設定のセットアップ
│   ├── install_npm.sh          # Claude Code npmパッケージのインストール
│   ├── setup-git.sh            # gitのセットアップ
│   ├── setup-MacOS.sh          # mac設定のセットアップ
│   ├── setup-vscode.sh         # vscodeのセットアップ
│   └── setup-zsh.sh            # zshのセットアップ
├── CLAUDE.md                   # Claude Code用プロジェクト指示書
├── .gitconfig                  # Gitの設定ファイル
├── .zshenv                     # 全シェルで適用される設定
└── .zshrc                      # インタラクティブシェル用の設定
```
<span style="color:red;">.gitconfig-personal</span>と<span style="color:red;">.gitconfig-work</span>は自身で追加する必要あり。

- **.gitconfig-personal**: 個人のGitの設定ファイル
```zsh
[user]
	name = gitアカウントの名前【個人】
	email = gitアカウントのメアド【個人】
```

- **.gitconfig-work**: 会社のGitの設定ファイル
```zsh
[user]
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

# gitのセットアップ
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/setup-git.sh
# 実行
~/dotfiles/setup-scripts/setup-git.sh
```

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

# Claude Codeのセットアップ
## Claude Code npmパッケージのインストール
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/install_npm.sh
# 実行
~/dotfiles/setup-scripts/install_npm.sh
```

## Claude Code設定のセットアップ
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/install_claude.sh
# 実行
~/dotfiles/setup-scripts/install_claude.sh
```

# Codexの設定

## Codexのインストールとセットアップ
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/install_codex.sh
# 実行
~/dotfiles/setup-scripts/install_codex.sh
```

## Codex連携について
CodexからClaude Codeを呼び出し、複数ターンに渡って協働できます。

### 基本的な使用方法
```bash
codex <<EOF
<質問・依頼内容>
EOF
```

## 設定ファイル
- `config/codex/config.toml`: Codexの基本設定（信頼レベル、推論レベル、ツール設定）
- `config/codex/notify_macos.sh`: macOS通知用スクリプト
- `config/claude/CLAUD.md`: Codex連携ガイド

## Claude設定の詳細
### 基本設定（`config/claude/settings.json`）
- **権限管理**: 許可/拒否されるコマンドの制御
- **Git操作**: ブランチ保護、コミット要件の設定
- **セキュリティ**: シークレット検出、依存関係スキャン
- **チーム管理**: レビュアー設定、コードオーナー定義

### エージェント設定（`config/claude/.claude/agents/`）
以下のエージェントが利用可能です：
- `analyzer-pj.md`: プロジェクト分析エージェント
- `developer.md`: 開発エージェント
- `design-expert.md`: デザインエキスパート
- `manager-pj.md`: プロジェクト管理エージェント
- `review-cq.md`: コード品質レビューエージェント
- `test-developer.md`: テスト開発エージェント

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

### Google Cloud SDK
Google Cloud SDKを使用する場合、標準の場所（`~/Downloads/google-cloud-sdk/`）にインストールしてください。
```bash
# 自動で以下のパスが参照されます
# $HOME/Downloads/google-cloud-sdk/path.zsh.inc
# $HOME/Downloads/google-cloud-sdk/completion.zsh.inc
```

## ポータブル性について
このdotfilesは完全にポータブルに設計されており、以下の利点があります：
- ✅ **ユーザー非依存**: どのmacOSユーザーでも動作
- ✅ **自動パス解決**: `$HOME`環境変数を使用
- ✅ **設定の分離**: 個人設定は環境変数で管理
- ✅ **安全なフォールバック**: 設定不足時の適切なエラーメッセージ

## トラブルシューティング

### よくある問題と解決方法

#### `open-my-repos`関数でエラーが出る場合
```bash
Error: GitHub username not found. Please set GITHUB_USERNAME environment variable or configure git user.name
```
**解決方法**: 上記の「GitHub設定」セクションを参照して、GitHubユーザー名を設定してください。

#### Google Cloud SDKが見つからない場合
Google Cloud SDKのパスが標準の場所にない場合は、.zshrcの該当箇所を手動で編集してください：
```bash
# .zshrcの50-53行目付近
if [ -f "$HOME/your-custom-path/google-cloud-sdk/path.zsh.inc" ]; then
    . "$HOME/your-custom-path/google-cloud-sdk/path.zsh.inc"
fi
```

#### Codex通知が動作しない場合
1. `~/.codex/notify_macos.sh`ファイルが存在するか確認
2. 実行権限があるか確認: `ls -la ~/.codex/notify_macos.sh`
3. 必要に応じて権限付与: `chmod +x ~/.codex/notify_macos.sh`

**macOS通知が表示されない場合:**
```bash
# デバッグモードで詳細情報を確認
CODEX_DEBUG=1 ~/.codex/notify_macos.sh "テスト" "確認"

# macOSの通知設定を確認してください：
# システム設定 > 通知 > ターミナル.app > 通知を許可
# おやすみモード（Focus）が有効でないか確認
```

**注意**: macOSの通知設定の問題で通知センターに表示されない場合でも、コンソールには常に通知メッセージが表示されます。

# おすすめサイト
iterm2の設定：
https://qiita.com/ruwatana/items/8d9c174250061721ad11

# インストールアプリ
https://clipy-app.com/
