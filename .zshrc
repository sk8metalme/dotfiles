# ※※※読み込む順番に注意※※※
# oh-my-zshのキーバインドが上書きにならないように先にoh-my-zsh読み込む必要あり。
if [[ -n "$npm_config_yes" ]] || [[ -n "$CI" ]] || [[ "$-" != *i* ]]; then
export AGENT_MODE=true
else
export AGENT_MODE=false
fi

if [[ "$AGENT_MODE" != "true" ]]; then

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
  if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi
  
  # The next line enables shell command completion for gcloud.
  if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi
  
  . "$HOME/.local/bin/env"
  
  [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
