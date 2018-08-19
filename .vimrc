scriptencoding utf-8
set encoding=utf-8

call pathogen#infect()

" General sanity
syntax on
set textwidth=0
set colorcolumn=80
set nocompatible
set nowrap
set number
set tildeop
set incsearch
set nohlsearch
set shell=/bin/bash

" Stupid syntastic shit
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_racket_racket_checker = 0

" Syntastic checkers
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_c_compiler_options = "-std=c89 -W -Wall -Wno-variadic-macros"

let g:vimtex_view_method = 'zathura'

autocmd User Flags call Hoist("window", "SyntasticStatuslineFlag")

" Glorious 8-space tabs master race
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab

" Font
if has('gui_running')
  colorscheme base16-atelierheath
  set background=light
  if has('unix')
    if has('mac') || has('macunix')
      set guifont=Menlo:h18
      set background=light
    else
      set guifont=Menlo\ 12
    endif
  elseif has('win32') || has('win64')
    set guifont=Menlo:h12
  endif
else
  colorscheme default
  if has('vconsole')
    set background=dark
  else
    set background=light
  endif
endif

" Conceal
set conceallevel=2
let g:tex_conceal='admg'

" Mappings
noremap ; :
noremap : ;

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Fix stupid things about vim
set wildmode=list:longest,longest
"set autochdir  " in hindsight this is probably not a good idea
set backspace=indent,eol,start

" Indentation
set cino=b1,g0,N-s,i4
set cinkeys=0{,0},0),:,0#,!^F,o,O,e,0=break
set listchars=tab:⇥\ ,space:·,trail:█

" Both of these are needed for automatic indentation to work properly!
set autoindent
filetype indent plugin on

" Splits
set splitbelow
set splitright

" Get rid of those stupid files
set backupdir=$HOME/.vim/tmp
set directory=$HOME/.vim/tmp
set swapfile
set backup
set viminfo+=%

" Folding options
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')

" Windows GUI options
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions+=c

let maplocalleader=","
let mapleader="\\"

runtime! ftplugin/man.vim
nnoremap K :Man <cword><cr>
let g:ft_man_open_mode = 'tab'

" Scroll screen around using arrow keys
map <left> zh
map <right> zl
map <up> <C-y>
map <down> <C-e>

" Fix stupid default side scrolling nonsense
set sidescrolloff=1
set sidescroll=1

" Disable arrow keys (to force me to use hjkl)
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>
imap <down> <nop>

map <leader>y "+y
map <leader>d "+d
map <leader>p "+p
map <leader>P "+P

nnoremap <leader>r   :Rex<cr>

noremap <leader>ve   :edit $MYVIMRC<cr>
noremap <leader>vs   :split $MYVIMRC<cr>
noremap <leader>vv   :vsplit $MYVIMRC<cr>
noremap <leader>vt   :tabedit $MYVIMRC<cr>

noremap <leader>bl   :set bg=light<cr>
noremap <leader>bd   :set bg=dark<cr>

noremap <leader>ttw  :call ToggleTextwidth()<cr>
noremap <leader>tw   :call ToggleWrap()<cr>
noremap <leader>tcc  :call ToggleColorColumn()<cr>

noremap <leader>l    :set list!<cr>

noremap <leader>f    :call FindByFilename()<cr>
noremap <leader>F    :call FindByContent()<cr>

noremap <leader>cd   :chdir %:p:h<cr>
noremap <leader>cu   :chdir ..<cr>
noremap <leader>cg   :call ChangeToGitToplevel()<cr>

noremap <leader>scs  :call ConcealSplit()<cr>

noremap <F2>         :caddexpr expand("%").":".line(".").":".col(".")<cr>
noremap <F3>         :cprev<cr>
noremap <F4>         :cnext<cr>
noremap <F5>         :lprev<cr>
noremap <F6>         :lnext<cr>
noremap <F7>         :tabp<cr>
noremap <F8>         :tabn<cr>
noremap <F9>         :call SwitchToJavaScript()<cr>
noremap <F10>        :call SwitchToTypeScript()<cr>

