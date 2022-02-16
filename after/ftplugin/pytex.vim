noremap <buffer> <localleader>c  :call PdfLatex()<cr>
noremap <buffer> <localleader>w  :w<cr>:call PdfLatex()<cr>
noremap <buffer> <localleader>cl :hi clear Conceal<cr>
noremap <buffer> <localleader>se :call ToggleShellEscape()<cr>
let b:shell_escape = 0
