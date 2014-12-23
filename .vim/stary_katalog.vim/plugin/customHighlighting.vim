function! CustomHighlight(tName, tTerm, tColor)
    try
        execute 'syn clear ' . a:tName
    catch
    endtry

    execute 'syn match ' . a:tName . ' /\<' . expand("<cword>") . '\>/'
    execute 'hi ' . a:tName . ' term=' . a:tTerm . ' ctermfg=' . a:tColor . ' ctermbg=0'
endfunction

map <leader>1 :call CustomHighlight("custom1", "bold", "green")<CR>
map <leader>2 :call CustomHighlight("custom2", "bold", "blue")<CR>
map <leader>3 :call CustomHighlight("custom3", "bold", "yellow")<CR>
map <leader>4 :call CustomHighlight("custom4", "bold", "magenta")<CR>
map <leader>5 :call CustomHighlight("custom5", "bold", "cyan")<CR>
