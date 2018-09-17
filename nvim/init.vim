" --- vim-plug ------------------------------------------------------------ {{{
call plug#begin('$XDG_DATA_HOME/nvim/plugged')

""" Candy
Plug 'fatih/molokai'         " Color theme
Plug 'itchyny/lightline.vim' " A light and configurable statusline

""" Core tools
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'     " Split & Join lines of source code
Plug 'Raimondi/delimitMate'          " Automatic closing brackets and etc
Plug 'editorconfig/editorconfig-vim' " Portable settings for editors
Plug 'junegunn/goyo.vim'             " Distraction-free writing 
Plug 'junegunn/vim-easy-align'       " Alignment
Plug 'rhysd/vim-grammarous'          " LanguageTool grammar checker
Plug 'tpope/vim-commentary'          " `gcc` to comment out a line
Plug 'tpope/vim-eunuch'              " Vim sugar for the UNIX shell command
Plug 'tpope/vim-fugitive'            " Git integration
Plug 'tpope/vim-repeat'              " Extend '.' functionality
Plug 'tpope/vim-surround'            " Change or insert symbol around something

""" Filetype plugins
Plug 'corylanou/vim-present'            " For Go Present Tool files
Plug 'dag/vim-fish'                     " .fish
Plug 'ekalinin/Dockerfile.vim'          " Dockerfile
Plug 'elzr/vim-json'                    " .json
Plug 'fatih/vim-go'                     " .go
Plug 'lervag/vimtex'                    " .tex
Plug 'octol/vim-cpp-enhanced-highlight' " .cpp
Plug 'tmux-plugins/vim-tmux'            " .tmux.conf
Plug 'vim-ruby/vim-ruby'                " .ruby

" Markdown
Plug 'tpope/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'

call plug#end()
" ------------------------------------------------------------------------- }}}

" --- Core Settings ------------------------------------------------------- {{{
augroup vimrc
  autocmd!
augroup END

set termguicolors
colorscheme molokai

lan en_US       " UI language
set history=500 " Do you need huge history?
set number      " Numerating lines
set showcmd     " Show me what I'm typing
set noswapfile  " Don't use swapfile
set nobackup    " Don't create annoying backup files
set splitright  " Split vertical windows right to the current windows
set splitbelow  " Split horizontal windows below to the current windows
set autowrite   " Automatically save before :next, :make etc.
set noshowmatch " Don't show how many match it
set noshowmode  " We show the mode with airline or lightline
set ignorecase  " Search case insensitive...
set smartcase   " ... but not it begins with upper case
set lazyredraw  " Wait for redraw
set updatetime=400
set shortmess+=c

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10
" ------------------------------------------------------------------------- }}}

" --- Core Binds ---------------------------------------------------------- {{{
let g:mapleader = ',' " Leader key

" Editing/Sourcing config
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

""" Quickfix
" Jump to next/previous error
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" Close quickfix
" nnoremap <leader>a :cclose<CR>
" ------------------------------------------------------------------------- }}}

" --- Multilanguage Settings ---------------------------------------------- {{{
" Use vim for changing input type if you don't wanna break your motions
" and binds. For downloading dictionaries and initializing them use
" `:set spell`

set keymap=russian-jcuken    " another input language
set iminsert=0               " use english as default input type
set imsearch=-1              " same input type in search as insert mode
set spelllang=en_us,ru_yo    " spell check language types

" Better use Ctrl-l instead Ctrl-^
inoremap <C-L> <C-^>
cnoremap <C-L> <C-^>

" ------------------------------------------------------------------------- }}}

" --- Show Invisible: http://vimcasts.org/episodes/show-invisibles -------- {{{

" Characters for `Tab` and `End of Line`
set listchars=tab:▸\ ,eol:¬

" Show trailing whitespaces only in `normal mode`
augroup trailing
  autocmd!
  autocmd InsertEnter * :set listchars-=trail:⌴
  autocmd InsertLeave * :set listchars+=trail:⌴
augroup END

" Shortcut to rapidly toggle show invisible
nnoremap <leader>l :set list!<CR>

" ------------------------------------------------------------------------- }}}

" --- Python Settings ----------------------------------------------------- {{{

let g:python3_host_prog       = '/usr/local/bin/python3'
let g:python3_host_skip_check = 1 " disable Python 3 interpreter check
let g:loaded_python_provider  = 1 " disable Python 2 support
let g:python_host_skip_check  = 1 " disable Python 2 interpreter check

" ------------------------------------------------------------------------- }}}

" --- Indentation --------------------------------------------------------- {{{
" Awesome screencast about `Tabs` and `Spaces`:
" http://vimcasts.org/episodes/tabs-and-spaces
" TL;DR:
" - `tabstop` == `softtabstop` if noexpandtab (prefer tabs)
" - `softtabstop` == `shiftwidth` if expandtab (prefer spaces)
" - for simplicity just use `tabstop` == `softtabstop` == `shiftwidth` and
"   toogle `exapndtab
function! s:set_space_identation(width)
  let &expandtab   = 1
  let &tabstop     = a:width
  let &softtabstop = a:width
  let &shiftwidth  = a:width
endfunction

function! s:set_tab_identation(width)
  let &expandtab   = 0
  let &tabstop     = a:width
  let &softtabstop = a:width
  let &shiftwidth  = a:width
endfunction

