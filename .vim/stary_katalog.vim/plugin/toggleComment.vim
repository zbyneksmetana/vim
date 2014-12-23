function! ToggleComment(ext)
    let line = getline('.')
    let com = ''
    if (a:ext == 'cpp' || a:ext == 'hpp' || a:ext == 'c' || a:ext == 'h' || a:ext == 'ttcn3' || a:ext == 'cs')
        let com = '//'
    elseif (a:ext == 'rb' || a:ext == 'py')
        let com = '#'
    elseif (a:ext == 'vim')
        let com = '"'
    endif

    if (com != '')
        if (match(line, '^\s*' . com) >= 0)
            call setline('.', substitute(line, '^\(\s*\)' . com, '\1', 'g'))
        else
            call setline('.', com . line)
        endif
    end
endfunction

vnoremap <C-C> :call ToggleComment(expand('%:e'))<CR>
nnoremap <C-C> :call ToggleComment(expand('%:e'))<CR>
