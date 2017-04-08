" --- vim-plug ------------------------------------------------------------ {{{
call plug#begin('$XDG_DATA_HOME/nvim/plugged')
""" Candy
Plug 'tomasr/molokai'        " Color theme
Plug 'itchyny/lightline.vim' " A light and configurable statusline
Plug 'junegunn/goyo.vim'     " Distraction-free writing in Vim

""" Core tools
Plug 'editorconfig/editorconfig-vim' " Format settings for editors
Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf' } | Plug 'junegunn/fzf.vim'
Plug 'neomake/neomake'       " Async job runner & linter framework
Plug 'sbdchd/neoformat', { 'for': [ 'javascript', 'markdown' ] }
Plug 'tpope/vim-commentary'  " Comment everything like a boss
Plug 'tpope/vim-eunuch'      " Vim sugar for the UNIX shell command
Plug 'tpope/vim-fugitive'    " Git integration
Plug 'tpope/vim-obsession'   " Create and continuously update session file
Plug 'tpope/vim-repeat'      " Extend '.' functionality
Plug 'tpope/vim-surround'    " Change or insert symbol around something
Plug 'Raimondi/delimitMate'  " Automatic closing brackets and etc
Plug 'vimwiki/vimwiki'

""" Autocomplete System & Drivers
Plug 'Shougo/deoplete.nvim',     { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'for': [ 'javascript' ], 'do': 'yarn global add tern' }
Plug 'zchee/deoplete-go',        { 'for': 'go', 'do': 'make' }


""" Filetype plugins
Plug 'kylef/apiblueprint.vim'
Plug 'docker/docker',                 { 'for': 'Dockerfile', 'rtp': '/contrib/syntax/vim/'}
Plug 'ferreum/vim-fish',              { 'for': 'fish' }
Plug 'fatih/vim-go',                  { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'ctrlpvim/ctrlp.vim',            { 'for': 'go' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'lervag/vimtex',                 { 'for': [ 'tex', 'latex' ] }
Plug 'pangloss/vim-javascript',       { 'for': [ 'javascript' ] }
Plug 'MaxMEllon/vim-jsx-pretty',      { 'for': [ 'javascript' ] }
" Plug 'ruanyl/vim-fixmyjs',            { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'othree/yajs',                   { 'for': [ 'javascript', 'jsx', 'javascript.jsx' ] }
" Plug 'othree/es.next.syntax.vim',     { 'for': [ 'javascript', 'jsx', 'javascript.jsx' ] }
" Plug 'othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'javascript.jsx' ] }
" Plug 'mxw/vim-jsx',                   { 'for': [ 'javascript', 'jsx', 'javascript.jsx' ] }
Plug 'elzr/vim-json',                 { 'for': 'json' }
Plug 'tpope/vim-markdown',            { 'for': 'markdown' }
Plug 'nelstrom/vim-markdown-folding', { 'for': [ 'markdown', 'apiblueprint' ] }
Plug 'vim-ruby/vim-ruby',             { 'for': 'ruby' }
Plug 'lervag/vimtex',                 { 'for': [ 'tex', 'plaintex' ] }
Plug 'tmux-plugins/vim-tmux',         { 'for': 'tmux' }
Plug 'chase/vim-ansible-yaml',        { 'for': [ 'yaml', 'ansible' ] }
call plug#end()
" ------------------------------------------------------------------------- }}}

" --- General Settings ---------------------------------------------------- {{{
colorscheme molokai
set termguicolors

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
set completeopt=menu,menuone
set updatetime=400
set shortmess+=c

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" --- Multilanguage Settings ---------------------------------------------- {{{
" One note: ctrl-^ same as ctrl-6 combo!!!
" For changing between input type use ctrl-6, don't use your system input
" otherwise your binds and motion would be broken.
set keymap=russian-jcuken    " another input language
set iminsert=0               " use english as default input type
set imsearch=-1              " same input type in search as insert mode

" Better use Ctrl-l instead Ctrl-^
inoremap <C-L> <C-^>
cnoremap <C-L> <C-^>

" For downloading dictionary and initializing it use `:set spell`
set spelllang=en_us,ru_yo    " spell check languages
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

" --- Key Mappings -------------------------------------------------------- {{{
let g:mapleader = ',' " Leader key

" Editing/Sourcing config
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Easy navigation between splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

""" Quickfix
" Jump to next/previous error
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" Close quickfix
" nnoremap <leader>a :cclose<CR>
" ------------------------------------------------------------------------- }}}

" --- Python Settings ----------------------------------------------------- {{{
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider  = 1 " disable Python 2 support
let g:python_host_skip_check  = 1 " disable the Python 2 interpreter check
let g:python3_host_skip_check = 1 " disable the Python 3 interpreter check
" ------------------------------------------------------------------------- }}}

" ------------------------------------------------------------------------- }}}

" --- FileType Settings --------------------------------------------------- {{{
" Awesome screencast about `Tabs` and `Spaces`:
" http://vimcasts.org/episodes/tabs-and-spaces
" TL;DR:
" - `tabstop` == `softtabstop` if noexpandtab (prefer tabs)
" - `softtabstop` == `shiftwidth` if expandtab (prefer spaces)
" - for simplicity just use `tabstop` == `softtabstop` == `shiftwidth` and
"   toogle `exapndtab

augroup ftstyles_grp
  autocmd! 
  autocmd BufNewFile,BufRead *.apib set filetype=markdown.apiblueprint

  autocmd FileType markdown,apiblueprint setlocal
        \ expandtab
        \ tabstop=4
        \ softtabstop=4
        \ shiftwidth=4
  " autocmd FileType apiblueprint runtime! 'ftplugin/markdown/folding.vim'
augroup END

" --- Fish ---------------------------------------------------------------- {{{
augroup local_fish_settings
  autocmd!
  autocmd FileType fish setlocal
        \ noexpandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
augroup END
" ------------------------------------------------------------------------- }}}

" --- Global -------------------------------------------------------------- {{{
augroup global_filetype_settings
  autocmd!
  autocmd BufNewFile,BufRead .esformatter set filetype=json

  " Put quickfix window always to the bottom
  autocmd FileType qf wincmd J
  autocmd FileType gitcommit wincmd J
augroup END
" ------------------------------------------------------------------------- }}}

" --- Go ------------------------------------------------------------------ {{{
augroup local_go_settings
  autocmd!
  autocmd FileType go setlocal
        \ noexpandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
        \ formatoptions=cqjr
        \ foldmethod=syntax
        \ foldnestmax=1
augroup END
" ------------------------------------------------------------------------- }}}

" --- JavaScript ---------------------------------------------------------- {{{
augroup local_javascript_settings
  autocmd!
  autocmd FileType javascript,javascript.jsx setlocal
        \ expandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
        \ formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ all
        " \ formatoptions-=o
  " autocmd FileType javascript.jsx setlocal
  "       \ noexpandtab
  "       \ tabstop=2
  "       \ softtabstop=2
  "       \ shiftwidth=2
  "       \ formatoptions-=o
  " autocmd BufWritePre *.js :Fixmyjs
  " autocmd BufWritePre *.jsx :Fixmyjs
  autocmd BufWritePre *.md,*.js Neoformat
augroup END
" ------------------------------------------------------------------------- }}}

" --- JSON ---------------------------------------------------------------- {{{
augroup local_json_settings
  autocmd!
  autocmd FileType json setlocal
        \ expandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
augroup END
" ------------------------------------------------------------------------- }}}

" --- HTML ---------------------------------------------------------------- {{{
augroup local_html_settings
  autocmd!
  autocmd FileType html setlocal
        \ expandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
augroup END
" ------------------------------------------------------------------------- }}}

" --- Makefile ------------------------------------------------------------ {{{
augroup local_make_settings
  autocmd!
  autocmd FileType make setlocal
        \ noexpandtab
        \ tabstop=8
        \ softtabstop=8
        \ shiftwidth=8
augroup END
" ------------------------------------------------------------------------- }}}

" --- Markdown ------------------------------------------------------------ {{{
augroup local_markdown_settings
  autocmd!
  autocmd FileType markdown setlocal
        \ spell
        \ textwidth=80
augroup END
" ------------------------------------------------------------------------- }}}

" --- Matlab ------------------------------------------------------------- {{{
augroup local_matlab_settings
  autocmd!
  autocmd FileType matlab setlocal
        \ expandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
        \ formatoptions-=o
augroup END
" ------------------------------------------------------------------------- }}}

" --- Python ---------------------------------------------------------------- {{{
augroup local_python_settings
  autocmd!
  autocmd FileType python setlocal
        \ noexpandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
augroup END
" ------------------------------------------------------------------------- }}}

" --- Ruby ---------------------------------------------------------------- {{{
augroup local_ruby_settings
  autocmd!
  autocmd FileType ruby setlocal
        \ expandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
augroup END
" ------------------------------------------------------------------------- }}}

" --- TeX ----------------------------------------------------------------- {{{
augroup local_tex_settings
  autocmd!
  autocmd FileType tex setlocal
        \ noexpandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
        \ textwidth=90
augroup END
" ------------------------------------------------------------------------- }}}

" --- Vim ----------------------------------------------------------------- {{{
augroup local_vim_settings
  autocmd!
  autocmd FileType vim setlocal
        \ expandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
        \ formatoptions=jcrql
        \ foldmethod=marker
augroup END
" ------------------------------------------------------------------------- }}}

" --- YAML ---------------------------------------------------------------- {{{
augroup local_yaml_settings
  autocmd!
  autocmd FileType yaml setlocal
        \ expandtab
        \ tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
        \ ft=ansible
augroup END
" ------------------------------------------------------------------------- }}}

" ------------------------------------------------------------------------- }}}

" --- Plugins ------------------------------------------------------------- {{{

" --- ctrlp.vim ----------------------------------------------------------- {{{
let g:ctrlp_map = '<c-\>'
" ------------------------------------------------------------------------- }}}

" --- deoplete ------------------------------------------------------------ {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']

""" golang
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])

