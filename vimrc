scriptencoding utf-8
set encoding=utf-8
set nocompatible
set directory=~/.local/share/vim/swap
set backupdir=~/.local/share/vim/backup
set undodir=~/.local/share/vim/undo
set viewdir=~/.local/share/vim/view
set viminfo+=%,n~/.local/share/vim/viminfo
set runtimepath+=~/.config/vim,~/.config/vim/after,$VIM,$VIMRUNTIME
let $MYVIMRC="~/.config/vim/vimrc"

call pathogen#infect()
packadd! matchit

" General sanity
syntax on
set textwidth=0
set colorcolumn=80
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
let g:syntastic_c_checkers = []

let g:syntastic_c_compiler_options = "-std=c99 -Wall -Wno-unused-variable -D_XOPEN_SOURCE=600"
let g:syntastic_c_config_file = ".syntastic_c_config"

let g:vimtex_view_method = 'zathura'

" Glorious 8-space tabs master race
set tabstop=8
set softtabstop=8
set shiftwidth=8
set textwidth=0
set noexpandtab

" GDB
packadd termdebug

" Conceal
set conceallevel=2
let g:tex_conceal='admg'

" Fix stupid things about vim
set wildmode=list:longest,longest
set backspace=indent,eol,start

" Indentation
set cino=g0,N-s,i4,l1,t0,+1s
set cinkeys=0{,0},0),:0,!^F,o,O,e,0=break
set listchars=tab:⇥\ ,trail:█,space:·

" Both of these are needed for automatic indentation to work properly!
set autoindent
filetype indent plugin on

" Splits
set splitbelow
set splitright

" Enable persistence features
set swapfile
set backup
set undofile
let g:netrw_home="~/.local/share/netrw"

" Folding options
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')

" Windows GUI options
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions+=c

" Fix stupid default side scrolling nonsense
set sidescrolloff=1
set sidescroll=1

" Fix stupid C (struct foo){a, b, c} highlighting
let c_no_curly_error=1

" Stupid syntastic shit
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_enable_racket_racket_checker = 0

" Syntastic checkers
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_c_compiler_options = "-std=c99 -Wall -Wno-unused-variable -Wno-pointer-sign"
let g:syntastic_c_config_file = ".syntastic_c_config"

let g:vimtex_view_method = 'zathura'

" Airline
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_detect_spell=1
let g:airline_detect_spelllang=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#whitespace#mixed_indent_algo=2
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#obsession#enabled=1

" Signify
let g:signify_sign_add               = "++"
let g:signify_sign_delete            = "--"
let g:signify_sign_delete_first_line = "--"
let g:signify_sign_change            = "~~"
let g:signify_sign_change_delete     = "~!"

" Mappings
let maplocalleader=","
let mapleader="\\"

noremap ; :
noremap : ;

noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Scroll screen around using arrow keys
map <left> zh
map <right> zl
map <up> <C-y>
map <down> <C-e>

runtime! ftplugin/man.vim
nnoremap K :Man <cword><cr>
let g:ft_man_open_mode = 'vert'

let g:sandwich_no_default_key_mappings = 1
nmap Sa <Plug>(sandwich-add)
xmap Sa <Plug>(sandwich-add)
omap Sa <Plug>(sandwich-add)
nmap Sd <Plug>(sandwich-delete)
xmap Sd <Plug>(sandwich-delete)
omap Sdb <Plug>(sandwich-delete-auto)
nmap Sr <Plug>(sandwich-replace)
xmap Sr <Plug>(sandwich-replace)
omap Srb <Plug>(sandwich-replace-auto)

omap ib <Plug>(textobj-sandwich-auto-i)
xmap ib <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
xmap ab <Plug>(textobj-sandwich-auto-a)

omap iS <Plug>(textobj-sandwich-query-i)
xmap iS <Plug>(textobj-sandwich-query-i)
omap aS <Plug>(textobj-sandwich-query-a)
xmap aS <Plug>(textobj-sandwich-query-a)

omap iSS <Plug>(textobj-sandwich-literal-query-i)
xmap iSS <Plug>(textobj-sandwich-literal-query-i)
omap aSS <Plug>(textobj-sandwich-literal-query-a)
xmap aSS <Plug>(textobj-sandwich-literal-query-a)

