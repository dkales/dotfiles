set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"###############################################################################

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/syntastic'

Plugin 'tpope/vim-surround'

Plugin 'kien/ctrlp.vim'

Plugin 'bling/vim-airline'

Plugin 'valloric/youcompleteme'

Plugin 'sirver/ultisnips'

Plugin 'honza/vim-snippets'

Plugin 'tomasr/molokai'


"###############################################################################
call vundle#end()


filetype plugin indent on

colorscheme molokai
