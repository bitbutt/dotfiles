" ~/.vim/plugins.vim : Vundle configuration file

if filereadable(expand("~/.vim/bundle/Vundle.vim/autoload/vundle.vim"))

    set nocompatible
    filetype off

    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'

    Plugin 'altercation/vim-colors-solarized'
    Plugin 'jeetsukumaran/vim-buffergator'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'mustache/vim-mustache-handlebars'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-fugitive'

    call vundle#end()
    filetype plugin indent on

    " NERDTree

    let NERDTreeChDirMode = 2
    let NERDTreeDirArrows = 1
    let NERDTreeIgnore    = ['\.class$', '\.o$', '.git', 'tags', '__pycache__']
    let NERDTreeWinSize   = 34

    " Syntastic

    "let g:syntastic_c_compiler_options = '-ansi -Wall -Wextra'
    let g:syntastic_c_compiler_options = '-std=c99 -Wall -Wextra'
    let g:syntastic_enable_balloons    = 1
    let g:syntastic_enable_signs       = 1
    let g:syntastic_loc_list_height    = 5
    let g:syntastic_mode_map = { "mode": "passive",
                               \ "active_filetypes": ["c"],
                               \ "passive_filetypes": [] }

    " Buffergator

    let g:buffergator_split_size       = 34
    let g:buffergator_suppress_keymaps = 1

    " VimWiki

    let g:vimwiki_list = [{ "path": "~/documents/wiki/",
                          \ "path_html": "~/documents/wiki/html/",
                          \ "index": "main_page",
                          \ "template_path": "~/documents/wiki/html/templates/",
                          \ "template_default": "default",
                          \ "template_ext": ".html"}]
    let g:vimwiki_valid_html_tags = "b,i,s,u,sub,sup,kbd,br,hr,h1,h2,h3,h4,h5,table,ol,ul,li,div,a,small"

endif

" vim:fdm=marker
