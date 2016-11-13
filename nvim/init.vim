" vim-plug {{{
call plug#begin('$XDG_DATA_HOME/nvim/site/plugged')

""" Candy
" Plug 'fatih/molokai'
Plug 'tomasr/molokai'
Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'

""" Core tools
Plug 'editorconfig/editorconfig-vim' " format style between editors
Plug 'neomake/neomake'      " async job runner
Plug 'tpope/vim-commentary' " comment everything like a boss
Plug 'tpope/vim-surround'   " change or insert symbol around something
" Plug 'tpope/vim-obsession'  " create and continuously updated session file
Plug 'tpope/vim-fugitive'   " git integration
Plug 'tpope/vim-repeat'     " extend '.' functionality
Plug 'junegunn/fzf', { 'dir': '/usr/local/opt/fzf' } | Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " async complete system
Plug 'Chiel92/vim-autoformat' " need more research
" Plug 'duggiefresh/vim-easydir' " create, edit and save files and directories
" Plug 'junegunn/vim-easy-align' " allign like a boss
Plug 'Raimondi/delimitMate'

""" Languge specific extensions
""" Golang
Plug 'fatih/vim-go',      { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }

""" EcmaScript
Plug 'pangloss/vim-javascript',  { 'for': ['javascript', 'jsx'] }
Plug 'mxw/vim-jsx',              { 'for': 'jsx' }
Plug 'elzr/vim-json',            { 'for': 'json' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'jsx'] }
Plug 'millermedeiros/vim-esformatter', { 'for': ['javascript', 'jsx'] }
" JS Documentation comments
" Plug 'heavenshell/vim-jsdoc', { 'on': ['JsDoc'] }

""" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

""" Markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim'

""" TeX
Plug 'lervag/vimtex', { 'for': ['plaintex', 'tex'] }

""" Fish
Plug 'ferreum/vim-fish', { 'for': 'fish' }

""" Docker
Plug 'docker/docker', { 'for': 'Dockerfile', 'rtp': '/contrib/syntax/vim/'}

""" Java
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

""" Tmux
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }

Plug 'chase/vim-ansible-yaml', { 'for': ['yaml', 'ansible'] }

call plug#end()
" }}}

" Colors {{{
let g:rehash256 = 1
set background=dark
" let g:molokai_original = 1
colorscheme molokai
" colorscheme dracula
" }}}

" Global settings {{{

" Sensible settings {{{
lan en_US                    " UI language
set history=500              " Do you need huge history?
set number                   " Numerating lines
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set noshowmatch
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case
set lazyredraw               " Wait for redraw
set completeopt=menu,menuone
set updatetime=400
set shortmess+=c

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10
" }}}

" Multilanguage settings {{{
" one note: ctrl-^ same as ctrl-6 combo!!!
" for changing between input type use ctrl-6, don't use your system input
" otherwise your binds and motion would be broken.
set keymap=russian-jcuken    " another input language
set iminsert=0               " use english as default input type
set imsearch=-1              " same input type in search as insert mode
" better use Ctrl-l instead Ctrl-^
inoremap <C-L> <C-^>
cnoremap <C-L> <C-^>

""" spell check
" For downloading dictionary and initializing it use :set spell
" :set nospell turn off spell check
set spelllang=en_us,ru_yo    " spell check languages
" set spell " Spell check by default
" }}}

" Show invisible: http://vimcasts.org/episodes/show-invisibles/ {{{

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
" }}}

" Key Mappings {{{

" leader
let g:mapleader = ','

""" editing/sourcing config
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

