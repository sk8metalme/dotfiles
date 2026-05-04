{ lib, pkgs, username, ... }: {
  system.stateVersion = 5;
  system.primaryUser = username;

  # Determinate Nix インストーラーを使用しているため nix-darwin の Nix 管理を無効化
  nix.enable = false;

  programs.zsh.enable = true;

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
    shell = pkgs.zsh;
  };

  # GUI apps, fonts, and binary casks remain declarative via nix-darwin Homebrew.
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # Keep existing Homebrew packages while migration to Nix is in progress.
      cleanup = "none";
      upgrade = true;
      # Adopt existing manually-installed .app bundles into cask management.
      extraFlags = [ "--force" ];
    };
    taps = [
      "deskflow/tap"
    ];
    brews = [];
    casks = [
      # Security / productivity
      "1password"
      "1password-cli"
      "alfred"
      "clipy"
      "cmd-eikana"
      "raycast"
      "scroll-reverser"
      "shortcutdetective"
      "stats"

      # Browsers / communication
      "claude"
      "google-chrome"
      "zoom"

      # Development / terminal
      "cmux"
      "codex-app"
      "dash"
      "docker-desktop"
      "iterm2"
      "visual-studio-code"
      "zed"

      # System utilities / input devices
      "google-drive"
      "google-japanese-ime"
      "hammerspoon"
      "logi-options+"

      # Media / AI / creative
      "font-hackgen"
      "font-jetbrains-mono"
      "font-ricty-diminished"
      "font-symbols-only-nerd-font"
      "lm-studio"
      "obsidian"
      "superwhisper"
    ];
    masApps = {
      "Amazon Kindle" = 302584613;
      "Be Focused" = 973134470;
      "LINE" = 539883307;
      "Magnet" = 441258766;
      "Xcode" = 497799835;
    };
    vscode = lib.filter (extension: extension != "") (
      lib.splitString "\n" (builtins.readFile ../config/vscode/extensions)
    );
  };

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      show-recents = false;
      tilesize = 70;
    };
    screencapture = {
      location = "~/Desktop/Screenshot";
    };
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };
    NSGlobalDomain = {
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
    };
  };
}
