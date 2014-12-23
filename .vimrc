syntax on
au BufRead,BufNewFile *.ttcn* set filetype=ttcn
au! Syntax ttcn source ~/.vim/syntax/ttcn.vim
au BufRead,BufNewFile *.out* set filetype=out
au! Syntax out source ~/.vim/syntax/out.vim
let g:ttcn_hl_naming_convention = 1

if has("win32") " WINDOWS CONFIG
    set encoding=cp1250
    set noswapfile
else " LINUX CONFIG
    " Pathogen
   " execute pathogen#infect()
   " call pathogen#helptags()

    " NERDTree
   " nnoremap <F1> :NERDTreeToggle<CR>

    " Other
    set dictionary+=/usr/share/dict/words
    set path=.,,**
endif

if has("gui_running") " GUI CONFIG
    set mouse=""
    set guioptions=aci
    colorscheme ron
endif

syntax on

set autoindent
set backspace=2

set ts=4
set sts=4
set sw=4
set expandtab

set nowrap
set linebreak
" this option is useful with smart word wrap, but it disables showing trail spaces
" set nolist

set number
set list
set listchars=trail:_,tab:>-

set incsearch
set hlsearch
set ignorecase
set smartcase

"przemapowanie klawisza * aby nie skakal do nastepnej pozycji tylko
"podswietlal aktualna pozycje
nnoremap *  *``

set encoding=utf-8

:nnoremap <silent><leader>] <C-w><C-]><C-w>T



"tagi dodane

"set tags=$SVN_PROJECT_ROOT/lteDo/Tags/tags
"set tags+=$SVN_PROJECT_ROOT/lteDo/Tags/tags_ttcn3
"set tags+=$SVN_PROJECT_ROOT/lteDo/Tags/tags_ut
"nnoremap <C-t> <C-O>
"nnoremap t :exec("tag ".expand("<cword>"))<CR>


"tagi inne


" get a projectroot
 let projectroot = substitute(getcwd(), '/\(C_Application\|C_Test\|ECL\|E_External\|I_Interface\|logs\|lteDo\|lteTools\)\(/.*\)\?$', "", "g")
    execute "set tags+=".projectroot."/lteDo/Tags/tags"
      execute "set tags+=".projectroot."/lteDo/Tags/tags_ut"
        execute "set tags+=".projectroot."/lteDo/Tags/tags_ttcn3"
          nnoremap <C-t> <C-O>
            nnoremap t :exec("tag ".expand("<cword>"))<CR>
           " nnoremap t  g<C-]>




"Dodatkowa prywatna konfiguracja

syntax on
filetype plugin indent on


"plugin pathogen 
        execute pathogen#infect()
        call pathogen#helptags()


"plugin airline
        set t_Co=256
        set laststatus=2


"plugin ctrlp-filetype.vim -  CtrlP for filetype
        let g:ctrlp_extensions = ['filetype']
        silent! nnoremap <unique> <silent> <Leader>f :CtrlPFiletype<CR>

        "ustawienie wyszukiwania w zasadzie nieograniczonej glebokosci drzewa
        let g:ctrlp_max_files=0
        let g:ctrlp_max_depth=40

        "ustawienie za pomoca wyszukiwania regexp
        let g:ctrlp_regexp = 1

        "ustawieni wyszukiwania tylko nazw plikow a nie sciezek wyszukiwania
        let g:ctrlp_by_filename = 1


"plugin NErdtree
        "ustaw odswierzanie Nerdtree na klawisz \r
         map <leader>r :NERDTreeFind<cr>
         map <F1> :NERDTreeToggle<cr>

"do opcji wyszukiwania w tekscie za pomoca klawisza /
        set hlsearch
        set hlsearch
        set ignorecase
        set smartcase

"do likwidowania podswietlania po wyszukaniu tekstu za pomocą /
        map  <C-l> :nohl<CR>

"opcja wcinania tekstu  po enterze
        set autoindent

"dzialanie backspace-a
        set backspace=2

"zamiana tabów na spacje
        set ts=4
        set sts=4
        set sw=4
        set expandtab

"numerowanie linni
        set number

"włączenie myszki na stałe
        set mouse=a

"kolorowanie aktualnej linni
        set cursorline
        hi CursorLine cterm=NONE ctermbg=236

"plugin youcompleteme
        "plik configuracyjny do pakietu,  jak go nie ma to krzyczy o jakiejs
        "fladze ... chyba istotny  jest tylko w przypadku kompilacji
        let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
        "wylaczenie podswietlania potencjalnych bledow
        let g:ycm_enable_diagnostic_highlighting = 0
        let g:ycm_enable_diagnostic_signs = 0
        
        " make YCM compatible with UltiSnips (using supertab)
         let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
         let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
         let g:SuperTabDefaultCompletionType = '<C-n>'

" plugin supertab
        "umozliwienie uzywania TABA w pluginie ultisnips z pluginem
        "youcompleteme
        let g:SuperTabDefaultCompletionType = '<C-n>'

"plugin ultisnips
        let g:UltiSnipsExpandTrigger="<TAB>"
        let g:UltiSnipsJumpForwardTrigger="<TAB>"
        let g:UltiSnipsJumpBackwardTrigger="<s-TAB>"


"plugin vim-bookmark
       """ let g:bookmark_highlight_lines = 1


