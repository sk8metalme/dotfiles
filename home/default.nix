{ config, pkgs, ... }: {
  home.username = "arigatatsuya";
  home.homeDirectory = "/Users/arigatatsuya";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  # Nix で管理する CLI ツール
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
  ];

  # dotfiles を直接参照するシムリンク（nix store 経由しない）
  home.file = {
    ".zshrc".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.zshrc";
    ".zshenv".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.zshenv";
    ".gitconfig".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/.gitconfig";
    ".hammerspoon/init.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/hammerspoon/init.lua";
  };
}