let g:textobj_functioncall_no_default_key_mappings = 1
xmap iC <Plug>(textobj-functioncall-i)
omap iC <Plug>(textobj-functioncall-i)
xmap aC <Plug>(textobj-functioncall-a)
omap aC <Plug>(textobj-functioncall-a)

let g:textobj_function_no_default_key_mappings = 1
xmap if <Plug>(textobj-function-i)
omap if <Plug>(textobj-function-i)
xmap af <Plug>(textobj-function-a)
omap af <Plug>(textobj-function-a)
xmap iF <Plug>(textobj-function-I)
omap iF <Plug>(textobj-function-I)
xmap aF <Plug>(textobj-function-A)
omap aF <Plug>(textobj-function-A)

xmap i, <Plug>(swap-textobject-i)
omap i, <Plug>(swap-textobject-i)
xmap a, <Plug>(swap-textobject-a)
omap a, <Plug>(swap-textobject-a)

" map <leader>y "+y
" map <leader>d "+d
" map <leader>p "+p
" map <leader>P "+P

noremap <leader>y "+y:call system("wl-copy", @+)<cr>
noremap <leader>d "+d:call system("wl-copy", @+)<cr>
noremap <leader>p :let @+=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>"+p
noremap <leader>P :let @+=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>"+P

nnoremap <leader>r   :Rex<cr>

noremap <leader>ve   :edit $MYVIMRC<cr>
noremap <leader>vs   :split $MYVIMRC<cr>
noremap <leader>vv   :vsplit $MYVIMRC<cr>
noremap <leader>vt   :tabedit $MYVIMRC<cr>
noremap <leader>vc   :edit ~/.config/vim/syntax/c.vim<cr>

noremap <leader>cv   :vsplit ~/.config/vim/syntax/c.vim<cr>

noremap <leader>bl   :set bg=light<cr>
noremap <leader>bd   :set bg=dark<cr>

noremap <leader>ttw  :call ToggleTextwidth()<cr>
noremap <leader>tw   :call ToggleWrap()<cr>
noremap <leader>tcc  :call ToggleColorColumn()<cr>
noremap <leader>tr   :set relativenumber!<cr>

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

noremap <leader>o    :only<cr>

noremap <leader>\    :s/\(\s*\)\\/\\\1/g<cr>
noremap <leader>:    :s/\(\s*\):/:\1/g<cr>
noremap <leader>=    :s/\(\s*\)=/=\1/g<cr>
noremap <leader>,    :s/\(\s*\),/,\1/g<cr>
noremap <leader>t\   :Tabular /^[^\\]*\zs\\
noremap <leader>t:   :Tabular /^[^:]*\zs:
noremap <leader>t=   :Tabular /^[^=]*\zs=
noremap <leader>t,   :Tabular /^[^,]*\zs,
noremap <leader>T\   :Tabular /\\\zs
noremap <leader>T:   :Tabular /:\zs
noremap <leader>T=   :Tabular /=\zs
noremap <leader>T,   :Tabular /,\zs

" Non-typo abbreviations
iabbrev myemail miles@rout.nz
iabbrev mysig Miles Rout <miles@rout.nz>

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

function! TagSplit(mods, tag)
  let tag = a:tag
  if tag == "<cword>"
    let tag = expand("<cword>")
  endif
  let thiswin = winnr()
  exe "norm! \<C-W>b"
  if winnr() > 1
    exe "norm! " . thiswin . "\<C-W>w"
    while 1
      if exists("w:my_ctags_window")
        break
      endif
      exe "norm! \<C-W>w"
      if thiswin == winnr()
        break
      endif
    endwhile
  endif
  if !exists("w:my_ctags_window")
    exe a:mods . ' split'
    let w:my_ctags_window = 1
  endif
  exe "tag " . tag
  norm! zb
  let &l:cursorline = 1
  exe "norm! " . thiswin . "\<C-W>w"
endfunction

command -nargs=1 -complete=tag TagSplit call TagSplit(<q-mods>, <f-args>)
nnoremap <leader>] :vertical :TagSplit <cword><cr>

