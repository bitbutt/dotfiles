" ~/.vim/plugins.vim : Vundle configuration file

" Only execute if Vundle is installed
if filereadable(expand("~/.vim/bundle/Vundle.vim/autoload/vundle.vim"))

    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " Let Vundle manage Vundle!
    Plugin 'VundleVim/Vundle.vim'

    " Colorschemes
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'jnurmine/Zenburn'
    Plugin 'morhetz/gruvbox'

    " Syntax
    Plugin 'mustache/vim-mustache-handlebars'
    Plugin 'pearofducks/ansible-vim'

    " New Functionality
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-fugitive'

    call vundle#end()
    filetype plugin indent on

    " NERDTree

    let NERDTreeChDirMode = 2
    let NERDTreeDirArrows = 1
    let NERDTreeIgnore    = ['\.class$', '\.o$', '.git', 'tags', '__pycache__']
    let NERDTreeWinSize   = 34

endif
