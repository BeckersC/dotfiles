"Dependencies
"Vim with +clipbard +xterm-clip compiled. For example vim-gnome; vim-gtk...

"Vundle
set nocompatible
filetype off

"Set runtimepath
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Let Vuundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'https://github.com/vim-scripts/fountain.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'lervag/vimtex'
"let g:vimtex_view_mupdf_send_keys


"Plugin 'xuhdev/vim-latex-live-preview'
"let g:livepreview_previewer = 'mupdf'
"Plugin 'ying17zi/vim-live-latex-preview'

"Syntax highlight
Bundle "Markdown"
Bundle "kblin/vim-fountain"

"Utility
Bundle "repeat.vim"
Bundle "surround.vim"
Bundle "SuperTab"
Bundle "file-line"
Bundle "Align"
Bundle "junegunn/goyo.vim"
Bundle "wellle/targets.vim"

"Color
"Bundle "dylanaraps/wal.vim"
Bundle 'nanotech/jellybeans.vim'
Bundle 'gmarik/ingretu'
Bundle 'Dru89/vim-adventurous'
Bundle 'morhetz/gruvbox'

"END VUUNDLE
call vundle#end() "required

"-----------------------------



filetype plugin indent on
syntax on
set encoding=utf-8
set hlsearch

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

"Gruvbox
colorscheme gruvbox

set background=dark


"set gruvbox_bold
"set gruvbox_italic
"set gruvbox_underline
"set gruvbox_undercurl
"set gruvbox_termcolors
"set gruvbox_contrast_dark
"

"SYNTASTIC
"
let g:syntastic_quiet_messages = { 'regex': 'E501\|E122\|F401'}




set t_Co=256
"colorscheme wal
set laststatus=2

set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list =1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set foldmethod=syntax
set foldlevel=99 " Dont fold anything by default
set tabstop=4 "show existing tab with 4 spaces width
set shiftwidth=4 "when indenting with ">", use 4 spaces width
set expandtab "On pressing tab, insert 4 spaces
set autoindent "keep the same last indentation
set wrap linebreak nolist
set wrapmargin=0
set breakindent "Keep indentation after linewrap
set splitbelow
set splitright
set mouse-=a "Disable mouse
set mousehide "Hide mouse after typing
set backspace=indent,eol,start

autocmd VimEnter * set nofoldenable
autocmd VimEnter * set number 

"Selection
"set clipboard=unnamed
vmap <C-c> "+y<ESC>
vmap <C-x> "+c<ESC>
vmap <C-v> c<ESC>"+p<ESC>
vmap <C-v> <ESC>"+pa<ESC>

"Makros
"Navigating with guides
"inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
map <Space><Space> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

"Controls
"noremap Q :quit<CR>
:command! -bar -bang Q quit<bang>

"""LATEX
"Help with file type recognition
autocmd BufRead,BufNewFile *.tex set filetype=tex

"autocmd FileType tex inoremap <F5> <Esc>:!xelatex<spacE><c-r>%<Enter>i
"autocmd FileType tex nnoremap <F5> :!xelatex<spacE><c-r>%<Enter>
autocmd FileType tex inoremap <F5> <esc>:LLPStartPreview<space><Enter>
autocmd FileType tex nnoremap <F5> <esc>:LLPStartPreview<space><Enter>
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fit \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;fig \begin{figure}<Enter><Enter>\end{figure}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex vnoremap : <ESC>`<i{\<ESC>`>2la}<ESC>?{\\<Enter>la
autocmd FileType tex inoremap {{ <Esc>F{i
autocmd FileType tex inoremap }} <Esc>f}a
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
"autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i
"""EMD

"""Logical Symbols
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;M $$$$<Enter><Enter><++><Esc>2k$hi
autocmd FileType tex inoremap ;neg {\neg}
autocmd FileType tex inoremap ;V {\vee}
autocmd FileType tex inoremap ;or {\vee}
autocmd FileType tex inoremap ;L {\wedge}
autocmd FileType tex inoremap ;and {\wedge}
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;ex {\exists}
autocmd FileType tex inoremap ;dia	{\Diamond}
autocmd FileType tex inoremap ;box	{\Box}
autocmd FileType tex inoremap ;gt	{\textgreater}
autocmd FileType tex inoremap ;lt	{\textless}
"""END

