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