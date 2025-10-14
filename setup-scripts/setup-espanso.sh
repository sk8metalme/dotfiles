#!/bin/bash

# =============================================================================
# espanso セットアップスクリプト
# =============================================================================
# 
# このスクリプトはespansoの設定を自動的にセットアップします。
# - espansoのインストール確認
# - 設定ディレクトリの作成
# - dotfilesからの設定ファイルコピー
# - espansoサービスの開始
#
# 使用方法:
#   ./setup-espanso.sh
#
# =============================================================================

set -e

# 色付きメッセージ用の関数
print_success() {
    echo -e "\033[32m✓ $1\033[0m"
}

print_info() {
    echo -e "\033[34mℹ $1\033[0m"
}

print_warning() {
    echo -e "\033[33m⚠ $1\033[0m"
}

print_error() {
    echo -e "\033[31m✗ $1\033[0m"
}

# スクリプトのディレクトリを取得
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
ESPANSO_CONFIG_DIR="$HOME/.config/espanso"
DOTFILES_ESPANSO_DIR="$DOTFILES_DIR/config/espanso"

print_info "espansoセットアップを開始します..."

# espansoがインストールされているかチェック
if ! command -v espanso &> /dev/null; then
    print_error "espansoがインストールされていません"
    print_info "以下のコマンドでインストールしてください:"
    print_info "  brew install espanso"
    exit 1
fi

print_success "espansoがインストールされています"

# espansoのバージョンを表示
ESPANSO_VERSION=$(espanso --version 2>/dev/null || echo "不明")
print_info "espansoバージョン: $ESPANSO_VERSION"

# 既存の設定ディレクトリがある場合はバックアップ
if [ -d "$ESPANSO_CONFIG_DIR" ]; then
    BACKUP_DIR="$ESPANSO_CONFIG_DIR.backup.$(date +%Y%m%d_%H%M%S)"
    print_warning "既存のespanso設定をバックアップします: $BACKUP_DIR"
    mv "$ESPANSO_CONFIG_DIR" "$BACKUP_DIR"
fi

# 設定ディレクトリを作成
print_info "espanso設定ディレクトリを作成します: $ESPANSO_CONFIG_DIR"
mkdir -p "$ESPANSO_CONFIG_DIR/config"
mkdir -p "$ESPANSO_CONFIG_DIR/match"

# dotfilesから設定ファイルをコピー
print_info "dotfilesから設定ファイルをコピーします..."

if [ -f "$DOTFILES_ESPANSO_DIR/config/default.yml" ]; then
    cp "$DOTFILES_ESPANSO_DIR/config/default.yml" "$ESPANSO_CONFIG_DIR/config/"
    print_success "default.yml をコピーしました"
else
    print_error "default.yml が見つかりません: $DOTFILES_ESPANSO_DIR/config/default.yml"
    exit 1
fi

# マッチファイルをコピー
for match_file in cursor.yml confluence.yml jira.yml; do
    if [ -f "$DOTFILES_ESPANSO_DIR/match/$match_file" ]; then
        cp "$DOTFILES_ESPANSO_DIR/match/$match_file" "$ESPANSO_CONFIG_DIR/match/"
        print_success "$match_file をコピーしました"
    else
        print_warning "$match_file が見つかりません（スキップします）"
    fi
done

# 設定ファイルの権限を設定
print_info "設定ファイルの権限を設定します..."
find "$ESPANSO_CONFIG_DIR" -type f -exec chmod 644 {} \;
find "$ESPANSO_CONFIG_DIR" -type d -exec chmod 755 {} \;

# espansoサービスを停止（既に実行中の場合）
print_info "espansoサービスを停止します..."
espanso service stop 2>/dev/null || true

# espansoサービスを登録・開始
print_info "espansoサービスを登録・開始します..."
if espanso service register 2>/dev/null; then
    print_success "espansoサービスを登録しました"
else
    print_warning "espansoサービスの登録に失敗しました（既に登録済みの可能性があります）"
fi

if espanso service start 2>/dev/null; then
    print_success "espansoサービスを開始しました"
else
    print_error "espansoサービスの開始に失敗しました"
    print_info "手動で開始してください: espanso service start"
fi

# 設定の検証
print_info "設定を検証します..."
sleep 2

if espanso status &> /dev/null; then
    print_success "espansoが正常に動作しています"
else
    print_warning "espansoの状態を確認できませんでした"
    print_info "手動で確認してください: espanso status"
fi

# 設定ファイルの一覧を表示
print_info "設定されたファイル:"
find "$ESPANSO_CONFIG_DIR" -type f -name "*.yml" | sort | while read -r file; do
    echo "  - $(basename "$file")"
done

print_success "espansoのセットアップが完了しました！"
print_info ""
print_info "使用方法:"
print_info "  - トリガーを入力してテキストを展開"
print_info "  - 例（Cursor IDE内）: ':console' → console.log();"
print_info "  - 例（Confluence）: ':h1' → h1. 見出し"
print_info "  - 例（JIRA）: ':bugtemplate' → バグレポートテンプレート"
print_info "  - ALT+SPACE でespansoの検索画面を開く"
print_info ""
print_info "設定ファイル:"
print_info "  - 基本設定: ~/.config/espanso/config/default.yml"
print_info "  - Cursor IDE: ~/.config/espanso/match/cursor.yml"
print_info "  - Confluence: ~/.config/espanso/match/confluence.yml"
print_info "  - JIRA: ~/.config/espanso/match/jira.yml"
print_info ""
print_info "espansoコマンド:"
print_info "  - espanso status    # ステータス確認"
print_info "  - espanso restart   # 再起動"
print_info "  - espanso stop      # 停止"
print_info "  - espanso start     # 開始"

