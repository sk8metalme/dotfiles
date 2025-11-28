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
│   ├── espanso/
│   │   ├── config/
│   │   │   └── default.yml     # espansoのメイン設定
│   │   └── match/
│   │       ├── ai-coding-prompts.yml # AIコーディング支援プロンプト
│   │       ├── ai-tools.yml    # AIツール関連のスニペット
│   │       ├── base.yml        # 基本的なスニペット
│   │       ├── code-phrases.yml # コードフレーズ
│   │       ├── frameworks.yml  # フレームワーク関連
│   │       ├── programming-lang.yml # プログラミング言語関連
│   │       ├── tech-terms.yml  # 技術用語
│   │       ├── tools.yml       # ツール関連
│   │       └── voice-input-helpers.yml # 音声入力効率化
│   ├── hammerspoon/            # Hammerspoon（ウィンドウ管理・自動化ツール）設定
│   │   └── init.lua            # Hammerspoon設定ファイル
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
│   ├── setup-espanso.sh        # espansoのセットアップ
│   ├── setup-hammerspoon.sh    # Hammerspoonのセットアップ
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

# プログラミングフォントのインストール

`install-brew-package.sh` を実行すると、以下のフォントが自動インストールされます：

- **JetBrains Mono**: 合字対応のプログラミングフォント
- **HackGen**: 日本語に最適化されたプログラミングフォント
- **Ricty Diminished**: 日本語プログラミングフォント

VS Codeの設定 (`config/vscode/settings.json`) でこれらのフォントが使用されます。

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

# Espansoのセットアップ
```zsh
# 実行権限付与
chmod +x ~/dotfiles/setup-scripts/setup-espanso.sh
# 実行
~/dotfiles/setup-scripts/setup-espanso.sh
```

## Espanso - AIコーディング支援機能
生成AI（Claude、ChatGPT、Copilotなど）を使ったコーディングに便利なプロンプトテンプレート集を用意しています。

### 主な機能

#### コードレビュー
- `:airv` - コードレビュー依頼（詳細）
- `:airvja` - コードレビュー依頼（日本語）

#### リファクタリング
- `:airf` - リファクタリング依頼
- `:airfclean` - クリーンコード原則でリファクタリング

#### バグ修正・デバッグ
- `:aibug` - バグ修正依頼
- `:aierr` - エラー解決依頼
- `:aidebug` - デバッグ支援
- `:aifix` - クイック修正

#### テスト
- `:aitest` - ユニットテスト生成
- `:aitdd` - TDDアプローチでのテスト作成

#### ドキュメント
- `:aidoc` - コードドキュメント生成
- `:aireadme` - README作成
- `:aicommit` - コミットメッセージ生成

#### コード説明・学習
- `:aiex` - コード説明（初心者向け）
- `:aiexstep` - 1行ずつ詳しく説明
- `:ailearn` - 技術学習支援

#### コード生成
- `:aigen` - 要件からコード生成
- `:aifunc` - 関数実装
- `:aiapi` - API設計

#### 最適化・セキュリティ
- `:aiperf` - パフォーマンス最適化
- `:aiopt` - 一般的な最適化
- `:aisec` - セキュリティチェック

#### その他
- `:aiarch` - アーキテクチャ設計
- `:aibp` - ベストプラクティス確認
- `:aiconv` - コード変換
- `:aicomp` - コード比較
- `:aipair` - ペアプログラミング風

#### 日本語プロンプト
- `:あいれびゅー` - コードレビュー（日本語）
- `:あいせつめい` - コード説明（日本語）
- `:あいてすと` - テスト作成（日本語）

### 使用例
1. テキストエディタやIDEで `:airv` と入力
2. Espansoがプロンプトテンプレートに展開
3. `$|$` の位置にコードを貼り付け
4. AIツール（Claude、ChatGPT等）にコピー&ペースト

### Tips
- `$|$` はカーソル位置を示すプレースホルダーです
- プロンプトは自由にカスタマイズ可能です
- `config/espanso/match/ai-coding-prompts.yml` を編集してください

## Espanso - 音声入力効率化機能
macOSの音声入力機能と組み合わせて、より効率的にテキスト入力ができるスニペット集です。

### 句読点・記号
音声で言いやすいトリガーで、記号や句読点を素早く入力：

| トリガー | 出力 | 説明 |
|---------|------|------|
| `まる` | 。 | 句点 |
| `てん` | 、 | 読点 |
| `かっこ` | （） | 丸括弧 |
| `かぎかっこ` | 「」 | かぎ括弧 |
| `すみつきかっこ` | 【】 | 隅付き括弧 |
| `びっくり` | ！ | 感嘆符 |
| `はてな` | ？ | 疑問符 |
| `ころん` | ： | コロン |
| `さんてんりーだー` | … | 三点リーダー |

### Markdown記法
音声入力でMarkdownを快適に編集：

