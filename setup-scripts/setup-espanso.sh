#!/bin/zsh

DOTFILES_DIR=~/dotfiles
ESPANSO_CONFIG_DIR=~/.config/espanso

# バックアップディレクトリ（タイムスタンプ付き）
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR=~/.config/espanso.backup.$TIMESTAMP

echo "🚀 Setting up Espanso configuration..."

# Espanso設定ディレクトリが存在する場合はバックアップ
if [ -d "$ESPANSO_CONFIG_DIR" ]; then
    echo "📦 Backing up existing Espanso config to $BACKUP_DIR"
    cp -r "$ESPANSO_CONFIG_DIR" "$BACKUP_DIR"
fi

# Espanso設定ディレクトリを作成
mkdir -p "$ESPANSO_CONFIG_DIR/config"
mkdir -p "$ESPANSO_CONFIG_DIR/match"

# シンボリックリンクを作成する関数
create_symlink() {
    source="$1"
    destination="$2"

    # 既存のファイル/シンボリックリンクを削除
    if [ -e "$destination" ] || [ -L "$destination" ]; then
        echo "🗑️  Removing existing: $destination"
        rm -f "$destination"
    fi

    # シンボリックリンクを作成
    ln -s "$source" "$destination"
    echo "✅ Created symlink: $destination -> $source"
}

# config/default.yml のシンボリックリンク作成
echo ""
echo "📝 Setting up config files..."
create_symlink "$DOTFILES_DIR/config/espanso/config/default.yml" "$ESPANSO_CONFIG_DIR/config/default.yml"

# match/*.yml のシンボリックリンク作成
echo ""
echo "📝 Setting up match files..."
for match_file in "$DOTFILES_DIR/config/espanso/match"/*.yml; do
    if [ -f "$match_file" ]; then
        filename=$(basename "$match_file")
        create_symlink "$match_file" "$ESPANSO_CONFIG_DIR/match/$filename"
    fi
done

# Espansoを再起動
echo ""
echo "🔄 Restarting Espanso..."
if command -v espanso &> /dev/null; then
    espanso restart
    echo "✅ Espanso restarted successfully!"
else
    echo "⚠️  Espanso command not found. Please install Espanso first."
    echo "   Install with: brew install espanso"
fi

# 完了メッセージ
echo ""
echo "🎉 Espanso setup complete!"
echo "📁 Backup location: $BACKUP_DIR"
echo ""
echo "💡 Tips:"
echo "   - Edit files in $DOTFILES_DIR/config/espanso/"
echo "   - Changes will automatically reflect in Espanso"
echo "   - Run 'espanso restart' after major changes"

