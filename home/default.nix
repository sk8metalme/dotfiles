{ config, pkgs, username, ... }: {
  home.username = username;
  home.homeDirectory = "/Users/${username}";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    jq
    fzf
    bat
    tree
    git-lfs
    ghq
    terminal-notifier
    uv
    gh
    fd
    ripgrep
    zoxide
    wget
    coreutils
    gnupg
    nkf
    go
    gradle
    imagemagick
    ffmpeg
    ollama
    docker-client
    docker-compose
    php
    pipenv
    jujutsu
    lazyjj
    bun
    rustup
    jdk21
    nodejs_22
    pyenv
  ];

  programs.zsh = {
    enable = true;
    dotDir = config.home.homeDirectory;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "web-search" ];
    };

    envExtra = ''
      export DOTFILES_DIR=~/dotfiles

      # Prefer Nix-managed tools in every zsh, including non-interactive shells.
      __prepend_path_if_dir() {
        [ -d "$1" ] && export PATH="$1:$PATH"
      }
      __append_path_if_dir() {
        [ -d "$1" ] && export PATH="$PATH:$1"
      }

      __prepend_path_if_dir "/nix/var/nix/profiles/default/bin"
      __prepend_path_if_dir "/run/current-system/sw/bin"
      __prepend_path_if_dir "$HOME/.nix-profile/bin"
      __prepend_path_if_dir "/etc/profiles/per-user/$USER/bin"

      # Cargo rustup proxy should stay ahead of Nix Rust toolchains.
      __prepend_path_if_dir "$HOME/.cargo/bin"

      # Homebrew is kept as a GUI/cask and migration fallback path.
      __append_path_if_dir "/opt/homebrew/bin"
      __append_path_if_dir "/usr/local/bin"

      unset -f __prepend_path_if_dir __append_path_if_dir
    '';

    initContent = ''
      if [[ -n "$npm_config_yes" ]] || [[ -n "$CI" ]] || [[ "$-" != *i* ]]; then
        export AGENT_MODE=true
      else
        export AGENT_MODE=false
      fi

      if [[ "$AGENT_MODE" != "true" ]]; then
        source $DOTFILES_DIR/config/zsh/alias.zsh
        source $DOTFILES_DIR/config/zsh/bindkey.zsh
        source $DOTFILES_DIR/config/zsh/completion.zsh
        source $DOTFILES_DIR/config/zsh/env.zsh
        source $DOTFILES_DIR/config/zsh/functions.zsh
        source $DOTFILES_DIR/config/zsh/wordstyle.zsh

        test -e "''${HOME}/.iterm2_shell_integration.zsh" && source "''${HOME}/.iterm2_shell_integration.zsh"

        # Google Cloud SDK
        if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then
          . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"
        fi
        if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then
          . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"
        fi

        [ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

        [[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
      fi

      # LM Studio
      export PATH="$PATH:$HOME/.lmstudio/bin"

      # Antigravity
      export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

      # Prefer Nix-managed toolchains over legacy Homebrew/manual installs.
      __prefer_nix_paths() {
        local -a preferred_paths existing_preferred_paths remaining_paths
        local -A preferred_path_set
        preferred_paths=(
          "$HOME/.cargo/bin"
          "/etc/profiles/per-user/$USER/bin"
          "$HOME/.nix-profile/bin"
          "/run/current-system/sw/bin"
          "/nix/var/nix/profiles/default/bin"
        )

        local dir
        for dir in "''${preferred_paths[@]}"; do
          if [[ -d "$dir" ]]; then
            existing_preferred_paths+=("$dir")
            preferred_path_set[$dir]=1
          fi
        done

        typeset -gU path PATH
        for dir in "''${path[@]}"; do
          [[ -z "''${preferred_path_set[$dir]}" ]] && remaining_paths+=("$dir")
        done
        path=("''${existing_preferred_paths[@]}" "''${remaining_paths[@]}")
      }
      __prefer_nix_paths
      rehash
      unfunction __prefer_nix_paths
    '';
  };

  home.file = {
    ".gitconfig".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.gitconfig";
    ".hammerspoon/init.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/hammerspoon/init.lua";
    "Library/Application Support/Code/User/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/vscode/settings.json";
    "Library/Application Support/Code/User/keybindings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/vscode/keybindings.json";
    "Library/Application Support/iTerm2/DynamicProfiles/Default.json".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/iTerm2/Default.json";
    ".config/zed/settings.json" = {
      source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/zed/settings.json";
      force = true;
    };
  };
}
