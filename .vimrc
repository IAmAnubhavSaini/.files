" Enable recursive file search in subdirectories
set path+=**

" Enable interactive wildmenu for command completion
set wildmenu

" Split windows vertically and horizontally by default
set splitright
set splitbelow

" Configure backspace behavior
set backspace=indent,eol,start

" Set tabstop, shiftwidth, and enable expandtab for consistent indentation
set tabstop=4
set shiftwidth=4
set expandtab

" Use line wrapping and break lines at word boundaries
set wrap
set linebreak

" Disable automatic line breaks and wrap margins
set textwidth=0
set wrapmargin=0

" Use netrw as the default file explorer with specific settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" Enable syntax highlighting for code files
syntax on

" Set spell checking and text width for Git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Show line numbers on the left side
set number
set nu

" Show relative numbers
set relativenumber
set rnu

" Always display the status line
set laststatus=2

" Show the file name in the terminal title bar
set title

" Automatically change directory to the file's directory
autocmd BufEnter * silent! lcd %:p:h

" Set file type for TypeScript and JSX files
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Set file format to Unix-style line endings
set ff=unix

" Configure GitGutter signs and colors
set signcolumn=yes
highlight SignColumn guibg=yellow ctermbg=white
highlight GitGutterAdd guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Enable persistent undo, backup, and swap files management
set undofile
set backup
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

""" dynamic number gutter
""" insert mode:    absolute numbers
""" command mode:   relative numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

