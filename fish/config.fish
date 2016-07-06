# XDG Spec: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set --export XDG_CONFIG_HOME ~/.config
set --export XDG_DATA_HOME ~/.share
set --export XDG_CACHE_HOME ~/.cache
set --export XDG_RUNTIME_DIR ~/.runtime

# user environment
set --export EDITOR nvim
set --export WORKSPACE_HOME ~/Workspace

### tools
# neo
set --export NVIM_LOG_FILE $XDG_DATA_HOME/nvim/log/.nvimlog

# tmux
set --export TMUX_TMPDIR $XDG_RUNTIME_DIR/tmux

### langs
# go
set --export GOPATH $WORKSPACE_HOME/go
set --export PATH $GOPATH/bin $PATH

# npm
set --export npm_config_userconfig $XDG_CONFIG_HOME/npm/config
set --export npm_config_cache $XDG_CACHE_HOME/npm
