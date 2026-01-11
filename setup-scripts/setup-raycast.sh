#!/bin/zsh

DOTFILES_DIR=~/dotfiles
RAYCAST_CONFIG_FILE="$DOTFILES_DIR/config/raycast/settings.rayconfig"

echo "🚀 Setting up Raycast configuration..."
echo ""

# Raycastがインストールされているか確認
if ! [ -d "/Applications/Raycast.app" ]; then
    echo "⚠️  Raycast is not installed."
    echo "   Please install Raycast first: https://www.raycast.com/"
    echo ""
    exit 1
fi

echo "✅ Raycast is installed"

# 設定ファイルの存在確認
if [ ! -f "$RAYCAST_CONFIG_FILE" ]; then
    echo ""
    echo "⚠️  Configuration file not found: $RAYCAST_CONFIG_FILE"
    echo ""
    echo "📝 To export your current Raycast settings:"
    echo "   1. Open Raycast Settings (⌘,)"
    echo "   2. Go to 'Advanced' tab"
    echo "   3. Click 'Export Configuration'"
    echo "   4. Save as: $RAYCAST_CONFIG_FILE"
    echo ""
    exit 1
fi

echo "✅ Configuration file found: $RAYCAST_CONFIG_FILE"
echo ""

# インポート方法を案内
echo "📋 To import Raycast configuration:"
echo ""
echo "   Option 1: Manual Import (Recommended)"
echo "   ----------------------------------------"
echo "   1. Open Raycast Settings (⌘,)"
echo "   2. Go to 'Advanced' tab"
echo "   3. Click 'Import Configuration'"
echo "   4. Select: $RAYCAST_CONFIG_FILE"
echo "   5. Confirm the import"
echo ""

# Raycast CLIが利用可能な場合の自動インポート（将来の拡張用）
# 現在のRaycastにはCLIでの設定インポート機能がないため、コメントアウト
# if command -v raycast &> /dev/null; then
#     echo "   Option 2: Automatic Import via CLI"
#     echo "   -----------------------------------"
#     read -q "REPLY?   Do you want to import automatically? (y/n) "
#     echo ""
#     if [[ $REPLY =~ ^[Yy]$ ]]; then
#         raycast import "$RAYCAST_CONFIG_FILE"
#         echo "✅ Configuration imported successfully!"
#     fi
# fi

echo "💡 Tips:"
echo "   - After making changes in Raycast, re-export your configuration"
echo "   - Export to: $RAYCAST_CONFIG_FILE"
echo "   - Commit the updated file to Git to keep your settings in sync"
echo ""

echo "🎉 Raycast setup guide complete!"
echo ""
echo "⚠️  Note: You need to manually import the configuration file in Raycast Settings."
echo ""