""" js
" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
      \ 'js',
      \ 'javascript.jsx',
      \ 'jsx',
      \ ]

""" TeX
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ .')'
" ------------------------------------------------------------------------- }}}

" --- easy-align ---------------------------------------------------------- {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)
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
imap <c-x><c-f> <plug>(fzf-complete-path)
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

" --- neoformat ----------------------------------------------------------- {{{
let g:neoformat_try_formatprg = 1

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_markdown   = ['remark']
" ------------------------------------------------------------------------- }}}

" --- neomake ------------------------------------------------------------- {{{
" let g:neomake_list_height = 3
" let g:neomake_open_list = 0
" let g:neomake_serialize = 1
" let g:neomake_serialize_abort_on_error = 1
" let g:neomake_verbose = 1
" let g:neomake_javascript_enabled_checkers = ['eslint']
" let g:neomake_scss_enabled_checkers = ['scss-lint']
" let g:neomake_sh_enabled_checkers = ['shellcheck']
" let g:neomake_ruby_enabled_checkers = ['rubocop', 'mri']
" let g:neomake_vim_enabled_checkers = ['vint']

" au BufRead,BufNewFile *.zsh set filetype=sh
" autocmd! BufWritePost,BufEnter *.sh,*.zsh,*.vim Neomake
" augroup neomake_grp
"   autocmd! BufWritePost *sh,*.vim,*rb Neomake
" augroup end

augroup neomake_grp
  autocmd! BufWritePost *.apib Neomake
augroup end
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

" Linters for Go
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet']

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

" --- vim-markdown -------------------------------------------------------- {{{
" let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_new_list_item_indent = 4
" ------------------------------------------------------------------------- }}}

" --- vim-tex -------------------------------------------------------- {{{
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

" ------------------------------------------------------------------------- }}}

" vim: et sw=2
