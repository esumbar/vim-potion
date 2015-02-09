if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
    " get the bytecode
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    " echo message and return if bytecode reports a syntax error
    if match(bytecode, '\vSyntax error') != -1
	echom bytecode
	return
    endif

    " get the window number of the bytecode buffer
    let bytecode_winnr = bufwinnr("__Potion_Bytecode__")

    if bytecode_winnr == -1
	" open a new split and set it up
	vsplit __Potion_Bytecode__
	setlocal filetype=potionbytecode
	setlocal buftype=nofile
    else
	" move to the existing bytecode window
	execute bytecode_winnr . "wincmd w"
    endif
    normal! ggdG

    " insert the bytecode
    call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <localleader>r :write<cr>:call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :write<cr>:call PotionShowBytecode()<cr>
