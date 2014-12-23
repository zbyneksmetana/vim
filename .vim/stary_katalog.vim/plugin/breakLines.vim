function! BreakLines(separators)
    let text = getline('.')
    let cmd = 'indent-text.rb '. shellescape(text) . ' ' . shellescape(a:separators)
    let result = system(cmd)
    call append(line('.'), split(result, '\n'))
    :normal dd
endfunction

vnoremap <F8> :call BreakLines('')<CR>
nnoremap <F8> :call BreakLines('')<CR>
vnoremap <C-F8> :call BreakLines('--no-separators')<CR>
nnoremap <C-F8> :call BreakLines('--no-separators')<CR>
