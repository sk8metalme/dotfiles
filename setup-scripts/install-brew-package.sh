#!/bin/zsh

# Homebrewのインストール
if ! command -v brew &> /dev/null; then
    echo "💪 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
     echo "👋 Homebrew is already installed."
fi

# Homebrewのアップデート
echo "💪 Updating Homebrew..."
brew update

# パッケージのインストール
echo "💪 Installing packages..."
brew install jq       # JSON処理ツール
brew install fzf       
brew install bat       
brew install node      
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install nkf
brew install tree
brew install git-lfs
brew install ghq        # Gitリポジトリ管理ツール
brew install pyenv
brew install openjdk@21
brew install terminal-notifier
# brew install --cask kap
# brew install --cask ghostty
brew install --cask raycast

git lfs install

# プログラミングフォントのインストール
echo "💪 Installing programming fonts..."
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono
brew install --cask font-hackgen
brew install --cask font-ricty-diminished

# 完了メッセージ
echo "🤛 Application installation complete!"
