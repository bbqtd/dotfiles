" Plugins {{{
call plug#begin('$XDG_DATA_HOME/nvim/site/plugged')

""" Candy
Plug 'fatih/molokai'
Plug 'itchyny/lightline.vim'

""" Core tools
Plug 'tpope/vim-commentary' " comment everything like a boss
Plug 'tpope/vim-surround'   " change or insert symbol around something
Plug 'tpope/vim-obsession'  " create and continuously updated session file
" Plug 'tpope/vim-fugitive'   " git integration
Plug 'tpope/vim-repeat'     " extend '.' functionality
Plug 'benekastah/neomake', { 'for': ['sh', 'vim', 'ruby'] } " async jobs runner (linters, builders, ...)
Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf' } | Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

Plug 'Chiel92/vim-autoformat' " need more research

""" Languge specific extensions
Plug 'fatih/vim-go',            { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'vim-ruby/vim-ruby',       { 'for': 'ruby' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'lervag/vimtex',           { 'for': ['plaintex', 'tex'] }
Plug 'ferreum/vim-fish',        { 'for': 'fish' }


Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
" Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
" Autocomplete (npm install -g tern)
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'jsx', 'json'] }
" JS Documentation comments
" Plug 'heavenshell/vim-jsdoc', { 'on': ['JsDoc'] }

""" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

Plug 'ctrlpvim/ctrlp.vim', { 'for': 'go' }



" Plug 'benekastah/neomake', { 'for': ['sh', 'vim', 'ruby'] }
Plug 'neomake/neomake'

" utils
" Plug 'duggiefresh/vim-easydir' " create, edit and save files and directories
" Plug 'junegunn/vim-easy-align' " allign like a boss
Plug 'junegunn/goyo.vim'


call plug#end()
let g:goyo_width = 120
" }}}

" FZF <3 {{{
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
" }}}

""" vim-markdown settings
let g:vim_markdown_folding_level = 2

""" colors
let g:rehash256        = 1
let g:molokai_original = 1
colorscheme molokai

let g:is_bash = 1 " sh -> bash

""" leader
let g:mapleader = ','

""" general
lan en_US                    " UI language
set history=500              " Do you need huge history?
set number                   " Numerating lines
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case
set nolazyredraw             " don't be lazy, but sometimes lazy is is fine
set completeopt=menu,menuone

""" multilanguage support
" one note: ctrl-^ same as ctrl-6 combo!!!
" for changing between input type use ctrl-6, don't use your system input
" otherwise your binds and motion would be broken.
set keymap=russian-jcuken    " another input language
set iminsert=0               " use english as default input type
set imsearch=-1              " same input type in search as insert mode

""" spell check
" For downloading dictionary and initializing it use :set spell
" :set nospell turn off spell check
set spelllang=en_us,ru_yo    " spell check languages
" set spell " Spell check by default

""" editing/sourcing config
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Show invisible: http://vimcasts.org/episodes/show-invisibles/ {{{

" Characters for `Tab` and `End of Line`
set listchars=tab:▸\ ,eol:¬

" Show trailing whitespaces only in `normal mode`
augroup trailing
	au!
	au InsertEnter * :set listchars-=trail:⌴
	au InsertLeave * :set listchars+=trail:⌴
augroup END

" Shortcut to rapidly toggle show invisible
nnoremap <leader>l :set list!<CR>
" }}}

""" Easy navigation between splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

""" python
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider  = 1 " disable Python 2 support
let g:python_host_skip_check  = 1 " disable the Python 2 interpreter check
let g:python3_host_skip_check = 1 " disable the Python 3 interpreter check

" FileType settings {{{
"
" Awesome screencast about `Tabs` and `Spaces`: http://vimcasts.org/episodes/tabs-and-spaces/
" TL;DR:
" - `tabstop` == `softtabstop` if noexpandtab (prefer tabs)
" - `softtabstop` == `shiftwidth` if expandtab (prefer spaces)
" - for simplicity just use `tabstop` == `softtabstop` == `shiftwidth` and
"   toogle `exapndtab
"
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
	autocmd FileType vim setlocal formatoptions=jcrql
augroup end
" }}}

" Fish file settings ----------------- {{{
augroup filetype_fish
	autocmd!
	autocmd FileType fish setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
augroup end
" }}}

" Golang file settings {{{
augroup filetype_go
	autocmd!
	autocmd FileType go setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
	autocmd FileType go setlocal formatoptions=cqjr
augroup end
" }}}

" JavaScript file settings {{{
augroup filetype_js
	autocmd!
	autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
	" autocmd BufWritePre *.js :call <sid>StripTrailingWhitespaces()
augroup end
" }}}

" TeX file settings {{{
augroup filetype_tex
	autocmd!
	autocmd FileType tex setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
	autocmd FileType tex setlocal textwidth=90
augroup end
" }}}

" Ruby file settings {{{
augroup filetype_ruby
	autocmd!
	autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	autocmd BufWritePre *.rb :call <sid>StripTrailingWhitespaces()
augroup end
" }}}

" Makefile file settings {{{
augroup filetype_make
	autocmd!
	autocmd FileType make setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
augroup end
" }}}
" }}}

" QuickFix {{{
" Jump to next error
map <C-n> :cnext<CR>
" Jump to previous error
map <C-m> :cprevious<CR>
" Close QuickFix
nnoremap <leader>a :cclose<CR>
" }}}
"
""" autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOBIN.'gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

""" for tex
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
" Clean trailing whitespace
" nnoremap <leader>ww <sid>StripTrailingWhitespaces()<cr>

function! <sid>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" === easy align === "

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ==================== neomake ====================


" {{{ neomake options
" let g:neomake_list_height = 3
" let g:neomake_open_list = 0
" let g:neomake_serialize = 1
" let g:neomake_serialize_abort_on_error = 1
" let g:neomake_verbose = 1
" let g:neomake_javascript_enabled_checkers = ['eslint']
" let g:neomake_scss_enabled_checkers = ['scss-lint']
let g:neomake_sh_enabled_checkers = ['shellcheck']
let g:neomake_ruby_enabled_checkers = ['rubocop', 'mri']
let g:neomake_vim_enabled_checkers = ['vint']

" au BufRead,BufNewFile *.zsh set filetype=sh
" autocmd! BufWritePost,BufEnter *.sh,*.zsh,*.vim Neomake
augroup neomake_grp
	autocmd! BufWritePost *sh,*.vim,*rb Neomake
augroup end
" }}}


" ==================== lightline ====================
" Lightline {{{ 
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
" }}}

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

" ==================== vim-go ====================
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1

" let g:go_highlight_space_tab_error = 0
" let g:go_highlight_array_whitespace_error = 0
" let g:go_highlight_trailing_whitespace_error = 0
" let g:go_highlight_extra_types = 0
" let g:go_highlight_operators = 0
" let g:go_highlight_build_constraints = 1

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" linters for go
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet']

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

augroup vimgo_binds
	autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
	autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

	autocmd FileType go nmap <Leader>i <Plug>(go-info)
	autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

	autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
	autocmd FileType go nmap <leader>t  <Plug>(go-test)
	autocmd FileType go nmap <leader>r  <Plug>(go-run)

	autocmd FileType go nmap <Leader>d <Plug>(go-doc)
	autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

	" :A -> :GoAlternate in current buffer
	autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
	" :AV -> :GoAlternate in vertical split
	autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
	" :AS -> :GoAlternate in split
	autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
augroup end

" ==================== vim-autoformat ====================

augroup vimautoformat_grp
	autocmd BufWrite *.md :Autoformat
augroup end
