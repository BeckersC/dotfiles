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
Plugin 'vim-latex/vim-latex'

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

call vundle#end() "required


filetype plugin indent on
syntax on

set t_Co=256
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


"BRACKETS

"Close bracket when opening
:inoremap ( ()<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i


