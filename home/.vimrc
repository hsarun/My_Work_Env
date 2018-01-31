
" Use Vim settings, rather then Vi settings (much better!).
" " This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/ctags.vim--Johnson'
Plugin 'vim-scripts/MultipleSearch'
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'antiAgainst/cscope-macros.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'justinmk/vim-sneak'
Plugin 'edsono/vim-matchit'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/python_match.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jeetsukumaran/vim-buffersaurus'
Plugin 'vim-scripts/vimtabs.vim'
Plugin 'flazz/vim-colorschemes'

" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

"Plugin 'vim-scripts/ShowFunc.vim'
"Plugin 'sjl/clam.vim'                         "Clam shellcmd
"Plugin 'vim-scripts/OmniCppComplete'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'vim-scripts/CursorLineCurrentWindow'
"Plugin 'bling/vim-airline'
"Plugin 'majutsushi/tagbar'                    "Enables the c-function names with g:airline#extensions#tagbar#enabled below.
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'rking/ag.vim'
"Plugin 'maxbrunsfeld/vim-yankstack'
"Plugin 'tarmolov/TabLineNumbers.vim'
"Plugin 'Shougo/vimproc.vim'
"Plugin 'Shougo/vimshell.vim'
"Plugin 'trapd00r/neverland-vim-theme'
"Plugin 'vim-scripts/AnsiEsc.vim'
"Plugin 'ofavre/vimcat.git'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'ujihisa/tabpagecolorscheme'
"Plugin 'scrooloose/nerdcommenter'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" set nocompatible


set autoindent
set expandtab
set fileformats=unix,dos,mac
set shiftwidth=4
set showmatch
set softtabstop=4
set tabstop=8
set ttyfast
set undolevels=0
set visualbell
set wrap
set incsearch       " do incremental searching
set number
set ic
set ls=2
set undolevels=1000
syntax on

" colorscheme desertEx
colorscheme phd 

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  " colorscheme wombat
  " colorscheme koehler
  " colorscheme ir_black
  " colorscheme colorer
  " colorscheme desertEx
  " colorscheme freya
  " colorscheme golden
  " colorscheme hhspring
  " colorscheme inkpot
  " colorscheme manxome
  " colorscheme marklar
  " colorscheme matrix
  " colorscheme railscasts
  " colorscheme rdark
  " colorscheme robinhood
  " colorscheme sienna
  " colorscheme spring
  " colorscheme tabula
  " colorscheme tango2
  " colorscheme umber-green
  " colorscheme vividchalk
  " colorscheme xemacs
  colorscheme phd 
endif

set splitright

set tags=tags

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "


    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>  

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR> 


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>   
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

"Key Mappings for cscope
"source  ~/.vim/plugin/cscope_maps.vim

"Key Mappings for quickfix
"set cscopequickfix=s-,c-,d-,i-,t-,f-,e-
":map <C-Up> :cope 15<CR>
":map <C-Down> :ccl<CR>
":map <C-Right> :cn<CR>
":map <C-Left> :cp<CR>

"Key Mappings for BufExplorer - To work on multiple buffers in the same VIM window
"let bufExplorerOpenMode=1
"let bufExplorerSplitBelow=1
"let bufExplorerSplitHorzSize=10
":map <S-Right> :bnext<CR>
":map <S-Left>  :bprev<CR>
":map <S-Up>  \bs


"SHIFT-Insert are Paste
nmap <S-Insert>        "+gP
imap <S-Insert>        <ESC><S-Insert>i

"vim-fugitive plugin command - To see git diff of a file type :<F9> in vim
:cmap <F9> :tabnew %\|Gdiff<CR>

"Added by Lakshman Kumar
if has("win32unix")
    let g:showfuncctagsbin="/usr/local/timostools/ctags"
else
"    let g:showfuncctagsbin="/home/udayakut/software/ctags/ctags-5.8/installed_binaries/bin/ctags"
    let g:showfuncctagsbin="/usr/bin/ctags"
endif
let g:ctags_statusline=1
let g:ctags_title=0
let generate_tags=1

"To copy vbox centos vm to windows clipboard
function! DumpToClipBoard()
    "call writefile(split(@","\n"), '/dev/clipboard')
    call system("xsel -i -b", getreg("\""))
endfunction

map <Leader>clip :call DumpToClipBoard()<CR>
vmap <C-c> y:call DumpToClipBoard()<CR>

if has("win32unix")
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 13
endif

