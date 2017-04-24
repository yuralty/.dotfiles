" https://github.com/sontek/dotfiles/
" 
" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" Pyflakes
" Ack
" nose, django-nose

" ==========================================================
" Plugins included
" ==========================================================
" Pathogen => replaced by vundle
"     Better Management of VIM plugins
"
" GunDo
"     Visual Undo in vim with diff's to check the differences
"
" Commant-T => replaced by ctrlp
"     Allows easy search and opening of files within a given path
"
" Snipmate
"     Configurable snippets to avoid re-typing common comands
"
" PyFlakes
"     Underlines and displays errors with Python on-the-fly
"
" Fugitive
"    Interface with git from vim
"
" Surround
"    Allows you to surround text with open/close tags
"
" ==========================================================
" Shortcuts
" ==========================================================
set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

fu! SplitScroll()
    :wincmd v
    :wincmd w
    execute "normal! \<C-d>"
    :set scrollbind
    :wincmd w
    :set scrollbind
endfu

nmap <leader>sb :call SplitScroll()<CR>


"<CR><C-w>l<C-f>:set scrollbind<CR>

" sudo write this
cmap W! w !sudo tee % >/dev/null

" Toggle the tasklist
map <leader>tl :Tlist<CR>

" Run pep8
let g:pep8_map='<leader>8'

" run py.test's
"nmap <silent><Leader>tf <Esc>:Pytest file<CR>
"nmap <silent><Leader>tc <Esc>:Pytest class<CR>
"nmap <silent><Leader>tm <Esc>:Pytest method<CR>
"nmap <silent><Leader>tn <Esc>:Pytest next<CR>
"nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
"nmap <silent><Leader>te <Esc>:Pytest error<CR>

" fugitive shortcuts
nmap <leader>ga :Git add .<CR>
nmap <leader>gc :Gcommit <CR>
nmap <leader>gs :Gstatus <CR>
nmap <leader>gp <Esc>:Git push 
nmap <leader>G <Esc>:Git 

" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" Reload Vimrc
map <silent> <leader>vv :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for jhen we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

map <leader>f :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>jj :CtrlPTag<cr>

" Ack searching
"nmap <leader>A <Esc>:Ack!
nmap <leader>A <Esc>:CtrlSF 

" Load the Gundo window
map <leader>gu :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" yura mappings
" Turn off arrows moving in command mode
"nmap <Left> <Nop>
"nmap <Right> <Nop>
"nmap <Up> <Nop>
"nmap <Down> <Nop>
map <leader>s :w<CR>
nmap <C-n> :call NumberToggle()<CR>

" Use <leader>n/m to switch between tabs
map <leader>z <Esc>:tabprevious <CR>
map <leader>x <Esc>:tabnext <CR>

" Use ctrl+arrows to switch between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" ==========================================================
" Vundle - Allows us to organize our vim plugins
" ==========================================================
" Setup vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Vundle plugin management
Plugin 'gmarik/Vundle.vim'

" Appearence and themes
Plugin 'altercation/vim-colors-solarized'

" File list and search
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'mileszs/ack.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'

" Version control
Plugin 'Gundo'
Plugin 'tpope/vim-fugitive'

" Input aids
Plugin 'The-NERD-Commenter'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
Plugin 'AutoClose'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'

" syntax checker
"Plugin 'scrooloose/syntastic'
"Plugin 'Engspchk'
Plugin 'rhysd/vim-clang-format'

" lang enhance
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'qrps/lilypond-vim'
"Plugin 'pep8'
Plugin 'sukima/xmledit'
Plugin 'mattn/emmet-vim'
Plugin 'mephux/bro.vim'
Plugin 'tomlion/vim-solidity'
Plugin 'vhdirk/vim-cmake'


let g:UltiSnipsExpandTrigger="<c-j>"
let g:ycm_global_ycm_extra_conf='~/.vim/ycm/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
set rtp+=/home/yura/.local/lib/python3.5/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'


let g:clang_format#code_style='google'
autocmd FileType c,cpp,objc nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,cpp,objc ClangFormatAutoEnable


" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
filetype plugin on	      " This makes vim invoke filetype plugins
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
"set background=light           " We are using dark background in vim
"set guifont=Source\ Code\ Pro\ Medium:h15
"set guifont=Inconsolata\ for\ Powerline:h15
set guifont=Hack:13
"set guifont=Sauce\ Code\ Powerline:h15
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set mouse=a                   " Enable mouse

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack


" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
"autocmd FileType * setlocal colorcolumn=0

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set wrap                    " wrap text
set textwidth=78
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.


""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
if has("gui_running")
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T
endif

" Set colors and themes
colorscheme solarized
set background=dark


" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %

" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"

let g:acp_completeoptPreview=1

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css,eruby,tex,ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" Latex
let g:tex_flavor='latex'


" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

function! NumberToggle()
    if (&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

" Set easy motion colors
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade ctermbg=none ctermfg=gray


"if exists("&colorcolumn")
"   set colorcolumn=79
"endif
