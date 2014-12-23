function! Grep2(text, options)
   let fileName = expand('%:p')
   let result = system('grep ' . shellescape(a:text) . ' ' . shellescape(fileName) . ' ' . a:options)
   :normal ggdG
   call setline(line('.'), split(result, '\n'))
endfunction

function! Grep1(text)
    call Grep2(a:text, '-iEa')
endfunction

nnoremap <F7> :call Grep2(expand('<cword>'), "-a")<CR>
nnoremap <C-F7> :call Grep2(expand('<cword>'), "-va")<CR>
