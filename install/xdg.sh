#!/usr/bin/env bash

DOTFILES="$HOME/.dotfiles"

source "$DOTFILES/shell/xdg_env"

if [ ! -d "$XDG_CONFIG_HOME" ]; then
	mkdir "$XDG_CONFIG_HOME"
fi

if [ ! -d "$XDG_DATA_HOME" ]; then
	mkdir "$XDG_DATA_HOME"
fi

if [ ! -d "$XDG_CACHE_HOME" ]; then
	mkdir "$XDG_CACHE_HOME"
fi

if [ ! -d "$XDG_RUNTIME_DIR" ]; then
	mkdir "$XDG_RUNTIME_DIR"
fi
