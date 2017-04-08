### general

# Clean path for preventing duplication inside tmux
set --export PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin

# XDG Spec: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set --export XDG_CONFIG_HOME ~/.config
set --export XDG_DATA_HOME ~/.local/share
set --export XDG_CACHE_HOME ~/.cache
set --export XDG_RUNTIME_DIR ~/.runtime

# user environment
set --export EDITOR nvim
set --export LOCALBIN ~/.local/bin


### tools
# neo
set --export NVIM_LOG_FILE $XDG_DATA_HOME/nvim/log/.nvimlog

# tmux
set --export TMUX_TMPDIR $XDG_RUNTIME_DIR/tmux
set --export FZF_TMUX 1
set --export FZF_DEFAULT_COMMAND 'pt --hidden --home-ptignore --ignore .git -g ""'

### langs
# go

set --export GOPATH ~/Code/go
set --export GOBIN "$GOPATH/bin"

# npm / yarn
set --export npm_config_userconfig $XDG_CONFIG_HOME/npm/config
set --export npm_config_cache $XDG_CACHE_HOME/npm

# tex
set --export TEXBIN /Library/Tex/texbin

set --export PATH $GOBIN $LOCALBIN $TEXBIN $PATH
