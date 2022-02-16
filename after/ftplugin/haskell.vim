setlocal ts=4 sts=4 sw=4 et
noremap <buffer> <localleader>si  :!stack ghci<cr>
noremap <buffer> <localleader>sc  :!stack ghc %<cr>
noremap <buffer> <localleader>gi  :!ghci %<cr>
noremap <buffer> <localleader>gc  :!ghc %<cr>
noremap <buffer> <localleader>w   :w<cr>:!ghc %<cr>
noremap <buffer> <localleader>c   :GhcModCheckAndLintAsync<cr>
noremap <buffer> <localleader>fs  :GhcModSplitFunCase<cr>
noremap <buffer> <localleader>i   :GhcModInfo<cr>
noremap <buffer> <localleader>sc  :GhcModSigCodegen<cr>
