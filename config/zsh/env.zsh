# ------------------------------------------------------------------------
# nodenv
# ------------------------------------------------------------------------
export NODENV_ROOT="$HOME/.nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# ------------------------------------------------------------------------
# pyenv
# ------------------------------------------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
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
# java 
# ------------------------------------------------------------------------
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"

