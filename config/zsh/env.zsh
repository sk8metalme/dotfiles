# claude code memory leak resolve
export NODE_OPTIONS="--max-old-space-size=4096"

# ------------------------------------------------------------------------
# pyenv (shim 機構に必要。バイナリ自体は Nix 管理)
# ------------------------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# ------------------------------------------------------------------------
# ghq
# ------------------------------------------------------------------------
export GHQ_ROOT="$HOME/Work/git"

export PATH="$HOME/bin:$PATH"

# ------------------------------------------------------------------------
# knowledge
# ------------------------------------------------------------------------
if [ -f "$DOTFILES_DIR/config/zsh/env.local.zsh" ]; then
  source "$DOTFILES_DIR/config/zsh/env.local.zsh"
fi
