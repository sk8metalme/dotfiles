{ pkgs, ... }: {
  system.stateVersion = 5;
  system.primaryUser = "arigatatsuya";

  # Determinate Nix インストーラーを使用しているため nix-darwin の Nix 管理を無効化
  nix.enable = false;

  programs.zsh.enable = true;

  users.users.arigatatsuya = {
    name = "arigatatsuya";
    home = "/Users/arigatatsuya";
    shell = pkgs.zsh;
  };

  # GUI アプリはフォントは Homebrew で管理
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall"; # 宣言されていないものを削除
      upgrade = true;
    };
    taps = [];
    brews = [
      "zsh-autosuggestions"
      "zsh-syntax-highlighting"
      "nkf"
    ];
    casks = [
      "visual-studio-code"
      "iterm2"
      "hammerspoon"
      "raycast"
      "font-jetbrains-mono"
      "font-hackgen"
      "font-ricty-diminished"
    ];
  };

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
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
