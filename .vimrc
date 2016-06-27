call pathogen#infect()

" General sanity
syntax on
set background=dark
colorscheme base16-ashes
set guifont=Monaco:h14
set colorcolumn=80
set columns=83
set nocompatible
set nowrap
set number
set tildeop
set incsearch

" Conceal
set conceallevel=2
hi Conceal guifg=purple
hi Conceal guibg=white
let g:tex_conceal='admgs'

" Mappings
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
onoremap : ;
onoremap ; :

" Fix stupid things about vim
set wildmode=list:longest,longest
set autochdir
set backspace=indent,eol,start

" Indentation
set cino=b1,g0,N-s,i4
set cinkeys=0{,0},0),:,0#,!^F,o,O,e,0=break

" Both of these are needed for automatic indentation to work properly
set autoindent
set smartindent

" Splits
set splitbelow
set splitright
set winheight=20
silent! set winminheight=5
set winwidth=80
silent! set winminwidth=40

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

nnoremap <leader>v :edit $MYVIMRC<cr>
nnoremap <leader>vS :split $MYVIMRC<cr>
nnoremap <leader>vV :vsplit $MYVIMRC<cr>
nnoremap <leader>vT :tabedit $MYVIMRC<cr>

" Glorious 8-space tabs master race
set tabstop=8
set shiftwidth=8
set noexpandtab

" Non-typo abbreviations
iabbrev myemail miles.rout@gmail.com
iabbrev mysig Miles Rout <miles.rout@gmail.com>
iabbrev impm In my perfect MMORPG

" Javascript crap
let g:js_context_colors_enabled = 1

" General autocmds
augroup myaugroup_reload_vimrc 
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Language-specific autocmds
augroup myaugroup_haskell
  autocmd!
  autocmd FileType haskell set ts=4 sw=4 et
  autocmd FileType haskell nnoremap <buffer> <leader>r  :!ghci %<cr>
  autocmd FileType haskell nnoremap <buffer> <leader>c  :!ghc %<cr>
  autocmd FileType haskell nnoremap <buffer> <leader>w  :w<cr>:!ghc %<cr>
augroup END

augroup myaugroup_tex
  autocmd!
  autocmd FileType tex nnoremap <buffer> <leader>c  :!pdflatex %<cr>
  autocmd FileType tex nnoremap <buffer> <leader>w  :w<cr>:!pdflatex %<cr>
augroup END

augroup myaugroup_dcpu
  autocmd!
  autocmd BufRead,BufNewFile *.s set filetype=dcpu
augroup END

augroup myaugroup_javascript
  autocmd!
  autocmd FileType javascript set ts=2 sw=2 et
augroup END

augroup myaugroup_typescript
  autocmd!
  autocmd FileType typescript set ts=2 sw=2 et
augroup END

augroup my_augroup_python
  autocmd!
  autocmd FileType python set ts=4 sw=4 et
augroup END