autocmd Filetype tex inoremap ;nom {\textsc{nom}}
autocmd FileType tex inoremap ;acc {\textsc{acc}}
autocmd FileType tex inoremap ;dat {\textsc{dat}}
autocmd FileType tex inoremap ;gen {\textsc{gen}}
autocmd FileType tex inoremap ;abl {\textsc{abl}}
autocmd FileType tex inoremap ;voc {\textsc{voc}}
autocmd FileType tex inoremap ;loc {\textsc{loc}}
autocmd Filetype tex inoremap ;inst {\textsc{inst}}
"""END 

"""PHP
autocmd FileType php,html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ;i <em></em><Space><++><Esc>FeT>i
autocmd FileType php,html inoremap ;h1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType php,html inoremap ;h2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType php,html inoremap ;h3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType php,html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType php,html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType php,html inoremap ;e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType php,html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType php,html inoremap ;li <Esc>o<li></li><Esc>F>a
autocmd FileType php,html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType php,html inoremap ;im <table<Space>class="image"><Enter><caption align="bottom"></caption><Enter><tr><td><a<space>href="pix/<++>"><img<Space>src="pix/<++>"<Space>width="<++>"></a></td></tr><Enter></table><Enter><Enter><++><Esc>4kf>a
autocmd FileType php,html inoremap ;td <td></td><Enter><++><Esc>kf<i
autocmd FileType php,html inoremap ;tr <tr></tr><Enter><++><Esc>kf<i
autocmd FileType php,html inoremap ;th <th></th><Enter><++><Esc>kf<i
autocmd FileType php,html inoremap ;tab <table><Enter></table><Esc>O
autocmd FileType php,html inoremap ;gr <font color="green"></font><Esc>F>a
autocmd FileType php,html inoremap ;rd <font color="red"></font><Esc>F>a
autocmd FileType php,html inoremap ;yl <font color="yellow"></font><Esc>F>a
autocmd FileType php,html inoremap ;dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType php,html inoremap ;dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
autocmd FileType php,html inoremap ;tag <DELRN><Enter><++><Enter></DELRN><Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
""" END

let g:instant_markdown_autostart = 0

"""Markdown
autocmd FileType markdown inoremap <F5> <esc>:!pandoc<space><c-r>%<space>-o<space><c-r>%.pdf<enter>a
autocmd FileType markdown nnoremap <F5> :!pandoc<space><c-r>%<space>-o<space><c-r>%.pdf<enter>
autocmd Filetype markdown inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown inoremap ;b ****<Space><++><Esc>F*hi
autocmd Filetype markdown inoremap ;s ~~~~<Space><++><Esc>F~hi
autocmd Filetype markdown inoremap ;e **<Space><++><Esc>F*i
autocmd Filetype markdown inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ;i ![](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;a [](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;l --------<Enter>
autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>
""" END 


"Close bracket when opening
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i

" Add spellchecker
    " ]s = goto next misstake
    " ]z = suggest alternative
    " zg = add to dictionary
    " zw = remove from dictionary
    "
map <F6> :setlocal spell! spelling=en_US


"MARKDOWN
  autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
  autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
  autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
  autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
  autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
  autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
  autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
  autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
  autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
  autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>--pdf-engine=xelatex<space>-o<space><C-r>%.pdf<Enter><Enter>
  autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
  autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
  autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO


  autocmd FileType rmd inoremap;v <div<space>style="text-align:center"<space>markdown="1"><space><Esc>o<Tab><video<space>width="<++>"<space>height="<++>"<space>controls><space><Esc>o<source<space>src="<++>"<space>type="video/mp4"><Esc>o</div><Esc><<3k<Esc>
