function tmux --description 'Terminal multiplexer'
	command tmux -2 -f $XDG_CONFIG_HOME/tmux/tmux.conf $argv
end
