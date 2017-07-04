set nocompatible              " be iMproved, required
filetype off " required 

" set the runtime path to include Vundle and initialize 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc() 
" " alternatively, pass a path where Vundle should install plugins 
" "let path = '~/some/path/here' 
" "call vundle#rc(path) 
" 
" " let Vundle manage Vundle, required 
Plugin 'gmarik/vundle' 

" The following are examples of different formats supported. 
" Keep Plugin commands between here and filetype plugin indent on. 
"----------------- scripts on GitHub repos--------------------------------- 
" Plugin 'tpope/vim-fugitive' 
" Plugin 'Lokaltog/vim-easymotion' 
" Plugin 'tpope/vim-rails.git' 
Plugin 'https://github.com/scrooloose/nerdtree.git' 
" uncomment the following line after you install YouCompleteMe manually
Plugin 'https://github.com/Valloric/YouCompleteMe.git' 

Plugin 'https://github.com/scrooloose/syntastic.git' 
Plugin 'https://github.com/scrooloose/nerdcommenter.git' 

"for lua support 
Plugin 'https://github.com/xolox/vim-misc.git' 
Plugin 'https://github.com/xolox/vim-lua-ftplugin.git' 

"nginx support
Plugin 'https://github.com/fatih/vim-nginx'

" The sparkup vim script is in a subdirectory of this repo called vim. 
" Pass the path to set the runtimepath properly. 
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'} 
"----------------- scripts from http://vim-scripts.org/vim/scripts.html---
" Plugin 'L9' 
" Plugin 'FuzzyFinder' 
Plugin 'taglist.vim' 

"bufexplorer
Plugin 'jlanzarotta/bufexplorer'

"go support 
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

"tagbar 
Plugin 'majutsushi/tagbar' 

"ack vim
Plugin 'mileszs/ack.vim'

"------------------ scripts not on GitHub--------------------------------- 
" Plugin 'git://git.wincent.com/command-t.git' 
"------- git repos on your local machine (i.e. when working on your own plugin)----- 
" Plugin 'file:///home/gmarik/path/to/plugin' 
" ... 

filetype plugin indent on " required 
" To ignore plugin indent changes, instead use: 
" filetype plugin on 
" 
" Brief help 
" :PluginList - list configured plugins 
" :PluginInstall(!) - install (update) plugins 
" :PluginSearch(!) foo - search (or refresh cache first) for foo 
" :PluginClean(!) - confirm (or auto-approve) removal of unused plugins 
" 
" see :h vundle for more details or wiki for FAQ 
" NOTE: comments after Plugin commands are not allowed. 
" Put your stuff after this line 
" 


" An example for a vimrc file. 
" 
" Maintainer:    Bram Moolenaar <Bram@vim.org> 
" Last change:    2011 Apr 15 
" 
" To use it, copy it to 
" for Unix and OS/2: ~/.vimrc 
"     for Amiga: s:.vimrc 
" for MS-DOS and Win32: $VIM\_vimrc 
"     for OpenVMS: sys$login:.vimrc 

" When started as "evim", evim.vim will already have done these settings. 
if v:progname =~? "evim" 
finish 
endif 

" Use Vim settings, rather than Vi settings (much better!). 
" This must be first, because it changes other options as a side effect. 
set nocompatible 

" allow backspacing over everything in insert mode 
set backspace=indent,eol,start 

if has("vms") 
set nobackup     " do not keep a backup file, use versions instead 
else 
set backup     " keep a backup file 
endif 
set history=50     " keep 50 lines of command line history 
set ruler     " show the cursor position all the time 
set showcmd     " display incomplete commands 
set incsearch     " do incremental searching 

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries 
" let &guioptions = substitute(&guioptions, "t", "", "g") 

" Don't use Ex mode, use Q for formatting 
map Q gq 

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo, 
" so that you can undo CTRL-U after inserting a line break. 
inoremap <C-U> <C-G>u<C-U> 

" In many terminal emulators the mouse works just fine, thus enable it. 
if has('mouse') 
"set mouse=a 
endif 

" Switch syntax highlighting on, when the terminal has colors 
" Also switch on highlighting the last used search pattern. 
if &t_Co > 2 || has("gui_running") 
syntax on 
set hlsearch 
endif 

" Only do this part when compiled with support for autocommands. 
if has("autocmd") 

" Enable file type detection. 
" Use the default filetype settings, so that mail gets 'tw' set to 72, 
" 'cindent' is on in C files, etc. 
" Also load indent files, to automatically do language-dependent indenting. 
filetype plugin indent on 

" Put these in an autocmd group, so that we can delete them easily. 
augroup vimrcEx 
au! 

" For all text files set 'textwidth' to 78 characters. 
autocmd FileType text setlocal textwidth=78 

" When editing a file, always jump to the last known cursor position. 
" Don't do it when the position is invalid or when inside an event handler 
" (happens when dropping a file on gvim). 
" Also don't do it when the mark is in the first line, that is the default 
" position when opening a file. 
autocmd BufReadPost * 
\ if line("'\"") > 1 && line("'\"") <= line("$") | 
\ exe "normal! g`\"" | 
\ endif 

augroup END 

else 

set autoindent     " always set autoindenting on 

endif " has("autocmd") 

" Convenient command to see the difference between the current buffer and the 
" file it was loaded from, thus the changes you made. 
" Only define it when not defined already. 
if !exists(":DiffOrig") 
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis 
\ | wincmd p | diffthis 
endif 

"added by chenkunyun 
set nu 
syntax on 
set ruler 
set nocompatible 
set syntax=on 
set autoindent 
set cindent 
set tabstop=4 
set sw=4 
set ignorecase 
set hlsearch 
set incsearch 
filetype on 
filetype plugin on 
filetype indent on 
set smartindent 
filetype plugin indent on 
set backspace=2 
set expandtab 

"taglist 
nnoremap <silent> <F8> :TlistToggle<CR> 
let Tlist_Auto_Open=1 
let Tlist_Auto_Highlight_Tag=1 

"BufferExplorer 
noremap <silent> ,be :BufExplorer<CR> 

"NERDTree 
noremap <silent> <C-F8> :NERDTreeToggle<CR> 
let NERDTreeShowHidden=1 

"YouCompleteMe 
nnoremap ;gl :YcmCompleter GoToDeclaration<CR> 
nnoremap <F12> :YcmCompleter GoToDefinition<CR> 
nnoremap ;gg :YcmCompleter GoToDefinitionElseDeclaration<CR> 
nmap <F4> :YcmDiags<CR> 

let g:ycm_autoclose_preview_window_after_completion=1 
let g:ycm_autoclose_preview_window_after_insertion=1 
"specifies a fallback path to a config file which is used if no 
".ycm_extra_conf.py is found 
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' 

"nerdcommenter 
"map:Normal, Visual and Operator-pending 
"let mapleader=","
map <Space> \c<Space>

" ag support
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
"如果找不到memory, string,iostream等c++头文件，则加入以下行,详情输入:help path
set path=.,path1,path2,path3
set vb t_vb=

set nobackup     " do not keep a backup file, use versions instead 

