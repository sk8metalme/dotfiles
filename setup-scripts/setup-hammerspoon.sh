#!/bin/zsh

# Hammerspoonのセットアップスクリプト
# ============================================================================

echo "🔨 Setting up Hammerspoon..."

# dotfilesディレクトリのパス
DOTFILES_DIR="${HOME}/dotfiles"
HAMMERSPOON_CONFIG_DIR="${DOTFILES_DIR}/config/hammerspoon"
HAMMERSPOON_HOME="${HOME}/.hammerspoon"

# Hammerspoonがインストールされているか確認
if ! [ -d "/Applications/Hammerspoon.app" ]; then
    echo "⚠️  Hammerspoon is not installed."
    echo "💡 Please run: brew install --cask hammerspoon"
    exit 1
fi

# ~/.hammerspoonディレクトリが存在する場合はバックアップ
if [ -d "${HAMMERSPOON_HOME}" ] || [ -L "${HAMMERSPOON_HOME}" ]; then
    echo "📦 Backing up existing Hammerspoon configuration..."
    mv "${HAMMERSPOON_HOME}" "${HAMMERSPOON_HOME}.backup.$(date +%Y%m%d_%H%M%S)"
fi

# ~/.hammerspoonディレクトリを作成
mkdir -p "${HAMMERSPOON_HOME}"

# init.luaのシンボリックリンクを作成
echo "🔗 Creating symbolic link for init.lua..."
ln -sf "${HAMMERSPOON_CONFIG_DIR}/init.lua" "${HAMMERSPOON_HOME}/init.lua"

# 確認
if [ -L "${HAMMERSPOON_HOME}/init.lua" ]; then
    echo "✅ Hammerspoon configuration has been set up successfully!"
    echo "📁 Config location: ${HAMMERSPOON_HOME}/init.lua -> ${HAMMERSPOON_CONFIG_DIR}/init.lua"
    echo ""
    echo "📝 Next steps:"
    echo "   1. Open Hammerspoon.app from Applications"
    echo "   2. Enable accessibility permissions when prompted"
    echo "   3. Hammerspoon will automatically load the configuration"
    echo ""
    echo "🎹 Default keybindings (Cmd+Alt+Ctrl + key):"
    echo "   R       : Reload configuration"
    echo "   Left    : Move window to left half"
    echo "   Right   : Move window to right half"
    echo "   Up      : Move window to top half"
    echo "   Down    : Move window to bottom half"
    echo "   F       : Maximize window"
    echo "   C       : Center window (50% size)"
    echo "   1-4     : Quarter screen positions"
    echo "   N/P     : Move to next/previous display"
    echo "   T       : Launch iTerm"
    echo "   B       : Launch Chrome"
    echo "   V       : Launch VS Code"
else
    echo "❌ Failed to create symbolic link."
    exit 1
fi

