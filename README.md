# dotfilesのディレクトリ構造
ホームでヒレクトリ直下にクローンすることをおすすめします。（それ以外にクローンする時は、dotfiles/zshenvの以下を編集してください。）

コードの解説は[こちら](https://qiita.com/Rockreeee/items/e59b1c4c764d4079c657)

```zsh
~/dotfiles/
├── config/
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
│   │       └── tools.yml       # ツール関連
│   ├── vscode/   
│   │   ├── extensions          # vscodeの拡張機能一覧
│   │   ├── keybindings.json    # vscodeのキーバインド
│   │   └── settings.json       # vscodeの設定ファイル
│   └── zsh/   
│       ├── alias.zsh           # エイリアスの定義
│       ├── bindkey.zsh         # キーバインドの定義
│       ├── completion.zsh      # キーバインドの定義
│       ├── env.zsh             # 環境変数の設定
│       ├── functions.zsh       # 関数の定義
│       └── oh-my-zsh.zsh       # oh-my-zshの設定
├── setup-scripts/
│   ├── install-apps.sh         # アプリのインストール
│   ├── install-brew-package.sh # homebrewのパッケージインストール
│   ├── install-oh-my-zsh.sh    # oh-my-zshのインストール
│   ├── setup-espanso.sh        # espansoのセットアップ
│   ├── setup-git.sh            # gitのセットアップ
│   ├── setup-MacOS.sh          # mac設定のセットアップ
│   ├── setup-vscode.sh         # vscodeのセットアップ
│   └── setup-zsh.sh            # zshのセットアップ
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

# おすすめサイト
iterm2の設定：
https://qiita.com/ruwatana/items/8d9c174250061721ad11