" General autocmds
augroup myaugroup_reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufWritePost $MYVIMRC call SetVimscriptIndents()
augroup END

augroup myaugroup_crontab
  autocmd BufRead,BufNewFile .crontab set filetype=crontab
augroup END

augroup myaugroup_haskell
  autocmd!
  autocmd BufRead,BufNewFile *.cabal set filetype=cabal
  autocmd FileType haskell nmap <F5> <Plug>(lcn-menu)
augroup END

augroup myaugroup_tex
  autocmd!
  autocmd BufRead,BufNewFile *.ltx set filetype=pytex
augroup END

augroup myaugroup_c
  autocmd!
  autocmd BufRead,BufNewFile *.h setlocal filetype=c
  autocmd BufRead,BufNewFile *.c setlocal filetype=c
  autocmd FileType c nnoremap <buffer> <localleader>m  :Make<cr>
  autocmd FileType c nnoremap <buffer> <localleader>O  :Copen<cr>
  autocmd FileType c nnoremap <buffer> <localleader>g  :Termdebug<cr>
  autocmd FileType c nnoremap <buffer> <localleader>r  :Run<cr>
  autocmd FileType c nnoremap <buffer> <localleader>s  :Step<cr>
  autocmd FileType c nnoremap <buffer> <localleader>o  :Over<cr>
  autocmd FileType c nnoremap <buffer> <localleader>f  :Finish<cr>
  autocmd FileType c nnoremap <buffer> <localleader>c  :Continue<cr>
  autocmd FileType c nnoremap <buffer> <localleader>S  :Stop<cr>
  autocmd FileType c nnoremap <buffer> <localleader>b  :Break<cr>
  autocmd FileType c nnoremap <buffer> <localleader>e  :Evaluate<Space>
  autocmd FileType c setlocal foldmethod=marker
  autocmd FileType c setlocal ts=8 sts=8 sw=8 noet
augroup END

augroup myaugroup_dcpu
  autocmd!
  autocmd BufRead,BufNewFile *.s setlocal filetype=dcpu
augroup END

augroup my_augroup_python
  autocmd!
  autocmd FileType python setlocal ts=4 sts=4 sw=4 et
  autocmd FileType python setlocal makeprg=python3\ -i\ %
  autocmd FileType python noremap <buffer> <localleader>i  :!python3 -i %<cr>
augroup END

augroup my_augroup_verilog
  autocmd!
  autocmd FileType verilog setlocal ts=2 sts=2 sw=2 et
augroup END

augroup my_augroup_visp
  autocmd!
  autocmd BufRead,BufNewFile *.visp set filetype=visp
  autocmd FileType visp setlocal ts=2 sts=2 sw=2 et
augroup END

augroup my_augroup_man
  autocmd!
  autocmd FileType man setlocal colorcolumn=100
augroup END

let base16colorspace=256
let g:base16_shell_path="$HOME/.config/base16-shell/scripts/"
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

colorscheme base16-irblack
set bg=dark
let g:airline_theme="base16_shell"

set guifont="DejaVu Sans Mono 12"

hi QuickFixLine cterm=reverse guibg=Grey
hi Search       cterm=reverse guibg=Grey
hi Comment      cterm=italic gui=italic ctermfg=147 guifg=#afafff
"hi Comment      cterm=italic gui=italic ctermfg=91 guifg=#8700af

hi SignColumn                 cterm=bold ctermfg=NONE  ctermbg=NONE guifg=NONE  guibg=NONE
hi SignifySignAdd             cterm=bold ctermfg=green ctermbg=NONE guifg=green guibg=NONE
hi SignifySignChange          cterm=bold ctermfg=cyan  ctermbg=NONE guifg=cyan  guibg=NONE
hi SignifySignChangeDelete    cterm=bold ctermfg=cyan  ctermbg=NONE guifg=cyan  guibg=NONE
hi SignifySignDelete          cterm=bold ctermfg=red   ctermbg=NONE guifg=red   guibg=NONE
hi SignifySignDeleteFirstLine cterm=bold ctermfg=cyan  ctermbg=NONE guifg=cyan  guibg=NONE
