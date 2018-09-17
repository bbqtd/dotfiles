set --export LANG   'en_US.UTF-8'
set --export EDITOR nvim


# XDG Spec: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set --export XDG_CACHE_HOME  "$HOME/.cache"
set --export XDG_CONFIG_HOME "$HOME/.config"
set --export XDG_DATA_HOME   "$HOME/.local/share"
set --export XDG_RUNTIME_DIR "$HOME/.runtime"
mkdir -p "$XDG_CACHE_HOME" "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_RUNTIME_DIR"

# if not test -d "$XDG_CACHE_HOME"
# 	mkdir -p "$XDG_CACHE_HOME"
# end

# set --export XDG_CONFIG_HOME "$HOME/.config"
# if not test -d "$XDG_CONFIG_HOME"
# 	mkdir -p "$XDG_CONFIG_HOME"
# end

# set --export XDG_DATA_HOME "$HOME/.local/share"
# if not test -d "$XDG_DATA_HOME"
# 	mkdir -p "$XDG_DATA_HOME"
# end

# set --export XDG_RUNTIME_DIR "$HOME/.runtime"
# if not test -d "$XDG_RUNTIME_DIR"
# 	mkdir -p "$XDG_RUNTIME_DIR"
# end

set --export LOCAL_HOME "$HOME/.local"

set --export CARGO_HOME  "$LOCAL_HOME/cargo"
set --export GNUPGHOME   "$LOCAL_HOME/gnupg"
set --export GOPATH      "$LOCAL_HOME/go"
set --export RUSTUP_HOME "$LOCAL_HOME/rustup"

set --export TMUX_TMPDIR "$XDG_RUNTIME_DIR/tmux"
mkdir -p "$TMUX_TMPDIR"

set --export HOMEBREW_CACHE "$XDG_CACHE_HOME/brew"
set --export HOMEBREW_LOGS  "$XDG_DATA_HOME/brew/logs"
set --export HOMEBREW_TEMP  "$XDG_DATA_HOME/brew/temp"
set --export HOMEBREW_FORCE_BREWED_GIT 1
set --export HOMEBREW_NO_ANALYTICS     1
set --export HOMEBREW_NO_GITHUB_API    1

# TODO: test exist
# ln -s ~/.config/gnupg/gpg-agent.conf ~/.local/gnupg/gpg-agent.conf

set --export fish_user_paths "$GOPATH/bin" "$CARGO_HOME/bin" /usr/local/sbin