function! s:set_ident_width()
  let l:tabs = ['go', 'c', 'gn', 'javascript', 'html', 'json', 'python', 'tex', 'fish', 'ruby', 'make']
  if index(l:tabs, &filetype) >= 0
    call s:set_tab_identation(2)
    return
  endif

  let l:spaces = ['vim', 'yaml', 'cpp']
  if index(l:spaces, &filetype) >= 0
    call s:set_space_identation(2)
  endif
endfunction

autocmd vimrc BufNewFile,BufRead * call s:set_ident_width()
" ------------------------------------------------------------------------- }}}

" --- Global -------------------------------------------------------------- {{{
augroup global_filetype_settings
  autocmd!

  " Put quickfix window always to the bottom
  autocmd FileType qf wincmd J
  autocmd FileType gitcommit wincmd J
augroup END
" ------------------------------------------------------------------------- }}}

" --- Go ------------------------------------------------------------------ {{{
augroup local_go_settings
  autocmd!
  autocmd FileType go setlocal
        \ formatoptions=cqjr
        \ foldmethod=syntax
        \ foldnestmax=1
augroup END
" ------------------------------------------------------------------------- }}}

" --- JavaScript ---------------------------------------------------------- {{{
augroup local_javascript_settings
  autocmd!
  autocmd FileType javascript,javascript.jsx setlocal
        \ formatprg=prettier\ --config\ ~/.config/yarn/global/package.json\ --stdin\ --no-semi\ --use-tabs\ --single-quote\ --trailing-comma\ all
augroup END
" ------------------------------------------------------------------------- }}}

" --- Markdown ------------------------------------------------------------ {{{
set textwidth=72
augroup local_markdown_settings
  autocmd!
  autocmd FileType markdown setlocal
        \ spell
        " \ textwidth=72
augroup END
" ------------------------------------------------------------------------- }}}

" --- Vim ----------------------------------------------------------------- {{{
augroup local_vim_settings
  autocmd!
  autocmd FileType vim setlocal
        \ formatoptions=jcrql
        \ foldmethod=marker
augroup END
" ------------------------------------------------------------------------- }}}

" --- Plugins ------------------------------------------------------------- {{{

" --- easy-align ---------------------------------------------------------- {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" ------------------------------------------------------------------------- }}}

" --- editorconfig-vim ---------------------------------------------------- {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" ------------------------------------------------------------------------- }}}

" --- fzf ----------------------------------------------------------------- {{{
nnoremap <c-p> :Files<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" ------------------------------------------------------------------------- }}}

" --- goyo.vim ------------------------------------------------------------ {{{
let g:goyo_width = 120
" ------------------------------------------------------------------------- }}}

" --- lightline ----------------------------------------------------------- {{{
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'fugitive', 'filename', 'modified', 'ctrlpmark' ],
      \             [ 'go'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'go'] ],
      \ },
      \ 'component_function': {
      \   'lineinfo':     'LightLineInfo',
      \   'percent':      'LightLinePercent',
      \   'modified':     'LightLineModified',
      \   'filename':     'LightLineFilename',
      \   'go':           'LightLineGo',
      \   'fileformat':   'LightLineFileformat',
      \   'filetype':     'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode':         'LightLineMode',
      \   'fugitive':     'LightLineFugitive',
      \   'ctrlpmark':    'CtrlPMark',
      \ },
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ''
  elseif &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
  return winwidth(0) > 60 ? printf('%3d:%-2d', line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
  return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGo()
  " return ''
  return exists('*go#jobcontrol#Statusline') ? go#jobcontrol#Statusline() : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  if mode() == 't'
    return ''
  endif

  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction
" ------------------------------------------------------------------------- }}}

" --- vim-go -------------------------------------------------------------- {{{
let g:go_autodetect_gopath = 1

let g:go_highlight_array_whitespace_error    = 0
let g:go_highlight_build_constraints         = 1
let g:go_highlight_extra_types               = 0
let g:go_highlight_space_tab_error           = 0
let g:go_highlight_trailing_whitespace_error = 0

let g:go_fmt_command       = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_fmt_experimental  = 1

let g:go_def_reuse_buffer = 1

" Run `:GoBuild` or `:GoTestCompile` based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup vimgo_binds
  autocmd!

  " Hmmm, I think jump to declaration in file/dir (Ctrl-P)
  autocmd FileType go nmap mf :GoDecls<cr>
  autocmd FileType go nmap md :GoDeclsDir<cr>

  autocmd FileType go nmap <leader>e <Plug>(go-rename)

  autocmd FileType go nmap <leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <leader>s <Plug>(go-def-split)

  autocmd FileType go nmap <leader>i <Plug>(go-info)
  autocmd FileType go nmap <leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  autocmd FileType go nmap <leader>d <Plug>(go-doc)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

  " :A -> :GoAlternate in current buffer
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  " :AV -> :GoAlternate in vertical split
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  " :AS -> :GoAlternate in split
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup END
" ------------------------------------------------------------------------- }}}

" --- vim-json ------------------------------------------------------------ {{{
let g:vim_json_syntax_conceal = 0
" ------------------------------------------------------------------------- }}}

" --- vim-tex ------------------------------------------------------------- {{{
let g:tex_flavor='latex'

let g:vimtex_latexmk_build_dir = './build'
let g:vimtex_latexmk_progname = 'nvr'

" settings for Skim
let g:vimtex_view_method = 'general'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
" ------------------------------------------------------------------------- }}}

" --- vim-markdown-preview ------------------------------------------------ {{{
let vim_markdown_preview_hotkey='<C-m>'
" ------------------------------------------------------------------------- }}}

" ------------------------------------------------------------------------- }}}

" vim: et sw=2
