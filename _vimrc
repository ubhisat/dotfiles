set nocompatible
syntax on
let mapleader=","
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
let g:vundle_default_git_proto = 'git'

" The bundles you install will be listed here
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/CSApprox'


filetype plugin indent on
set number                    " Display line numbers                           
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim            
" set title                     " show title in console title bar                
set wildmenu                  " Menu completion in command mode on <Tab>       
set wildmode=full             " <Tab> cycles between all matching choices.   

""" Moving Around/Editing                                                      
" set cursorline              " have a line indicate the cursor location       
set ruler                   " show the cursor position all the time            
set nostartofline           " Avoid moving cursor to BOL when jumping around   
set virtualedit=block       " Let cursor move past the last char in <C-v> mode 
set scrolloff=3             " Keep 3 context lines above and below the cursor  
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL  
set showmatch               " Briefly jump to a paren once it's balanced       
set nowrap                  " don't wrap text                                  
set linebreak               " don't wrap textin the middle of a word           
set autoindent              " always set autoindenting on                      
set smartindent             " use smart indent if there is no indent file      
set tabstop=4               " <tab> inserts 4 spaces-                          
set shiftwidth=4            " but an indent level is 2 spaces wide.            
set softtabstop=4           " <BS> over an autoindent deletes both spaces.     
set expandtab               " Use spaces, not tabs, for autoindent/tab key.    
set shiftround              " rounds indent to a multiple of shiftwidth        
set matchpairs+=<:>         " show matching <> (html mainly) as well           
set foldmethod=manual       " allow us to fold on indents                      
set foldlevel=99            " don't fold by default                            
                                                                               
" don't outdent hashes                                                         
inoremap # #                                                                   

"""" Reading/Writing                                                           
set noautowrite             " Never write a file unless I request it.          
set noautowriteall          " NEVER.                                           
set noautoread              " Don't automatically re-read changed files.       
set modeline                " Allow vim options to be embedded in files;       
set modelines=5             " they must be within the first or last 5 lines.   
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings. 
                                                                               
"""" Messages, Info, Status                                                    
" set ls=2                    " allways show status line                         
" set laststatus=2            " Always show statusline, even if only 1 window.   
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.     
set confirm                 " Y-N-C prompt if closing with unsaved changes.    
set showcmd                 " Show incomplete normal mode commands as I type.  
set report=0                " : commands always print changed line count.      
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.  
set ruler                   " Show some info, even without statuslines.        
" set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()} 

""" Searching and Patterns                                                     
set ignorecase              " Default to using case insensitive searches,      
set smartcase               " unless uppercase letters are used in the regex.  
set smarttab                " Handle tabs more intelligently-                  
set hlsearch                " Highlight searches by default.                   
set incsearch               " Incrementally search while typing a /regex       
                                                                               
"""" Display                                                                   
set t_Co=256                    

" Quit window on <leader>q                                                     
nnoremap <leader>q :q<CR>                                                      
                                                                               
" hide matches on <leader>space                                                
nnoremap <leader><space> :nohlsearch<cr>                                       
                                                                               
" Remove trailing whitespace on <leader>S                                      
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>   
:autocmd InsertEnter,InsertLeave * set cul!                          


augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9

map <leader>n :NERDTreeToggle<CR>

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
syntax on

" Don't autofold code
let g:pymode_folding = 0

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬

" automatically change window's cwd to file's dir
set autochdir

" more subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif

nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>
" Ack searching                                                                
nmap <leader>a <Esc>:Ack!
let g:jedi#related_names_command = "<leader>N"
colorscheme navajo