| トリガー | 出力 | 説明 |
|---------|------|------|
| `みだし１` | # | 見出し1 |
| `みだし２` | ## | 見出し2 |
| `みだし３` | ### | 見出し3 |
| `ぼーるど` | \*\*\*\* | 太字 |
| `いたりっく` | \*\* | 斜体 |
| `りすと` | - | リスト項目 |
| `ばんごうりすと` | 1. | 番号付きリスト |
| `いんようふ` | > | 引用 |
| `すいへいせん` | --- | 水平線 |
| `りんく` | [リンクテキスト](https://example.com) | リンク |
| `がぞう` | ![代替テキスト](image.jpg) | 画像 |
| `いんらいんこーど` | \`\` | インラインコード |

### コードブロック
プログラミング言語別のコードブロックを音声で挿入：

| トリガー | 出力 |
|---------|------|
| `こーどぶろっく` | \`\`\`<br>\`\`\` |
| `ぱいそんこーど` | \`\`\`python<br>\`\`\` |
| `じゃばすくりぷとこーど` | \`\`\`javascript<br>\`\`\` |
| `たいぷすくりぷとこーど` | \`\`\`typescript<br>\`\`\` |
| `ばっしゅこーど` | \`\`\`bash<br>\`\`\` |

### プログラミング記号
音声で言いやすい形式でコーディング記号を入力：

| トリガー | 出力 | 説明 |
|---------|------|------|
| `だぶるこーと` | "" | ダブルクォート |
| `しんぐるこーと` | '' | シングルクォート |
| `だいなり` | > | 大なり |
| `しょうなり` | < | 小なり |
| `だいなりいこーる` | >= | 以上 |
| `しょうなりいこーる` | <= | 以下 |
| `だぶるいこーる` | == | 等価 |
| `とりぷるいこーる` | === | 厳密等価 |
| `のっといこーる` | != | 不等価 |
| `あろーふぁんくしょん` | => | アロー関数 |
| `あっとまーく` | @ | アットマーク |
| `しゃーぷ` | # | シャープ |
| `あすたりすく` | * | アスタリスク |
| `すらっしゅ` | / | スラッシュ |
| `ばっくすらっしゅ` | \\ | バックスラッシュ |
| `ぱいぷ` | \| | パイプ |
| `あんだーばー` | _ | アンダーバー |

### HTMLタグ
音声でHTMLタグを素早く挿入：

| トリガー | 出力 |
|---------|------|
| `でぃぶたぐ` | &lt;div&gt;&lt;/div&gt; |
| `すぱんたぐ` | &lt;span&gt;&lt;/span&gt; |
| `ぴーたぐ` | &lt;p&gt;&lt;/p&gt; |
| `えーたぐ` | &lt;a href=""&gt;&lt;/a&gt; |
| `いめーじたぐ` | &lt;img src="" alt=""&gt; |

### 記号・矢印
よく使う記号や矢印を音声で：

| トリガー | 出力 |
|---------|------|
| `やじるし` | → |
| `ひだりやじるし` | ← |
| `うえやじるし` | ↑ |
| `したやじるし` | ↓ |
| `にじゅうやじるし` | ⇒ |
| `ちぇっく` | ✓ |

### エモジ
音声でエモジを挿入：

| トリガー | 出力 |
|---------|------|
| `えもじちぇっく` | ✅ |
| `えもじばつ` | ❌ |
| `えもじわーにんぐ` | ⚠️ |
| `えもじいんふぉ` | ℹ️ |
| `えもじでんきゅう` | 💡 |
| `えもじろけっと` | 🚀 |
| `えもじほし` | ⭐ |

### フォーマット
テキストのレイアウト調整：

| トリガー | 出力 | 説明 |
|---------|------|------|
| `かいぎょう` | \n | 改行 |
| `にかいぎょう` | \n\n | 2回改行 |
| `たぶ` | (4スペース) | インデント |
| `すぺーす` | (半角スペース) | スペース |
| `ぜんかくすぺーす` | (全角スペース) | 全角スペース |

### タスク管理
コメント用のキーワード：

| トリガー | 出力 |
|---------|------|
| `とぅどぅー` | TODO: |
| `のーと` | NOTE: |
| `わーにんぐ` | WARNING: |
| `ふぃっくすみー` | FIXME: |

### 使用方法
1. macOSの音声入力をオン（command + fn キー2回押し）
2. 「まる」「てん」「かっこ」などのトリガーワードを話す
3. Espansoが自動的に対応する記号に変換

### 音声入力のコツ
- はっきりと発音する
- トリガーワードの前後に少し間を入れる
- 複雑な記号は音声で名前を言うだけで入力完了
- キーボードと音声を組み合わせて効率アップ

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
- ✅ **外部ツール対応**: LM Studio CLI等の外部ツールも`$HOME`ベースで自動対応

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

# トラックボール　カーソルスクロール
https://qiita.com/zyyx-matsushita/items/070f7e9d021ac099b5e2

# インストールアプリ
https://clipy-app.com/
