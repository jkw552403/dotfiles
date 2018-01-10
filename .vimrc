if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'tpope/vim-sensible'

" use % to travel paired tags
runtime macros/matchit.vim

" conceal lambda into λ, etc.
Plug 'ehamberg/vim-cute-python'

" --- moving ---

" use % to travel Python's if, elif, etc.
Plug 'vim-scripts/python_match.vim'

Plug 'easymotion/vim-easymotion'

Plug 'terryma/vim-expand-region'

Plug 'tpope/vim-surround'

Plug 'terryma/vim-multiple-cursors'

" --- selecting ---
Plug 'wellle/targets.vim'

" --- display ---
Plug 'haya14busa/incsearch.vim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs', { 'on':  'NERDTreeToggle' }

" --- Python ---
Plug 'python-mode/python-mode'


" --- Ansible ---
Plug 'pearofducks/ansible-vim'

" --- Misc ---
Plug 'christoomey/vim-tmux-navigator'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'iamcco/markdown-preview.vim'

Plug 'majutsushi/tagbar'
call plug#end()

syntax on
set background=dark
filetype on
au BufNewFile,BufRead *.ddl set filetype=sql
imap jj <ESC>
set nu
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set mouse=a
let mapleader = "z"

" --- EasyMotion ---
let g:EasyMotion_smartcase = 1

" --- NERDTree ---
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree
map <F3> <plug>NERDTreeTabsToggle<CR>

" --- python mode ---
let g:pymode_lint = 1
let g:pymode_lint_on_fly = 1
let g:pymode_debug = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_python = 'python3'
let g:pymode_rope_completion_bind = '<C-C>'
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 1

" --- vim-expand-region ---
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" --- markdown preview ---
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode

let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"

" --- tagbar ---
nmap <F8> :TagbarToggle<CR>
