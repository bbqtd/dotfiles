# Config

## List

-   fish
-   fisherman
-   git
-   golang
-   neovim
-   newbeauter
-   npm
-   tmux

## Usage

Depended on your choice you need to:

-   Clone repo into `~/.config` or another `$XDG_CONFIG_HOME` path.
-   Clone repo into a folder then link it with `~/.config` or another `$XDG_CONFIG_HOME` path.

At this moment, I store repo into dropbox folder and link it to `~/.config`.

## Configuration

In your shell configuration file you have to provide information about:

-   `$XDG_CONFIG_HOME` by default is `~/.config`
-   `$XDG_DATA_HOME` by default is `~/.local/share` 
-   `$XDG_CACHE_HOME` by default is `~/.cache`
-   `$XDG_RUNTIME_DIR` by default is `~/.runtime`

Nowdays, I use `fish`. All default and other important variables you could
change in `fish/config.fish` file.