""" Easy navigation between splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" python {{{
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider  = 1 " disable Python 2 support
let g:python_host_skip_check  = 1 " disable the Python 2 interpreter check
let g:python3_host_skip_check = 1 " disable the Python 3 interpreter check
" }}}

" }}}

" FileType settings {{{
"
" Awesome screencast about `Tabs` and `Spaces`: http://vimcasts.org/episodes/tabs-and-spaces/
" TL;DR:
" - `tabstop` == `softtabstop` if noexpandtab (prefer tabs)
" - `softtabstop` == `shiftwidth` if expandtab (prefer spaces)
" - for simplicity just use `tabstop` == `softtabstop` == `shiftwidth` and
"   toogle `exapndtab
"

augroup custom_filetypes
	autocmd!
	autocmd BufNewFile,BufRead .esformatter set filetype=json

	" put quickfix window always to the bottom
	autocmd FileType qf wincmd J
augroup END

" JSON Settings {{{
augroup local_json_settings
	autocmd!
	autocmd FileType json setlocal
				\ expandtab
				\ tabstop=2
				\ softtabstop=2
				\ shiftwidth=2
augroup END
" }}}

" Markdown settings {{{
augroup local_markdown_settings
	autocmd!
	autocmd FileType markdown setlocal
				\ spell
				\ textwidth=90
augroup END
" }}}

" Vim settings {{{
augroup local_vim_settings
	autocmd!
	autocmd FileType vim setlocal
				\ noexpandtab
				\ tabstop=2
				\ softtabstop=2
				\ shiftwidth=2 
				\ formatoptions=jcrql
				\ foldmethod=marker
augroup END

" }}}

" YAML settings {{{
augroup local_yaml_settings
	autocmd!
	autocmd FileType yaml setlocal
				\ expandtab
				\ tabstop=2 
				\ softtabstop=2
				\ shiftwidth=2
				\ ft=ansible
augroup END
" }}}

" Fish settings {{{
augroup local_fish_settings
	autocmd!
	autocmd FileType fish setlocal
				\ noexpandtab 
				\ tabstop=2
				\ softtabstop=2
				\ shiftwidth=2 
augroup END
" }}}

" Go settings {{{
augroup local_go_settings
	autocmd!
	autocmd FileType go setlocal
				\ noexpandtab 
				\ tabstop=2
				\ softtabstop=2
				\ shiftwidth=2
				\ formatoptions=cqjr
augroup END
" }}}

" JavaScript settings {{{
augroup local_javascript_settings
	autocmd!
	autocmd FileType javascript setlocal
				\ expandtab
				\ tabstop=2
				\ softtabstop=2
				\ shiftwidth=2 
				\ formatoptions-=o
	autocmd FileType javascript.jsx setlocal
				\ expandtab
				\ tabstop=2
				\ softtabstop=2
				\ shiftwidth=2 
				\ formatoptions-=o
augroup END
" }}}

" TeX settings {{{
augroup local_tex_settings
	autocmd!
	autocmd FileType tex setlocal
				\ noexpandtab
				\ tabstop=2
				\ softtabstop=2
				\ shiftwidth=2
				\ textwidth=90
augroup END
" }}}

" Ruby settings {{{
augroup local_ruby_settings
	autocmd!
	autocmd FileType ruby setlocal
				\ expandtab 
				\ tabstop=2
				\ softtabstop=2
				\ shiftwidth=2 
augroup END
" }}}

" Makefile settings {{{
augroup local_make_settings
	autocmd!
	autocmd FileType make setlocal
				\ noexpandtab
				\ tabstop=8
				\ softtabstop=8
				\ shiftwidth=8 
augroup END
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

" Plugins {{{

" deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']

" golang
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#set('_', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#set('_', 'converters', ['converter_remove_paren'])
call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])

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
" }}}

" easy align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" editorconfig-vim {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" }}}

" fzf {{{
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

" goyo.vim {{{
let g:goyo_width = 120
" }}}

" lightline {{{
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
" }}}

" neomake {{{
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
" 	autocmd! BufWritePost *sh,*.vim,*rb Neomake
" augroup end
" }}}

" vim-autoformat {{{
let g:formatdef_standard_javascript = '"standard --fix --stdin"'
let g:formatters_javascript = ['standard_javascript']

nnoremap <leader>a :Autoformat<cr>
" }}}

" vim-go {{{

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1

let g:go_fmt_fail_silently = 1
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1

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
augroup END
" }}}

" vim-json {{{
let g:vim_json_syntax_conceal = 0
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_level = 2
" }}}

" }}}

" Candidate on delete {{{

let g:is_bash = 1 " sh -> bash

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
" }}}
