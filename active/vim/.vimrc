"Use pathogen autoloader
execute pathogen#infect()
Helptags

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
"endif

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
set background=dark
colorscheme onedark
" let g:material_style='palenight'

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
" NerdComment
filetype plugin on

" vim-javascript
let g:javascript_plugin_jsdoc=1

"ctrlp-vim
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_by_filename=0
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

"Fugitive.vim
set diffopt+=vertical
nnoremap <Leader>gs :Gstatus<CR>

"vim.gitgutter
let g:gitgutter_sign_modified="\uf101" " basically: >>
let g:gitgutter_sign_added="\uf44d" "basically: +
let g:gitgutter_sign_removed="\uf48b" "basically: -
let g:gitgutter_sign_removed_first_line="\uf42d" "a collapsing fold
