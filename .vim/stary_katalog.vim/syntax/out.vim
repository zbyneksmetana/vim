syn match logError /^.*ERR\/\w\w*\/.*$/
syn match logWarning /^.*WRN\/\w\w*\/.*$/
syn match logDebug /^.*DBG\/\w\w*\/.*$/
syn match logInfo /^.*INF\/\w\w*\/.*$/
syn match ccsLog /^.*\(INF\|WRN\|ERR\|DBG\)\/CCS\/.*$/
syn match mydebug /^.*MYDEBUG.*$/

:hi logError ctermfg=red
:hi logWarning ctermfg=yellow
:hi logDebug ctermfg=blue
:hi logInfo ctermfg=blue
:hi link ccsLog NONE
:hi mydebug ctermfg=green
