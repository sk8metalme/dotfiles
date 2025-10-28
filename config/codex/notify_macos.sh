#!/bin/bash
# macOS notification script for Codex

MESSAGE="$1"
TITLE="${2:-Codex}"

# メッセージが空の場合のデフォルト設定
if [ -z "$MESSAGE" ]; then
    MESSAGE="(Empty message)"
fi

# terminal-notifier利用の通知システム
if command -v terminal-notifier >/dev/null 2>&1; then
    # terminal-notifierで通知送信
    terminal-notifier -message "$MESSAGE" -title "$TITLE" -sound default 2>/dev/null
else
    # terminal-notifierが無い場合のフォールバック
    osascript -e "display notification \"$MESSAGE\" with title \"$TITLE\"" 2>/dev/null
fi

# コンソール通知（バックアップ表示）
echo "📱 NOTIFICATION: [$TITLE] $MESSAGE"

# 通知が見えない場合の案内（初回実行時のみ）
if [ ! -f "$HOME/.codex/.notify_help_shown" ]; then
    echo ""
    echo "💡 macOS通知が表示されない場合は以下を確認してください："
    echo "   1. システム設定 > 通知 > ターミナル or terminal-notifier > 通知を許可"
    echo "   2. おやすみモード（Focus）が無効か確認"
    echo "   3. 通知センター右上のベルアイコンを確認"
    echo ""
    mkdir -p "$HOME/.codex"
    touch "$HOME/.codex/.notify_help_shown"
fi
