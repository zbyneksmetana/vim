function! FindTagsImpl(dir, level)
    if (a:level < 10)
        let findResult = system('find ' . a:dir . ' -maxdepth 1 -name ''tags''')
        let foundFiles = split(findResult, '\n')
        if (len(foundFiles) >= 1)
            execute 'set tags=' . substitute(foundFiles[0], '^./', '', 'g')
        else
            call FindTagsImpl(a:dir . '/..', a:level + 1)
        endif
    endif
endfunction

com! FindTags :call FindTagsImpl(expand('%:h'), 0)
execute ':FindTags'
