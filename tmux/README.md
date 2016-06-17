## General

-   `ctrl-f` - is `prefix`.
-   `prefix r` - source config.
-   `prefix g` - list of session. Prompts for session name and switches to it. Performs 'kind-of' name completion. 

### moving

-   `prefix 1`, `prefix 2`, ... - switch to 1, 2, ... window
-   `prefix ctrl-f` - switch to last visited window.
-   `prefix F` - switches to the last session.
-   `prefix ctrl-p` switch to **p**revious window in list
-   `prefix ctrl-n` switch to **n**ext window in list
-   `prefix h` or `prefix ctrl-h` - switch to left pane
-   `prefix j` or `prefix ctrl-j` - switch to bottom pane
-   `prefix k` or `prefix ctrl-k` - switch to upper pane
-   `prefix l` or `prefix ctrl-l` - switch to right pane

**Hint:** For example, you want visit last window and then return to back.  Hold `ctrl` then `f` two times and `f` another two times.

**Hint:** For example, you want look some available windows. Hold `ctrl` then `f + n` or `f + p` dependent on direction.

**Hint:** Same effect for switching between panes.

### manipulating

#### session

-   `prefix C` - prompt for creating a new session by name.
-   `prefix X` - kill current session without detaching tmux.
-   `prefix @` - promote current pane into a new session.

#### window

-   `prefix c` - **c**reate window
-   `prefix - <` - moves current window one position to the left (repeatable)
-   `prefix - >` - moves current window one position to the right (repeatable)

#### pane

-   `prefix v` - vertical split.
-   `prefix s` - horizontal split.
-   `prefix !` - promote current pane into a new window.
-   `prefix x` - kill pane (or window if it's last pane).

### resizing

-   `prefix =` - equal resize
-   `prefix |` - equal resize
-   `prefix H` - left to 5px (repeatable)
-   `prefix J` - down to 5px (repeatable)
-   `prefix K` - up to 5px (repeatable)
-   `prefix L` - left to 5px (repeatable)

**Hint:** hotkeys for resizing is _repeatable_. So, you can after `prefix` hold shift and use `H`, `J`, `K`, `L` for manipulating size of pane in one time. 

## Saving sessions (tmux-resurect)

-   `prefix ctrl-s` - save
-   `prefix ctrl-r` - restore

## Searching (copycat plugin)

-   `prefix /` - regex search (case insensitive)

### search mode

-   `n` / `N` - jump to next / previous match.
-   `Enter` / `y` - copy match.

### predefined

-   `prefix ctrl-t` - file search
-   `prefix ctrl-g` - jumping over git status files (best used after git status command)
-   `prefix alt-h` - jumping over SHA-1 hashes (best used after git log command)
-   `prefix ctrl-u` - url search (http, ftp and git urls)
-   `prefix ctrl-d` - number search
-   `prefix ctrl-i` - ip address search

## Open

in `copy mode` or `copycat`.

-   `o` - open highlighted with system default program.
-   `ctrl-o` - open a highlighted selection with the `$EDITOR`

## TPM

-   `prefix I` - install plugins
-   `prefix U` - update plugins
-   `prefix alt-u` - uninstall plugins

## Links

-   <https://github.com/tmux-plugins/tpm>
-   <https://github.com/tmux-plugins/tmux-sensible>
-   <https://github.com/tmux-plugins/tmux-sessionist>
-   <https://github.com/tmux-plugins/tmux-copycat>
-   <https://github.com/tmux-plugins/tmux-open>
-   <https://github.com/tmux-plugins/tmux-resurrect>
