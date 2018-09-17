```sh
$ curl -fLo "$XDG_DATA_HOME/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

-   `ctrl-i` / `ctrl-o` - jump to next (inside) / previous (outside) location cursor.

### Folding

-   `za` - open/close (**alternate**) a fold
-   `zR` - open (**remove**) all folds
-   `zM` - close (**make**) all folds

## Plugins

### vim-commentary

-   `gcc` - comment line

### vim-surround

-   `ds{target}` - **d**elete **s**urroundings
-   `cs{target}{replacement}` - **c**hange **s**urroundings `{target}` on
      `{replacement}`
-   `ys{motion}{target}` - **y**ou **s**urround `{motion}` with `{target}`
-   `yss{target}` - **y**ou **s**urround line with `{target}`
-   `yS`
-   `ySS`

### vim-go

-   <https://github.com/fatih/vim-go-tutorial>
-   `:GoDecls` & `:GoDeclsDir`
-   `]]` -> jump to next function
-   `[[` -> jump to previous function
-   `:GoDef`, `ctrl-]` or `gd` to jump to a definition
-   `:GoDefPop`, `ctrl-t` to jump back to the previous location
-   `:GoAlternate` - jump between source and test file in current buffer.
    Aliases:
    -   `:A` - 
    -   `:AV` -
    -   `:AS` -

### vim-tmux

`K` - use `man tmux` for a command under cursor
