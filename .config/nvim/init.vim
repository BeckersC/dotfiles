call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'https://github.com/vim-syntastic/syntastic.git'

call plug#end()

autocmd VimEnter * set number
autocmd VimEnter * set nofoldenable

set laststatus=2

"Theme
set termguicolors
set background=dark
set t_Co=256

colorscheme gruvbox
let g:gruvbox_italic = '1'
let g:gruvbox_contrast_dark = 'medium'

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


"Syntastic
let g:syntastic_quiet_messages = { 'regex': 'E501\|E122\|F401'}
let g:syntastic_always_populate_loc_list =1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


map <F6> :setlocal spell! spelling=en_US

"Close bracket when opening
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i

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

"""PHP
autocmd FileType html,xhtml,css,php inoremap ;b   <b></b><Space><++><Esc>FbT>i
autocmd FileType html,xhtml,css,php inoremap ;i   <em></em><Space><++><Esc>FeT>i
autocmd FileType html,xhtml,css,php inoremap ;h1  <h1><++></h1><Enter><Enter><++><Esc>2kf<Esc>
autocmd FileType html,xhtml,css,php inoremap ;h2  <h2><++></h2><Enter><Enter><++><Esc>2kf<Esc>
autocmd FileType html,xhtml,css,php inoremap ;h3  <h3><++></h3><Enter><Enter><++><Esc>2kf<Esc>
autocmd FileType html,xhtml,css,php inoremap ;p   <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType html,xhtml,css,php inoremap ;a   <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html,xhtml,css,php inoremap ;e   <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType html,xhtml,css,php inoremap ;ul  <ul><Enter><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType html,xhtml,css,php inoremap ;ol  <ol><Enter><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType html,xhtml,css,php inoremap ;li  <Esc>o<li></li><enter><enter><++><Esc>2kf<i
autocmd FileType html,xhtml,css,php inoremap ;im  <table<Space>class="image"><Enter><caption align="bottom"></caption><Enter><tr><td><a<space>href="pix/<++>"><img<Space>src="pix/<++>"<Space>width="<++>"></a></td></tr><Enter></table><Enter><Enter><++><Esc>4kf>a
autocmd FileType html,xhtml,css,php inoremap ;td  <td></td><Enter><++><Esc>kf<i
autocmd FileType html,xhtml,css,php inoremap ;tr  <tr></tr><Enter><++><Esc>kf<i
autocmd FileType html,xhtml,css,php inoremap ;th  <th></th><Enter><++><Esc>kf<i
autocmd FileType html,xhtml,css,php inoremap ;tab <table><Enter></table><Esc>O
autocmd FileType html,xhtml,css,php inoremap ;gr  <font color="green"></font><Esc>F>a
autocmd FileType html,xhtml,css,php inoremap ;rd  <font color="red"></font><Esc>F>a
autocmd FileType html,xhtml,css,php inoremap ;yl  <font color="yellow"></font><Esc>F>a
autocmd FileType html,xhtml,css,php inoremap ;dt  <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType html,xhtml,css,php inoremap ;dl  <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
autocmd FileType html,xhtml,css,php inoremap ;tag <DELRN><Enter><++><Enter></DELRN><Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType html,xhtml,css,php inoremap ;div <div><Esc>o<++><Esc>o</div><Esc>o<++><Esc>k<Space><Space>
""" END