noremap <leader>o    :only<cr>

noremap <leader>:    :s/\(\s*\):/:\1/g<cr>
noremap <leader>t:   :Tabular /:
noremap <leader>t=   :Tabular /=
noremap <leader>T:   :Tabular /:\zs
noremap <leader>T=   :Tabular /=\zs

" Glorious 8-space tabs master race
set tabstop=8
set shiftwidth=8
set textwidth=0
set noexpandtab

" Non-typo abbreviations
iabbrev myemail miles.rout@gmail.com
iabbrev mysig Miles Rout <miles.rout@gmail.com>

" Javascript crap
let g:js_context_colors_enabled = 1

function! SwitchToJavaScript()
  let command = "node \"$HOME/.vim/jsts-mapper/index.js\" gen ".expand("%")." ".line(".")." ".col(".")
  let path = system(command)
  let [file, line, column] = split(path, ":")
  execute 'edit' l:file
  call cursor(line, column)
endfunction

function! SwitchToTypeScript()
  let command = "node \"$HOME/.vim/jsts-mapper/index.js\" orig ".expand("%")." ".line(".")." ".col(".")
  let path = system(command)
  let [file, line, column] = split(path, ":")
  execute 'edit' l:file
  call cursor(line, column)
endfunction

" Functions

function! Tab(char, times)
  let pattern = "/^"
  let i = 0
  while i <= a:times
    let pattern = pattern . "[^" . a:char . "]*" . a:char
    let i = i + 1
  endwhile
  let command = ":Tab " . pattern . "\zs"
  execute command
endfunction

function! FindByFilename()
  call inputsave()
  let pattern = input("Search (by filename): ", "", "file")
  if empty(pattern)
    return 1
  endif
  call inputrestore()
  lexpr system("find . -iname '*" . pattern . "*'")
  lopen
endfunction

function! FindByContent()
  call inputsave()
  let pattern = input("Search (by content): ")
  if empty(pattern)
    return 1
  endif
  call inputrestore()
  lexpr system('rg --column -nSe "' . pattern . '"')
  lopen
endfunction

function! MemeMode()
  set listchars=tab:﷽\ ,space:.
  set ts=10 sts=10 sw=10 noet
  set list
endfunction

" Wrap crap
function! ToggleWrap()
  if &wrap
    set nowrap
    call ColorColumnOn()
  else
    set wrap
    call ColorColumnOff()
  endif
endfunction

function! ToggleTextwidth()
  if &textwidth == 0
    call ColorColumnOff()
    let &tw = (g:old_colorcolumn - 1)
    set nowrap
  else
    call ColorColumnOn()
    set tw=0
    set wrap
  endif
endfunction

function! ToggleShellEscape()
  if b:shell_escape == 0
    let b:shell_escape = 1
  else
    let b:shell_escape = 0
  endif
endfunction

function! PdfLatex()
  if b:shell_escape == 0
    !pdflatex %
  else
    !pdflatex -shell-escape %
  endif
endfunction

" Conceal crap
function! ConcealSplit()
  set cursorbind
  set scrollbind
  set wrap
  set conceallevel=2
  vsplit
  set conceallevel=0
endfunction

" Stupid vimscript shit
function! SetVimscriptIndents()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
endfunction

" Colorcolumn toggling
function! ToggleColorColumn()
  if &colorcolumn == ""
    call ColorColumnOn()
  else
    call ColorColumnOff()
  endif
endfunction

function! ColorColumnOn()
  if &colorcolumn == ""
    let &colorcolumn=g:old_colorcolumn
  endif
endfunction

function! ColorColumnOff()
  if &colorcolumn != ""
    let g:old_colorcolumn=&colorcolumn
    set colorcolumn=
  endif
endfunction

