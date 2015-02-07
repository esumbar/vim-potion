setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! NextNonBlankLine(lnum)
    let numlines = line('$')
    let current = a:lnum + 1

    while current <= numlines
	if getline(current) =~? '\v\S'
	    return current
	endif

	let current += 1
    endwhile

    return -2
endfunction

function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction

function! GetPotionFold(lnum)
    if getline(a:lnum) =~? '\v^\s*$'
	return '-1'
    endif

    return '0'
endfunction
