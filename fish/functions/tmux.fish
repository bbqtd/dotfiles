function tmux --description 'Terminal multiplexer'
	command tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf $argv
end
