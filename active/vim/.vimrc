"Use pathogen autoloader
execute pathogen#infect()
Helptags

let mapleader=","

set number                      "Show line numbers
set linebreak                   "Break lines at word
set showbreak=+++               "Wrap-broken line prefix
set textwidth=250               "Line wrap (number of columns)
set showmatch                   "highlight matching brackets
set visualbell                  "Use visual bell (no beeping)
set colorcolumn=150             "add colored column to avoid going to far right
set hlsearch                    "highlight found words when searching
set smartcase                   "Enable smart-case search
set ignorecase                  "Always case-insensitive
set incsearch                   "Searches strings incrementally

set autoindent                  "Auto-indent new lines
set expandtab                   "Use spaces instead of tab
set shiftwidth=2                "Number of auto-indent spaces
set smartindent                 "Enable smart indent
set smarttab                    "Enable smart tabs
set softtabstop=2               "Number of spaces per tab
set foldmethod=indent           "Fold code at indents
set ruler                       "Show row and column ruler information

set nocompatible                "removes junk characters when hitting arrow keys

set undolevels=1000             "Number of undo levels
set backspace=indent,eol,start  "Backspace behavior

set ttyfast
set laststatus=2

set pastetoggle=<Leader>v       "Go into paste mode (improves pasting from other sources)
set clipboard=unnamed           "Allows yank to pbcopy (regular clipboard)
set hidden
set history=100


" File formatting (syntax & themes)
filetype on
syntax on
set termguicolors               "Full 24bit colors
set background=dark
colorscheme vim-material
let g:material_style='palenight'
let g:airline_theme='material'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<Leader> + s --> sources .vimrc
map <leader>s :source ~/.vimrc<CR>
"Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
"Cancel a search with <Esc>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
command Q qa                                "Use :Q to quit all windows

"Navigate buffers similar to tabs in other programs but with vim navigation keys
nnoremap <C-L>          :bp<CR>
nnoremap <C-H>          :bn<CR>
nnoremap <C-C>          :bd<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Package settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerdtree
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" NerdComment
filetype plugin on

" vim-javascript
let g:javascript_plugin_jsdoc=1

"ctrlp-vim
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_by_filename=0
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

"vim-airline
"Add tab line
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='base16'
let g:airline_powerline_fonts=1

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers=['standard']
"Ignore certain types of files from linting
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Hardmode!!!!!!
let g:HardMode_level='hard'
let g:HardMode_echo=1
let g:HardMode_hardmodeMsg='Welcome to HELL!!!!'

"Ack.vim/Silver Searcher
"use ag as default. Some systems have ack (debian) so if ag isn't available, it will default rather than error
if executable('ag')
  let g:ackprg = "ag --vimgrep"
endif
nnoremap <Leader>a :Ack!<space>

"indentLine
set conceallevel=1
let g:indentLine_conceallevel=1
let g:indentLine_color_term=239     "Use color values in from terminal colors
let g:indentLine='┆'
:set list lcs=tab:——
nnoremap <Leader>i :IndentLinesToggle<CR>

"devicons
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
set encoding=utf8
set guifont=RobotoMono_Nerd_Font:h11

"Buffergator
let g:buffergator_viewport_split_policy = 'R'
nmap <leader>b :BuffergatorToggle<CR>
let g:buffergator_suppress_keymaps = 1

"Fugitive.vim
set diffopt+=vertical
nnoremap <Leader>gs :Gstatus<CR>

"vim.gitgutter
let g:gitgutter_sign_modified="\uf101" " basically: >>
let g:gitgutter_sign_added="\uf44d" "basically: +
let g:gitgutter_sign_removed="\uf48b" "basically: -
let g:gitgutter_sign_removed_first_line="\uf42d" "a collapsing fold

" dbext.vim
" Source all files in ~/dbext-connections to pull in local db connections
for rcfile in split(globpath("~/.dbext-connections/", "*.vim"), '\n')
    execute('source '.rcfile)
endfor
let g:dbext_default_PGSQL_pgpass=expand('$HOME/.dbext-connections/.pgpass')
