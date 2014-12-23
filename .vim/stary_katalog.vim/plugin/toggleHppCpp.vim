function! GetSwitchedName(fileName)
    let result = ''
    if (match(a:fileName, "\.cpp$") >= 1)
        let result = substitute(a:fileName, "cpp", "hpp", "g")
    elseif (match(a:fileName, "\.hpp$") >= 1)
        let result = substitute(a:fileName, "hpp", "cpp", "g")
    end
    return result
endfunction

function! EscapeSpaces(fileName)
    return substitute(a:fileName, ' ', '\\ ', 'g')
endfunction

function! ToggleHppCpp(dir, level)
    let currentFile = expand('%:t')
    let switchedName = GetSwitchedName(currentFile)
    let findResult = system('find ' . shellescape(a:dir) . ' -name ''' . switchedName . '''')
    let foundFiles = split(findResult, "\n")

    if (len(foundFiles) > 1)
        echo 'found more than one file'
    endif

    if (len(foundFiles) >= 1)
        let buf = bufname(foundFiles[0])
        if (buf == '')
            execute 'edit ' . EscapeSpaces(foundFiles[0])
        else
            execute 'b ' . EscapeSpaces(buf)
        endif
    elseif (len(foundFiles) == 0 && a:level <= 1)
        call ToggleHppCpp(a:dir . '/..', a:level + 1)
    endif
endfunction

nnoremap <F4> :call ToggleHppCpp(expand('%:h'), 0)<CR>
