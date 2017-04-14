" to configure color with this use guibg instead of ctermbg
" anchors colors too to not be dependent on iterm2 color profile
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors")) " since 0.1.5
 set termguicolors
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'guns/jellyx.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mileszs/ack.vim'
Plug 'luochen1990/rainbow'
Plug 'neomake/neomake'
Plug 'christoomey/vim-system-copy'
Plug 'kshenoy/vim-signature'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'aklt/plantuml-syntax', { 'for': 'markdown' }
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'janko-m/vim-test', { 'for': ['ruby', 'elixir'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'] }
Plug 'sunaku/vim-ruby-shoulda-context', { 'for': 'ruby' }
Plug 'jgdavey/tslime.vim', { 'for': ['elixir', 'ruby'] }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'othree/html5.vim', { 'for': ['html', 'eruby'] }
Plug 'junegunn/fzf.vim'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-scripts/xoria256.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'hhsnopek/vim-firewatch'
Plug 'roosta/srcery'
Plug 'goatslacker/mango.vim'
Plug 'jacoborus/tender.vim'
Plug 'aereal/vim-colors-japanesque'
Plug 'rakr/vim-two-firewatch'
Plug 'cseelus/vim-colors-lucid'
Plug 'MvanDiemen/ghostbuster'
Plug 'whatyouhide/vim-gotham'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Sierra'
Plug 'AlessandroYorba/Monrovia'
Plug 'Marfisc/vorange'
Plug 'juanedi/predawn.vim'
Plug 'scwood/vim-hybrid'
Plug 'mhinz/vim-janah'
Plug 'easysid/mod8.vim'
Plug 'zacanger/angr.vim'
Plug 'jansenfuller/crayon'
Plug 'rhysd/vim-color-spring-night'
Plug 'ayu-theme/ayu-vim'
Plug 'nightsense/seabird'

call plug#end()

set background=dark
colorscheme jellyx
syntax enable

let maplocalleader=','        " all my macros start with ,
set ruler                     " show the line number on the bar
set more                      " use more prompt
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showcmd
set autoindent smartindent    " auto/smart indent
set expandtab
set tabstop=2                 " 6 spaces
set shiftwidth=2
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set linebreak
set cmdheight=2               " command line two lines high
set laststatus=2
set title                     " set terminal title
set visualbell
set showmode

set incsearch                 " incremental search
set ignorecase                " search ignoring case
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent plugin on     " Enable filetype-specific indenting and plugins

set backup
set backupdir=~/.config/nvim/backup

set wildmode=longest:full
set wildmenu                  " menu has tab completion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" invisible chars
set listchars=tab:>-,trail:*,eol:$,nbsp:+

set clipboard=unnamed

" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>
" toggle indent guide
nmap <LocalLeader>gg :IndentGuidesToggle<cr>

nmap <LocalLeader>ggg :set cursorcolumn<cr>set cursorline<cr>

nmap <LocalLeader>nn :Neomake<cr>

let g:ruby_path=$RUBY_ROOT

" vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 3
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=232 guibg=#010101
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234 guibg=#13041F

" tmuxline.vim
let g:tmuxline_theme   = 'nightly_fox'
let g:tmuxline_preset  = 'powerline'
let g:tmuxline_preset = {
      \'a'        : '#S',
      \'cwin'     : ['#I', '#W'],
      \'win'      : ['#I', '#W'],
      \'x'        : ['%Y-%m-%d', '%H:%M'],
      \'y'        : '#H',
      \'z'        : '#(battery -p -t)'}
" needs some tmux set -g status-justify left


" vim-airline
let g:airline_theme    = 'luna'
let g:airline#extensions#tmuxline#enabled = 0

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
      \ 'guifgs': ['#EBE54D', '#FCB116', '#EF4136', '#FF0051' ],
      \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta']
      \ }

" neomake
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_elixir_enabled_makers = ['credo']

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Ack.vim/ag
" see .agignore
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" http://superuser.com/questions/771558/line-length-highlighting-works-correctly-in-console-vim-not-gui
"set textwidth=100
set colorcolumn=111
"highlight ColorColumn ctermbg=darkred guibg=#ff00ff
"call matchadd('ColorColumn', '\%101v', 100)
" #F71862
augroup init_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=red ctermfg=white guibg=#f95189 guifg=#333333
  autocmd BufEnter * match OverLength /\%>111v.\+/
augroup END
highlight ColorColumn ctermbg=gray guibg=#111111 guifg=#333333

highlight CursorColumn guibg=#eeeeee ctermbg=red
highlight CursorLine guibg=#eeeeee ctermbg=yellow

" vim limelight
" color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.7

" vim-ruby-shoulda-context
set completefunc=syntaxcomplete#Complete

"vim-test
nmap <silent> <localleader>t :TestNearest<CR>
nmap <silent> <localleader>T :TestFile<CR>

let test#strategy = {
  \ 'nearest': 'tslime',
  \ 'file':    'tslime'
  \}

let g:goyo_width=111

let g:plantuml_executable_script='/usr/local/bin/plantuml'
if exists("g:plantuml_executable_script")
  let s:makecommand=g:plantuml_executable_script." %"
  let &l:makeprg=s:makecommand
end

" for fzf
set rtp+=/usr/local/opt/fzf

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --follow --glob "!.git/*" --glob "!.gem/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" customize file_rec to use ripgrep
call denite#custom#var('file_rec', 'command',
  \ ['rg', '--files', '--glob', '!.git'])
nnoremap [denite] <Nop>
nmap <Tab> [denite]
nnoremap <silent> [denite]u :<C-u>Denite file_mru<CR>
nnoremap <silent> [denite]f :<C-u>Denite file_rec line<CR>

" ruby folding / performance
"let ruby_fold = 1
"let ruby_foldable_groups = 'do'
"
