"Use pathogen autoloader
execute pathogen#infect()

set number                      "Show line numbers
set linebreak                   "Break lines at word
set showbreak=+++               "Wrap-broken line prefix
set textwidth=100               "Line wrap (number of columns)
set showmatch                   "highlight matching brackets
set visualbell                  "Use visual bell (no beeping)
set colorcolumn=90              "add colored column to avoid going to far right
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

set ruler                       "Show row and column ruler information

set undolevels=1000             "Number of undo levels
set backspace=indent,eol,start  "Backspace behavior

set ttyfast
set mouse=a                     "Use mouse in all modes

"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
"set list

" Keep more info in memory
set hidden
set history=100

filetype on
syntax on
set background=dark
colorscheme onedark

"<Leader> + s --> sources .vimrc
map <leader>s :source ~/.vimrc<CR>
"Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
"Cancel a search with <Esc>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
"<Leader><Leader> will re-open a previously opened file
nnoremap <Leader><Leader> :e#<CR>

"Nerdtree
let NERDTreeMapActivateNode='<right>'
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" vim-javascript
let g:javascript_plugin_jsdoc=1

"ctrlp-vim
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_by_filename=0

"vim-airline
"Add tab line
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='murmur'
let g:airline_powerline_fonts=1
