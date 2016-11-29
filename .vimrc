call pathogen#infect()

" General sanity
syntax on
set colorcolumn=80
set nocompatible
set nowrap
set number
set tildeop
set incsearch

" Font
if has('gui_running')
  set background=dark
  colorscheme base16-atelierheath
  if has('unix')
    if has('mac') || has('macunix')
      set guifont=Source\ Code\ Pro\ Medium:h16
      set background=light
    else
      set guifont=Source\ Code\ Pro\ Medium\ 16
    endif
  elseif has('win32') || has('win64')
    " FIXME?
    set guifont=Source\ Code\ Pro\ Medium:h16
  endif
else
  set background=light
  colorscheme default
endif

" Conceal
set conceallevel=2
hi clear Conceal
let g:tex_conceal='admg'

" Mappings
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
onoremap : ;
onoremap ; :

" Fix stupid things about vim
set wildmode=list:longest,longest
set autochdir  " in hindsight this is probably not a good idea
set backspace=indent,eol,start

" Indentation
set cino=b1,g0,N-s,i4
set cinkeys=0{,0},0),:,0#,!^F,o,O,e,0=break
set listchars=tab:⇥\ ,space:·

" Both of these are needed for automatic indentation to work properly
set autoindent
set smartindent

" Splits
set splitbelow
set splitright

" Get rid of those stupid files
set nowritebackup
set noswapfile
set nobackup

" Folding options
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')

" Windows GUI options
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

let maplocalleader="|"
let mapleader="\\"

" Disable arrow keys (to force me to use hjkl)
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>
imap <down> <nop>

vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
vmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>P "+P

nnoremap <leader>ve :edit $MYVIMRC<cr>
nnoremap <leader>vs :split $MYVIMRC<cr>
nnoremap <leader>vv :vsplit $MYVIMRC<cr>
nnoremap <leader>vt :tabedit $MYVIMRC<cr>

nnoremap <leader>bl :set bg=light<cr>
nnoremap <leader>bd :set bg=dark<cr>

nnoremap <leader>s  :call ConcealSplit()<cr>

nnoremap <leader>l  :set list!<cr>
nnoremap <leader>cc :call ToggleColorColumn()<cr>

nnoremap <leader>f  :!grep 
nnoremap <leader>F  :!rg 

nnoremap <leader>cu :chdir ..<cr>
nnoremap <leader>cg :call ChangeToGitToplevel()<cr>


nnoremap <F7>       :tabp<cr>
nnoremap <F8>       :tabn<cr>

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

" Conceal crap
function! ConcealSplit()
  set cursorbind
  set scrollbind
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
    set colorcolumn=80
  else
    set colorcolumn=
  endif
endfunction

" e.g. if in ~/.vim/bundle will go to ~/.vim
function! ChangeToGitToplevel()
  let dir = system('git rev-parse --show-toplevel')
  if !v:shell_error
    echoerr dir
    return 1
  endif
  execute 'chdir '.dir
endfunction

" General autocmds
augroup myaugroup_reload_vimrc 
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufWritePost $MYVIMRC call SetVimscriptIndents()
augroup END

" Language-specific autocmds
augroup myaugroup_haskell
  autocmd!
  autocmd FileType haskell set ts=4 sw=4 et
  autocmd FileType haskell nnoremap <buffer> <localleader>si  :!stack ghci<cr>
  autocmd FileType haskell nnoremap <buffer> <localleader>sc  :!stack ghc %<cr>
  autocmd FileType haskell nnoremap <buffer> <localleader>gi  :!ghci %<cr>
  autocmd FileType haskell nnoremap <buffer> <localleader>gc  :!ghc %<cr>
  autocmd FileType haskell nnoremap <buffer> <localleader>w   :w<cr>:!ghc %<cr>
augroup END

augroup myaugroup_tex
  autocmd!
  autocmd FileType tex nnoremap <buffer> <localleader>c  :!pdflatex %<cr>
  autocmd FileType tex nnoremap <buffer> <localleader>w  :w<cr>:!pdflatex %<cr>
augroup END

augroup myaugroup_cpp
  autocmd!
  autocmd Filetype cpp set ts=4 sw=4 et
augroup END

augroup myaugroup_dcpu
  autocmd!
  autocmd BufRead,BufNewFile *.s set filetype=dcpu
augroup END

augroup myaugroup_javascript
  autocmd!
  autocmd FileType javascript set sts=2 ts=2 sw=2 noet
augroup END

augroup myaugroup_typescript
  autocmd!
  autocmd FileType typescript set ts=2 sw=2 et
augroup END

augroup my_augroup_python
  autocmd!
  autocmd FileType python set ts=4 sw=4 et
augroup END

augroup my_augroup_vim
  autocmd!
  autocmd FileType vim call SetVimscriptIndents()
augroup END

augroup my_augroup_html
  autocmd!
  autocmd FileType html set ts=2 sts=2 sw=2 noet
augroup END
