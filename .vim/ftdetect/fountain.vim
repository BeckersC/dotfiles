au BufRead,BufNewFile *.fountain set filetype=fountain
au BufRead,BufNewFile *.fountain set binary
au BufRead,BufNewFile *.fountain set noeol
au BufRead *.fountain %s/^Draft date: .*$/\=strftime("Draft date: %m\/%d\/%Y")/
