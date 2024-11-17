" set encoding
set encoding=utf8

" set colors
set t_Co=256
set term=xterm-256color

" termguicolors
" if (has("termguicolors"))
"   set termguicolors
" endif

" show leader
set showcmd

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

" set list
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· ",eol:↲,space:·

" set showbreak: show a character at the end of a line when it's wrapped
set showbreak=↪\

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
hi clear LineNr
hi LineNr ctermfg=grey ctermbg=black cterm=BOLD

" Show relative numbers
set relativenumber
set rnu

" Always display the status line
set laststatus=2

" Show the file name in the terminal title bar
set title

" Automatically change directory to the file's directory
autocmd BufEnter * silent! lcd %:p:h
"" autocmd BufRead  *  silent! lcd %:p:h:gs,\\,/,:gs, ,\\ ,

" Set file type for TypeScript and JSX files
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Set file format to Unix-style line endings
set ff=unix

" Configure GitGutter signs and colors
set signcolumn=number
hi clear SignColumn
hi SignColumn       ctermfg=grey     ctermbg=black     cterm=BOLD
hi GitGutterAdd     ctermfg=grey     ctermbg=green     cterm=BOLD
hi GitGutterChange  ctermfg=grey     ctermbg=yellow    cterm=BOLD
hi GitGutterDelete  ctermfg=grey     ctermbg=red       cterm=BOLD

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

"""""""""""""""""""""""""""""""""""""

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" colors
set background=dark
colorscheme quiet
" colorscheme anubhav

" rust.vim
" https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'

" Git Gutter
" Your vimrc
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" to always show git changes
set signcolumn=yes
highlight link GitGutterAddIntraLine DiffAdd

" updates git changes in the gutter and writes buffer to swap file
set updatetime=1000

" tagbar
nmap <F8> :TagbarToggle<CR>

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 50

" airline powerline fonts
let g:airline_powerline_fonts = 1

" javascript
let g:javascript_plugin_jsdoc = 1


" eslint
let g:syntastic_javascript_checkers = ['eslint']
" lint current file
noremap <leader>l  :make % <cr>:cwindow<cr>:redraw!<cr>
" lint and fix current file
noremap <leader>lf :make --fix % <cr>:cwindow<cr>:redraw!<cr>

" editorconfig
"" Don't apply editorconfig settings to fugitive buffers; don't mess with fugitive's settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
"" Don't apply editorconfig settings to remote files; don't mess with scp's settings
let g:EditorConfig_exclude_patterns = ['scp://.*']


" code completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" prettier
packloadall
