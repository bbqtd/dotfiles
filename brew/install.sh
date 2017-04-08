#!/usr/bin/env bash

# Install brew if not installed

if test ! "$( which brew )"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
fi

brew tap \
	caskroom/cask \
	neovim/neovim

brew update

brew install \
	fish \
	git \
	tmux \
	neovim

brew install \
	python \
	python3 \
	go \
	node yarn

# Quick Look Plugins
# https://github.com/sindresorhus/quick-look-plugins
brew cask install \
	qlcolorcode \
	qlstephen \
	qlmarkdown \
	quicklook-json \
	qlprettypatch \
	quicklook-csv \
	betterzipql \
	qlimagesize \
	webpquicklook \
	suspicious-package

# todolist 
# http://todolist.site/
# https://github.com/gammons/todolist
brew install todolist

# Turbo Boost disabler / enable app for Mac OS X
# https://github.com/rugarciap/Turbo-Boost-Switcher
brew cask install turbo-boost-switcher
