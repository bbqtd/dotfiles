```sh
$ curl -fLo "$XDG_DATA_HOME/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

-   <https://github.com/ctrlpvim/ctrlp.vim>
-   <https://github.com/tpope/vim-commentary>
-   <https://github.com/tpope/vim-surround>
-   <https://github.com/tpope/vim-fugitive>
-   <https://github.com/tpope/vim-repeat>
-   <https://github.com/Chiel92/vim-autoformat>

-   `ctrl-i` / `ctrl-o` - jump to next (inside) / previous (outside) location cursor.
-   `zR` - open (**remove**) all folds
-   `zM` - close (**make**) all folds

## Plugins

TODO

### lightline

TODO

### vim-easydir

TODO

### vim-easy-align

TODO

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

### vim-repeat

TODO

### vim-autoformat

TODO

### neomake

Async job runner on events (for linters, builders and etc)

### deoplete

TODO

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

### vim-markdown

TODO

### Problems

-   Need hock for updating vim linter
-   Need hock for ruby-lint
-   Need hock for updating rubocop

```shell
    $ pip install vim-vint
```

-   vint exit code 2
