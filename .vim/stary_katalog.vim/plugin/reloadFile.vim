function! ReloadFile()
    let fileName = expand('%:p')
    silent! execute 'o! ' . fileName
endfunction

nnoremap <F5> :call ReloadFile()<CR>
