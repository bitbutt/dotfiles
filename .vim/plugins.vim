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

    " Syntax
    Plugin 'mustache/vim-mustache-handlebars'

    " Clojure Environment
    Plugin 'luochen1990/rainbow'
    Plugin 'guns/vim-sexp'
    Plugin 'tpope/vim-sexp-mappings-for-regular-people'
    Plugin 'tpope/vim-fireplace'

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

    " Rainbow Parentheses

    "\   'guifgs': ['red1', 'orange1', 'yellow1', 'green1', 'cyan1', 'magenta1', 'purple1'],
    let g:rainbow_active = 0
    let g:rainbow_conf = {
    \   'guifgs': ['#d33682', '#b58900', '#859900', '#2aa198', '#6c71c4'],
    \   'ctermfgs': ['red', 'yellow', 'green', 'cyan', 'magenta', 'red', 'yellow', 'green', 'cyan', 'magenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \   }
    \}

endif
