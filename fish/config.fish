### general
# drop all inheritance and set initial state of $PATH
set --export PATH /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin

# XDG Spec: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set --export XDG_CONFIG_HOME ~/.config
set --export XDG_DATA_HOME ~/.local/share
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
set --export FZF_TMUX 1

### langs
# go

# because I use symlink for go workspace me need resolve it otherwise some tools
# like gorename would be broken
set --export GOPATH (realpath $WORKSPACE_HOME/go) 
set --export PATH $GOPATH/bin $PATH

# npm
set --export npm_config_userconfig $XDG_CONFIG_HOME/npm/config
set --export npm_config_cache $XDG_CACHE_HOME/npm
