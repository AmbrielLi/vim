set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" -----------------------------------------------------------------------------------------------------------
" -- Plugins
" ----------------------------------------------------------------------------------------------------------- 

" vim-go
Plugin 'fatih/vim-go'

" Debugger GDB
Plugin 'vim-scripts/Conque-GDB'

let g:ConqueTerm_Color = 2                                                            
let g:ConqueTerm_CloseOnEnd = 1                                                       
let g:ConqueTerm_StartMessages = 0                                                    
                                                                                      
function DebugSession()                                                               
    silent make -o vimgdb -gcflags "-N -l"                                            
    redraw!                                                                           
    if (filereadable("vimgdb"))                                                       
        ConqueGdb vimgdb                                                              
    else                                                                              
        echom "Couldn't find debug file"                                              
    endif                                                                             
endfunction                                                                           

function DebugSessionCleanup(term)                                                    
    if (filereadable("vimgdb"))                                                       
        let ds=delete("vimgdb")                                                       
    endif                                                                             
endfunction                                                                           
call conque_term#register_function("after_close", "DebugSessionCleanup")              
nmap <leader>d :call DebugSession()<CR>;   

" SimpylFold
Plugin 'tmhedberg/SimpylFold'

" Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'

" Auto-complete
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Virtualenv
Plugin 'jmcantrell/vim-virtualenv'

" Syntax Checking/Highlighting
Plugin 'scrooloose/syntastic'

" PEP8 Checking
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

" Color Schemes
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" File Browsing
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd vimenter * NERDTree

" Tabs
Plugin 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreetTabsToggle<CR>

" Super Searching
Plugin 'kien/ctrlp.vim'

" Git integration
Plugin 'tpope/vim-fugitive'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -----------------------------------------------------------------------------------------------------------
" -- Common settings
" -----------------------------------------------------------------------------------------------------------
" Show line number
set nu

" System clipboard
set clipboard=unnamed

" UTF-8 Support
set encoding=utf-8

" Split naviagtions
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable fold with spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

