set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'  " Vundle itself
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim' " Silver Searcher
Plugin 'editorconfig/editorconfig-vim'  " editorconfig for vim
" Plugin 'rizzatti/dash.vim'  " Dash integration
Plugin 'jtratner/vim-flavored-markdown'  " Github markdown
Plugin 'AndrewRadev/linediff.vim'  " Diff two blocks of text
Plugin 'tpope/vim-endwise' " Ruby end blocks
Bundle 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'  " Linter
Plugin 'jelera/vim-javascript-syntax'  " better javascript syntax
Plugin 'shutnik/jshint2.vim'  " JShint integration
" Plugin 'derekwyatt/vim-scala'  " Scala stuff
" Plugin 'raichoo/haskell-vim'  " Haskell syntax

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
Plugin 'romainl/Apprentice'
Plugin 'whatyouhide/vim-gotham'
Plugin 'NLKNguyen/papercolor-theme'  " Nice light theme
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'Junza/Spink'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" ---- General settings --- "
set listchars=tab:>-,trail:~,extends:>,precedes:<  " Show tab chars
set list
set number  " Print with line numbers?
set linebreak  " Breaks at special chars, not in the middle of words
set nowrap  " No word wrap
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=2
set autoindent
set backspace=indent,eol,start
set ruler  " Show line and column number
set showcmd
set gdefault  " Search globaly by default
set hidden  " Allow buffer switching without save
set nostartofline  " Don't move back to column 0 if possible
set textwidth=0  " Turn off auto line break
set wrapmargin=0  " Turn off auto line break
set autoread  " Auto reload changed files
set noswapfile
set nobackup
set ignorecase  " Ignore case in search by default
set smartcase  " Use case sentive when contains caps

syntax enable
set t_Co=256
set anti  " Turn off anti-aliasing

set linespace=3  " Line spacing
set guifont=Menlo:h12 " Set the font family and the font size
set background=dark
if has("gui_running")
    set lines=999 columns=999  " Maximize window
    set guioptions-=T
    colorscheme ron
else
    colorscheme ron
endif

set tags=./tags,tags;$HOME  " Should find tags files now?

set statusline =%1*\ %n\ %*            "buffer number
set statusline +=\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

hi User1 guifg=#de3b74  guibg=#1c1d1f gui=bold

" ---- Key bindings ---- "
" Ditch ex mode
noremap Q <nop>

" Spacebar for President
nnoremap <space> <nop>
let mapleader = "\<space>"

" Buffer navigation
map <leader>b :buffers<CR>:buffer<space>
map <leader>l :bnext<CR>
map <leader>h :bprev<CR>

" Open ctrlP in buffer mode, then search names only (<C-D>)
nnoremap <C-b> :CtrlPBuffer<CR><C-d><CR>

" clear search history
nnoremap <CR> :noh<CR><CR>

map <leader>d <Plug>DashSearch
map <leader>w :w<CR>
map <leader>e :Lexplore<CR>
map <leader>v :vsplit<CR><C-^>
map <leader>p "*p<CR>
map <leader>y "*y<CR>

" Replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
vnoremap <Leader>' :s/"/'<CR>

" Completion in insert mode
imap <C-j> <C-p>

" Simplify window resizing
" Small changes
nnoremap <S-Up> <c-w>>
nnoremap <S-Down> <c-w><
" Big jumps
nnoremap <S-Left> :exe "vertical resize " . (winwidth(0) * 5/6)<CR>
nnoremap <S-Right> :exe "vertical resize " . (winwidth(0) * 6/5)<CR>

" Resize window to ~ 80 cols
map <F8> :vertical resize 83<CR>

" Spam jk to exit to Normal Mode
imap jk <ESC>
imap kj <ESC>

" Edit .vimrc in a new vsplit
nmap ,v :vsp $MYVIMRC<CR>

" ---- Autocommands ---- "
autocmd FileType javascript setl colorcolumn=0 " Allow long lines in JS
autocmd FileType python setl colorcolumn=80
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

" Expand tabs in Python
au BufRead, BufNewFile *.py set expandtab
au BufRead, BufNewFile Makefile* set noexpandtab

" Autoreload .vimrc if it changes:
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.mkd,*.markdown setlocal filetype=ghmarkdown
augroup END


" Error on trailing whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=#999999
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" ---- Plugin settings ---- "

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']

" Ctrl-P
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Explore
let g:netrw_liststyle=3
let g:netrw_winsize=15

" Nerdtree
" Close if last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

