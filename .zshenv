# dotfiles path
export DOTFILES_DIR=~/dotfiles

# history
export HISTSIZE=10000
export SAVEHIST=10000

# Nix-managed tools should win over legacy Homebrew/manual installs.
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

# Keep rustup proxy first.
__prepend_path_if_dir "$HOME/.cargo/bin"

# Homebrew remains available for GUI casks and migration fallback.
__append_path_if_dir "/opt/homebrew/bin"
__append_path_if_dir "/usr/local/bin"

unset -f __prepend_path_if_dir __append_path_if_dir
