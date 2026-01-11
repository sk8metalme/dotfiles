# Raycast 完全マスター ハンズオンガイド

macOSの生産性を劇的に向上させるランチャーアプリ「Raycast」の完全ガイドです。インストールから上級テクニックまで、ステップバイステップで解説します。

---

## 目次

1. [インストールと初期設定](#1-インストールと初期設定)
2. [初級編：基本操作をマスター](#2-初級編基本操作をマスター)
3. [初級編：Spotlight置き換えと便利コマンド](#3-初級編spotlight置き換えと便利コマンド)
4. [中級編：VSCode連携とGit操作](#4-中級編vscode連携とgit操作)
5. [中級編：ターミナル連携とQuicklinks](#5-中級編ターミナル連携とquicklinks)
6. [上級編：クリップボード履歴とウィンドウ管理](#6-上級編クリップボード履歴とウィンドウ管理)
7. [上級編：スクリプトコマンドとワークフロー自動化](#7-上級編スクリプトコマンドとワークフロー自動化)
8. [設定まとめ・チートシート](#8-設定まとめチートシート)

---

## 1. インストールと初期設定

### 1.1 インストール方法

#### 方法A：公式サイトから（推奨）

1. https://www.raycast.com/ にアクセス
2. 「Download for Mac」をクリック
3. ダウンロードした `.dmg` ファイルを開く
4. Raycast を Applications フォルダにドラッグ

#### 方法B：Homebrewから

```bash
brew install --cask raycast
```

### 1.2 初回起動と権限設定

1. Raycastを起動
2. アクセス許可を求められたら許可：
   - **アクセシビリティ** → 許可
   - **オートメーション** → 許可
3. Raycastアカウント作成（任意だが設定同期に便利）

### 1.3 基本的な起動方法

デフォルトのホットキー：

```
⌥ + Space（Option + Space）
```

---

## 2. 初級編：基本操作をマスター

### 2.1 アプリを起動する

1. Raycast起動（`⌥ + Space`）
2. アプリ名を入力（例：`chrome`, `vscode`, `finder`）
3. Enterで起動

Raycastは学習機能があり、よく使うアプリが上位に表示されるようになります。

### 2.2 設定画面を開く

1. Raycast起動
2. 「`raycast settings`」と入力 → Enter

主要なタブ：

| タブ | 用途 |
|------|------|
| General | 起動ホットキー変更など |
| Extensions | 拡張機能の管理・Hotkey設定 |
| Hotkey | グローバルホットキー一覧 |

### 2.3 アプリにHotkeyを設定する

1. Raycast起動 → アプリ名を入力
2. `Cmd + K` を押す（アクションメニュー）
3. 「Configure Hotkey」を選択
4. 好きなキーを入力

例：

| Hotkey | アプリ |
|--------|--------|
| `Ctrl + Cmd + V` | VSCode |
| `Ctrl + Cmd + C` | Chrome |

### 2.4 計算・単位変換

Raycastは電卓や単位変換も即座に実行できます。

```
1024 * 768        → 計算結果を表示
100 usd to jpy    → 為替変換
5km to miles      → 単位変換
```

結果はEnterでクリップボードにコピーされます。

---

## 3. 初級編：Spotlight置き換えと便利コマンド

### 3.1 Spotlightを無効化してRaycastを `Cmd + Space` に設定

#### Step 1：Spotlightを無効化

1. システム設定を開く
2. キーボード → キーボードショートカット
3. 左メニューから「Spotlight」を選択
4. 「Spotlightを表示」のチェックを外す

#### Step 2：Raycastを `Cmd + Space` に設定

1. Raycast起動 → 「`raycast settings`」→ Enter
2. Generalタブを選択
3. Raycast Hotkey欄をクリック
4. `Cmd + Space` を入力

### 3.2 ファイル検索

1. Raycast起動
2. 「`file`」と入力 → 「File Search」を選択
3. ファイル名を入力して検索

操作方法：

| 操作 | 動作 |
|------|------|
| Enter | ファイルを開く |
| Cmd + Enter | Finderで表示 |
| Cmd + K | アクションメニュー |

### 3.3 システムコマンド

| コマンド | 動作 |
|----------|------|
| `sleep` | Macをスリープ |
| `lock` | 画面をロック |
| `empty trash` | ゴミ箱を空にする |
| `eject all` | 全ディスクを取り出し |
| `quit all apps` | 全アプリを終了 |
| `restart` | 再起動 |
| `shutdown` | シャットダウン |

`lock` にHotkeyを設定しておくと便利です（例：`Ctrl + Cmd + L`）。

### 3.4 Emoji検索

1. Raycast起動 → 「`emoji`」と入力 → Enter
2. 絵文字を検索（例：`rocket` → 🚀）
3. Enterで入力またはコピー

おすすめHotkey：`Ctrl + Cmd + E`

### 3.5 Color Picker（カラーピッカー）

1. Raycast起動 → 「`pick color`」と入力 → Enter
2. 画面上の任意の場所をクリック
3. カラーコード（HEX）がクリップボードにコピーされる

おすすめHotkey：`Ctrl + Cmd + P`

---

## 4. 中級編：VSCode連携とGit操作

### 4.1 Raycast Storeの使い方

1. Raycast起動
2. 「`store`」と入力 → 「Raycast Store」を選択
3. 拡張機能を検索してインストール

### 4.2 VSCode拡張をインストール

1. Store画面で「`Visual Studio Code`」と検索
2. 「Visual Studio Code」拡張を選択
3. 「Install」をクリック

### 4.3 最近のプロジェクトを開く

1. Raycast起動 → 「`recent projects`」と入力
2. 「Search Recent Projects」を選択
3. プロジェクト一覧から選んでEnter

おすすめHotkey：`Ctrl + Cmd + R`

### 4.4 Finderから直接VSCodeで開く

1. Finderで任意のフォルダを開く
2. Raycast起動 → 「`open with vscode`」と入力
3. 「Open Current Finder Directory in VS Code」を選択

### 4.5 GitHub拡張をインストール

1. Raycast起動 → 「`store`」→ Enter
2. 「`git`」と検索
3. 「GitHub」拡張をインストール

利用可能なコマンド：

| コマンド | 機能 |
|----------|------|
| Search Repositories | リポジトリ検索 |
| My Pull Requests | 自分のPR一覧 |
| Search Issues | Issue検索 |
| Create Issue | Issue作成 |
| Unread Notifications | 未読通知 |

### 4.6 GitHubリポジトリを検索して開く

1. Raycast起動 → 「`search repo`」と入力
2. 「Search Repositories」を選択
3. 初回はGitHub認証を実施
4. リポジトリ名を入力して検索
5. Enterでブラウザで開く、または `Cmd + K` でアクション選択

---

## 5. 中級編：ターミナル連携とQuicklinks

### 5.1 iTerm2拡張をインストール

1. Raycast起動 → 「`store`」→ Enter
2. 「`iterm`」と検索
3. 「iTerm」拡張をインストール

利用可能なコマンド：

| コマンド | 機能 |
|----------|------|
| Create New iTerm Tab | 新しいタブを開く |
| Create New iTerm Window | 新しいウィンドウを開く |
| Search iTerm Sessions | セッション検索 |

### 5.2 Quicklinksとは

よく使うURLやアクションをショートカット化できる機能です。

```
gh {query}     → GitHubで検索
npm {query}    → npmパッケージ検索
mdn {query}    → MDN Web Docs検索
```

### 5.3 Quicklinkの作成方法

1. Raycast起動 → 「`create quicklink`」と入力 → Enter
2. 必要項目を入力して作成

### 5.4 おすすめQuicklinks

#### GitHub検索

| 項目 | 入力内容 |
|------|----------|
| Name | GitHub Search |
| Link | `https://github.com/search?q={query}` |
| Keyword | `gh` |

#### npm パッケージ検索

| 項目 | 入力内容 |
|------|----------|
| Name | npm Search |
| Link | `https://www.npmjs.com/search?q={query}` |
| Keyword | `npm` |

#### MDN Web Docs 検索

| 項目 | 入力内容 |
|------|----------|
| Name | MDN Search |
| Link | `https://developer.mozilla.org/ja/search?q={query}` |
| Keyword | `mdn` |

#### Stack Overflow 検索

| 項目 | 入力内容 |
|------|----------|
| Name | Stack Overflow |
| Link | `https://stackoverflow.com/search?q={query}` |
| Keyword | `so` |

#### Google 翻訳（英→日）

| 項目 | 入力内容 |
|------|----------|
| Name | Google Translate EN-JA |
| Link | `https://translate.google.com/?sl=en&tl=ja&text={query}` |
| Keyword | `enja` |

#### Google 翻訳（日→英）

| 項目 | 入力内容 |
|------|----------|
| Name | Google Translate JA-EN |
| Link | `https://translate.google.com/?sl=ja&tl=en&text={query}` |
| Keyword | `jaen` |

#### localhost

| 項目 | 入力内容 |
|------|----------|
| Name | Localhost 3000 |
| Link | `http://localhost:3000` |
| Keyword | `lh` |

### 5.5 Quicklinksの管理

1. Raycast起動 → 「`raycast settings`」→ Enter
2. 左メニューから「Extensions」を選択
3. 「Quicklinks」を探してクリック
4. 作成したQuicklinkを編集・削除

---

## 6. 上級編：クリップボード履歴とウィンドウ管理

### 6.1 クリップボード履歴

Raycastには強力なクリップボード管理機能が標準搭載されています。

#### 基本的な使い方

1. Raycast起動 → 「`clipboard`」と入力
2. 「Clipboard History」を選択
3. 過去のコピー履歴から選択してペースト

おすすめHotkey：`Cmd + Shift + V`

#### 操作方法

| 操作 | 動作 |
|------|------|
| Enter | 選択した内容をペースト |
| Cmd + Enter | ペーストせずにクリップボードにコピー |
| Cmd + K | アクションメニュー |
| 検索入力 | 履歴内を検索 |

#### クリップボード履歴の設定

1. Raycast起動 → 「`raycast settings`」→ Enter
2. Extensions → Clipboard History

| 設定項目 | おすすめ設定 |
|----------|-------------|
| Keep History For | 30 Days または Unlimited |
| Treat as Confidential | パスワードマネージャーのアプリを追加 |

### 6.2 ウィンドウ管理

#### 利用可能なコマンド

| コマンド | 動作 |
|----------|------|
| Left Half | 左半分に配置 |
| Right Half | 右半分に配置 |
| Top Half | 上半分に配置 |
| Bottom Half | 下半分に配置 |
| Maximize | 最大化 |
| Center | 中央に配置 |
| Make Smaller | 小さくする |
| Make Larger | 大きくする |

#### おすすめHotkey設定

| Hotkey | 機能 |
|--------|------|
| `Ctrl + Option + ←` | 左半分 |
| `Ctrl + Option + →` | 右半分 |
| `Ctrl + Option + ↑` | 最大化 |
| `Ctrl + Option + C` | 中央配置 |

### 6.3 ブラウザタブ検索

#### Browser Tabs拡張をインストール

1. Raycast起動 → 「`store`」→ Enter
2. 「`browser tabs`」と検索
3. 「Browser Tabs」拡張をインストール

#### タブを検索して切り替え

1. Raycast起動 → 「`tabs`」と入力
2. 「Search Browser Tabs」を選択
3. タブのタイトルで検索 → Enterでジャンプ

おすすめHotkey：`Ctrl + Cmd + T`

---

## 7. 上級編：スクリプトコマンドとワークフロー自動化

### 7.1 スクリプトコマンドとは

シェルスクリプトやPython、Node.jsなどをRaycastから実行できる機能です。

### 7.2 スクリプトフォルダの準備

```bash
mkdir -p ~/.raycast-scripts
```

### 7.3 スクリプトフォルダをRaycastに登録

1. Raycast起動 → 「`raycast settings`」→ Enter
2. Extensions → 右上の「+」ボタン
3. 「Add Script Directory」を選択
4. `~/.raycast-scripts` フォルダを選択

### 7.4 スクリプトの基本構造

```bash
#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title スクリプト名
# @raycast.mode inline|fullOutput|silent

# Optional parameters:
# @raycast.icon 🚀
# @raycast.packageName カテゴリ名

# スクリプト本体
echo "Hello, World!"
```

#### modeの種類

| mode | 動作 |
|------|------|
| inline | Raycast内に結果を表示 |
| fullOutput | 新しいウィンドウで結果を表示 |
| silent | 結果を表示せず実行 |

### 7.5 スクリプトへの実行権限付与

作成したスクリプトには実行権限が必要です。

```bash
chmod +x ~/.raycast-scripts/スクリプト名.sh
```

---

## 8. 設定まとめ・チートシート

### 8.1 Hotkey一覧

| Hotkey | 機能 |
|--------|------|
| `Cmd + Space` | Raycast起動 |
| `Ctrl + Cmd + V` | VSCode起動 |
| `Ctrl + Cmd + C` | Chrome起動 |
| `Ctrl + Cmd + L` | 画面ロック |
| `Ctrl + Cmd + E` | 絵文字検索 |
| `Ctrl + Cmd + P` | カラーピッカー |
| `Ctrl + Cmd + R` | VSCode最近のプロジェクト |
| `Ctrl + Cmd + T` | ブラウザタブ検索 |
| `Cmd + Shift + V` | クリップボード履歴 |
| `Ctrl + Option + ←` | ウィンドウ左半分 |
| `Ctrl + Option + →` | ウィンドウ右半分 |
| `Ctrl + Option + ↑` | ウィンドウ最大化 |
| `Ctrl + Option + C` | ウィンドウ中央 |

### 8.2 Quicklinks一覧

| Keyword | 用途 |
|---------|------|
| `gh {query}` | GitHub検索 |
| `npm {query}` | npmパッケージ検索 |
| `mdn {query}` | MDN検索 |
| `so {query}` | Stack Overflow検索 |
| `enja {text}` | 英→日翻訳 |
| `jaen {text}` | 日→英翻訳 |
| `mygh` | 自分のGitHub |
| `lh` | localhost:3000 |
| `lh8` | localhost:8080 |

### 8.3 インストール済み拡張機能

| 拡張機能 | 用途 |
|----------|------|
| Visual Studio Code | VSCode連携 |
| GitHub | GitHub連携 |
| iTerm | iTerm2連携 |
| Browser Tabs | ブラウザタブ検索 |

---

## 次のステップ

さらにRaycastを活用したい場合は、以下の機能も試してみてください。

- **Raycast AI** - AIチャット・翻訳・要約
- **Snippets** - テキストスニペット管理
- **Floating Notes** - フローティングメモ
- **拡張機能開発** - TypeScriptで自作拡張

---

*このガイドは随時更新されます。最新情報はRaycast公式ドキュメントを参照してください。*
