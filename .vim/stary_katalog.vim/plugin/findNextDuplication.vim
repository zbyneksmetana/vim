function! FindNextDuplication()
    let fileName = expand('%:p')
    let result = system('find-duplicates.rb ' . shellescape(line('.')-1) . ' ' . shellescape(fileName))
    let values = split(result, ' ')

    if len(values) > 1
        echo 'Longest match is ' . values[0] . ' lines long'

        let i = 1
        while i < len(values)
            if values[i]+1 > line('.')
                call setpos('.', [ 0, values[i]+1, 0, 0])
                return
            endif
            let i = i + 1
        endwhile

        let i = 1
        while i < len(values)
            if values[i]+1 < line('.')
                call setpos('.', [ 0, values[i]+1, 0, 0])
                return
            endif
            let i = i +1
        endwhile
    else
        echo 'Nothing matches current line!'
    endif
endfunction

nnoremap <F6> :call FindNextDuplication()<CR>
