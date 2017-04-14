execute pathogen#infect()
filetype plugin indent on

if &term =~ "xterm-256color" 
  set t_Co=256 
  set background=dark
  colorscheme xoria256
endif 

if has("gui_macvim")
  set fuopt=maxvert,maxhorz     " full screen takes entire screen
  set guifont=Inconsolata:h14
endif

set background=dark
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set nocompatible              " vim, not vi
set autoindent smartindent    " auto/smart indent
set smarttab                  " tab and backspace are smart
set expandtab
set tabstop=2                 " 6 spaces
set shiftwidth=2
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=longest:full
set wildmenu                  " menu has tab completion
let maplocalleader=','        " all my macros start with ,
set laststatus=2
set title                     " set terminal title
set visualbell

"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

"  backup
set backup
set backupdir=~/.vim/backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
"set viminfo='100,f1

" spelling
if v:version >= 700
  " Enable spell check for text files
  autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif

" invisible chars
set listchars=tab:>-,trail:·,eol:$

" mappings
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>

" toggle indent guide
nmap <LocalLeader>gg :IndentGuidesToggle<cr>

inoremap <C-l>  => 

" system clipboard on OSX
set clipboard=unnamed

" faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" try to get omnicompletion to work again
"let g:rubycomplete_buffer_loading = 1
"let completefunc=syntaxcomplete#Complete

if has("autocmd")
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
"  autocmd FileType ruby let g:rubycomplete_rails = 1
"  autocmd Filetype ruby let g:autoloaded_rails = 1
endif

"vim-indent-guide
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=233

" vim-airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1

" promptline.vim
let g:promptline_theme = 'lucius'
"let g:promptline_preset = 'full'
"
let g:promptline_preset = {
        \'a' : [ promptline#slices#host(), promptline#slices#user() ],
        \'b' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ]}

" tmuxline.vim
let g:tmuxline_theme = 'nightly_fox'
let g:tmuxline_preset = 'powerline'

" syntastic config
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = { 'mode': 'passive',
    \ 'active_filetypes': ['rb', 'js', 'jst', 'scss', 'yaml', 'json', 'eruby'],
    \ 'passive_filetypes': ['html'] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" showmarks.vim
" show only user marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"   

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" unite.vim
let g:unite_enable_start_insert = 1
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
      \ '--line-numbers --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
let g:unite_source_grep_recursive_opt = ''

let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
let g:unite_source_rec_max_cache_files = 5000
"
" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.gem/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'dist/',
      \ '.git5_specs/',
      \ '.pyc',
      \ 'building/',
      \ 'old_cap/',
      \ 'coverage/',
      \ ], '\|'))

nnoremap <C-l> :Unite<CR>
nnoremap <space>/ :Unite ag:.<CR>

" Quick file search
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap [unite] <Nop>
nmap <Tab> [unite]
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async:!<CR>
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>
nnoremap <silent> [unite]q :<C-U>Unite -quick-match -buffer-name=buffers buffer<CR>

" vim-markdown
let g:vim_markdown_json_frontmatter = 1

" rainbow parens good for nested parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRoun

set background=dark
colorscheme jellyx
syntax on

" has to be last to work
" http://superuser.com/questions/771558/line-length-highlighting-works-correctly-in-console-vim-not-gui
set textwidth=99
"set colorcolumn=+1

highlight ColorColumn ctermbg=darkred
call matchadd('ColorColumn', '\%101v', 100)
