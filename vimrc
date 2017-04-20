set nocompatible
filetype off

"--------------
" Load pathogen
"--------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

set t_Co=256
colorscheme molokai

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif


"---------------------
" Basic editing config
"---------------------
set autoindent
set nu " number lines
"set rnu " relative line numbering
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set lbr " line break
set ruler " show current position in file
set scrolloff=5 " show lines above and below cursor (when possible)
set noshowmode
set laststatus=2 
set backspace=indent,eol,start
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set mouse+=a " enable mouse mode (scrolling, selection, etc)

"--------------------
" Misc configurations
"--------------------

" set leader to ','
let mapleader = ' '

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" save read-only files
command! -nargs=0 Sudow w !sudo tee % >/dev/null

" toggle paste on F8
nnoremap <F8> :set paste!<CR>

"-------------------------
" Abbr. (Spelling Fixes)
"-------------------------

iab inlcude include
iab unsinged unsigned
iab crpyto crypto

"---------------------
" Custom functions
"---------------------

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

"---------------------
" Plugin configuration
"---------------------

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" ctrlp
nnoremap <Leader>p :CtrlPBuffer<CR>
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': []
    \}
nnoremap <Leader>s :SyntasticCheck<CR>
nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>i :SyntasticInfo<CR>
nnoremap <Leader>m :SyntasticToggleMode<CR>o


" markdown
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'c',
    \ 'erb=eruby',
    \ 'javascript',
    \ 'json',
    \ 'perl',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \]

" youcompleteme
let g:ycm_confirm_extra_conf = 0 
let g:ycm_global_ycm_extra_conf = '~/.vim/etc/.ycm_extra_conf_glob.py'
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_insertion = 1

" vim-latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor = 'latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'mkdir -p out && pdflatex -output-directory=out -interaction=nonstopmode $* && mv out/$*.pdf .'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'evince 2> /dev/null'


