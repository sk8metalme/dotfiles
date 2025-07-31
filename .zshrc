# ※※※読み込む順番に注意※※※
# oh-my-zshのキーバインドが上書きにならないように先にoh-my-zsh読み込む必要あり。
# 
# ------------------------------------------------------------------------
# oh-my-zsh
# ------------------------------------------------------------------------
source $DOTFILES_DIR/config/zsh/oh-my-zsh.zsh

# ------------------------------------------------------------------------
# alias
# ------------------------------------------------------------------------
source $DOTFILES_DIR/config/zsh/alias.zsh

# ------------------------------------------------------------------------
# bindkey
# ------------------------------------------------------------------------
source $DOTFILES_DIR/config/zsh/bindkey.zsh

# ------------------------------------------------------------------------
# completion
# ------------------------------------------------------------------------
source $DOTFILES_DIR/config/zsh/completion.zsh

# ------------------------------------------------------------------------
# env
# ------------------------------------------------------------------------
source $DOTFILES_DIR/config/zsh/env.zsh

# ------------------------------------------------------------------------
# functions
# ------------------------------------------------------------------------
source $DOTFILES_DIR/config/zsh/functions.zsh

# ------------------------------------------------------------------------
# wordstyle
# ------------------------------------------------------------------------
source $DOTFILES_DIR/config/zsh/wordstyle.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/arigatatsuya/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/arigatatsuya/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/arigatatsuya/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/arigatatsuya/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

. "$HOME/.local/bin/env"
