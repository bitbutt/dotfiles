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
    Plugin 'rust-lang/rust.vim'
    Plugin 'cespare/vim-toml'
    Plugin 'quabug/vim-gdscript'

    " New Functionality
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-fugitive'
    "Plugin 'Valloric/YouCompleteMe'
    "Plugin 'vim-syntastic/syntastic'

    call vundle#end()
    filetype plugin indent on

    " Gruvbox

    let g:gruvbox_contrast_dark = 'medium'

    " NERDTree

    let NERDTreeChDirMode = 2
    let NERDTreeDirArrows = 1
    let NERDTreeIgnore    = ['\.class$', '\.o$', '.git', 'tags', '__pycache__']
    let NERDTreeWinSize   = 34

    " Syntastic

    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    "let g:syntastic_check_on_open = 1
    "let g:syntastic_check_on_wq = 0
    "let g:syntastic_rust_rustc_exe = 'cargo check'
    "let g:syntastic_rust_rustc_fname = ''
    "let g:syntastic_rust_rustc_args = '--'
    "let g:syntastic_rust_checkers = ['rustc']

endif
