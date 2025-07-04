# Oh My Zsh の設定
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# プラグイン設定
plugins=(
  git
  web-search
)
source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions
if [ -f "$(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# zsh-syntax-highlighting
if [ -f "$(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi


# シェルの終了時のクリーンアップ
autoload -Uz compinit && compinit