" e.g. if in ~/.vim/bundle will go to ~/.vim
function! ChangeToGitToplevel()
  cd %:p:h
  let dir = system('git rev-parse --show-toplevel')
  if v:shell_error
    echoerr dir
    return 1
  endif
  execute 'chdir '.dir
  pwd
endfunction

" General autocmds
augroup myaugroup_reload_vimrc 
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufWritePost $MYVIMRC call SetVimscriptIndents()
augroup END

" Language-specific autocmds
augroup myaugroup_vimscript
  autocmd!
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 et
augroup END

augroup myaugroup_haskell
  autocmd!
  autocmd FileType haskell setlocal ts=4 sts=4 sw=4 et
  autocmd FileType haskell noremap <buffer> <localleader>si  :!stack ghci<cr>
  autocmd FileType haskell noremap <buffer> <localleader>sc  :!stack ghc %<cr>
  autocmd FileType haskell noremap <buffer> <localleader>gi  :!ghci %<cr>
  autocmd FileType haskell noremap <buffer> <localleader>gc  :!ghc %<cr>
  autocmd FileType haskell noremap <buffer> <localleader>w   :w<cr>:!ghc %<cr>
  autocmd FileType haskell noremap <buffer> <localleader>c   :GhcModCheckAndLintAsync<cr>
  autocmd FileType haskell noremap <buffer> <localleader>fs  :GhcModSplitFunCase<cr>
  autocmd FileType haskell noremap <buffer> <localleader>i   :GhcModInfo<cr>
  autocmd FileType haskell noremap <buffer> <localleader>sc  :GhcModSigCodegen<cr>
  autocmd BufRead,BufNewFile *.cabal set filetype=cabal
  autocmd FileType cabal   setlocal et
augroup END

augroup myaugroup_tex
  autocmd!
  autocmd BufRead,BufNewFile *.ltx set filetype=pytex
  autocmd FileType pytex noremap <buffer> <localleader>c  :call PdfLatex()<cr>
  autocmd FileType pytex noremap <buffer> <localleader>w  :w<cr>:call PdfLatex()<cr>
  autocmd FileType pytex noremap <buffer> <localleader>cl :hi clear Conceal<cr>
  autocmd FileType pytex noremap <buffer> <localleader>se :call ToggleShellEscape()<cr>
  autocmd FileType pytex let b:shell_escape = 0
augroup END

augroup myaugroup_c
  autocmd!
  autocmd BufRead,BufNewFile *.h set filetype=c
  autocmd Filetype c set ts=8 sts=8 sw=8 noet
  autocmd Filetype c noremap <buffer> <localleader>s        :SyntasticCheck gcc<cr>:Errors<cr>
augroup END

augroup myaugroup_cpp
  autocmd!
  autocmd Filetype cpp setlocal ts=4 sts=4 sw=4 et
augroup END

augroup myaugroup_dcpu
  autocmd!
  autocmd BufRead,BufNewFile *.s setlocal filetype=dcpu
augroup END

augroup myaugroup_javascript
  autocmd!
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noet
augroup END

augroup myaugroup_typescript
  autocmd!
  autocmd FileType typescript setlocal ts=2 sts=2 sw=2 noet
augroup END

augroup my_augroup_python
  autocmd!
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType python setlocal makeprg=python3\ -i\ %
augroup END

augroup my_augroup_visp
  autocmd!
  autocmd BufRead,BufNewFile *.visp set filetype=visp
  autocmd FileType visp setlocal ts=2 sts=2 sw=2 et
augroup END

augroup my_augroup_vim
  autocmd!
  autocmd FileType vim call SetVimscriptIndents()
augroup END

augroup my_augroup_html
  autocmd!
  autocmd FileType html setlocal ts=2 sts=2 sw=2 noet
augroup END

augroup my_augroup_vue
  autocmd!
  autocmd FileType vue.html.javascript.css set ts=2 sts=2 sw=2 et
augroup END

hi QuickFixLine cterm=reverse guibg=Grey
hi Search       cterm=reverse guibg=Grey
hi Comment      cterm=italic  gui=italic
