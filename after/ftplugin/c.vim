autocmd Filetype c set ts=8 sts=8 sw=8 noet
autocmd Filetype c noremap <buffer> <localleader>s        :SyntasticCheck gcc<cr>:Errors<cr>
