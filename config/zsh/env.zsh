# claude code memory leak resolve
export NODE_OPTIONS="--max-old-space-size=4096"

# ------------------------------------------------------------------------
# pyenv (shim 機構に必要。バイナリ自体は Nix 管理)
# ------------------------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# ------------------------------------------------------------------------
# phpenv
# ------------------------------------------------------------------------
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"
export PATH="/opt/homebrew/Cellar/libpng/1.6.50/bin:$PATH"
export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"

# ------------------------------------------------------------------------
# ghq
# ------------------------------------------------------------------------
export GHQ_ROOT="$HOME/Work/git"

export PATH="$HOME/bin:$PATH"

# ------------------------------------------------------------------------
# knowledge
# ------------------------------------------------------------------------
export KNOWLEDGE_REPO_PATH="$HOME/Work/git/github.com/sk8metalme/worklog"
export KNOWLEDGE_REPO_URL="https://github.com/sk8metalme/worklog"
