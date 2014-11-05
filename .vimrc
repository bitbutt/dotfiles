" VIM Runtime Configuration file

" General Options {{{1 -------------------------------------------------------

" Load Plugins {{{2

source ~/.vim/plugins.vim

" 2}}}

" Appearance & Color {{{2

syntax on
colorscheme zenburn

if has("gui_running")
    set guioptions-=l " removes lefthand scrollbar
    set guioptions-=L " removes lefthand scrollbar (split)
    set guioptions-=m " removes menubar
    set guioptions-=r " removes righthand scrollbar
    set guioptions-=T " removes toolbar
    set guifont=EnvyCodeR\ 10
else
    set t_Co=256
endif

" 2}}}

" Indentation {{{2

set autoindent
set expandtab
"set noexpandtab
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4

" 2}}}

" Miscellaneous {{{2

set backspace=indent,eol,start
set nocompatible

" 2}}}

" Search {{{2

set ignorecase
set incsearch
set smartcase

" 2}}}

" Unsorted {{{2

set history=1000
set list
set listchars=tab:¦\ ,trail:×
"set listchars=tab:¦\ ,trail:×,eol:¬
set modeline
set nowrap
set relativenumber
set showtabline=1

" 2}}}

" 1}}} -----------------------------------------------------------------------

" Functions {{{1

" ToggleNumbering() {{{2

function! ToggleNumbering()
    if exists("+relativenumber")
        if &relativenumber
            set number
        else
            set relativenumber
        endif
    else
        set number!
    endif
endfunction

" 2}}}

" TwiddleCase() {{{2

function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
        let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
        let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
    else
        let result = toupper(a:str)
    endif
    return result
endfunction

" 2}}}

" SyntaxItem() {{{2

function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" 2}}}

" ExecuteC() {{{2

function! ExecuteC()
    :write
    :!clang -ansi -Wall % -o %<
    :!./%<
endfunction

" 2}}}

" ExecutePython() {{{2

function! ExecutePython()
    :write
    :!./%<
endfunction

" 2}}}

" ExecuteJava() {{{2

function! ExecuteJava()
    :write
    :!java %<
endfunction

" 2}}}

" ExecuteHaskell() {{{2

function! ExecuteHaskell()
    :write
    :!ghc -Wall % -o %<
    :!./%<
endfunction

" 2}}}

" ExecuteLaTeX() {{{2

function! CompileLaTeX()
    ":write
    ":silent !pdflatex -halt-on-error %
    ":silent !pdflatex -halt-on-error %
    ":silent !cp %<.pdf %<.pdf.orig
    ":silent !gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=%<.pdf %<.pdf
endfunction

" 2}}}

" ViewLaTeX() {{{2
"
function! ViewLaTeX()
    :silent !zathura %<.pdf &
endfunction

" 2}}}

" 1}}}

" Keybindings {{{1

let mapleader=","

" Language-Specific {{{2

"autocmd filetype c        nnoremap <F1> :call ExecuteC()<CR>
"autocmd filetype haskell  nnoremap <F1> :call ExecuteHaskell()<CR>
"autocmd filetype haskell  nnoremap <F2> :!ghci -i%:p:h %<CR>
"autocmd filetype java     nnoremap <F1> :call ExecuteJava()<CR>
"autocmd filetype python   nnoremap <F1> :call ExecutePython()<CR>
"autocmd filetype plaintex nnoremap <F1> :call CompileLaTeX()<CR>
"autocmd filetype plaintex nnoremap <F2> :call ViewLaTeX()<CR>
"autocmd filetype plaintex :autocmd BufWrite * :call CompileLaTeX()

" 2}}}

" Plugins {{{2

" Buffergator {{{3

nnoremap <silent> <Leader>b :BuffergatorToggle<CR>

" 3}}}

" NERDTree {{{3

nnoremap <silent> <Leader>d :NERDTreeToggle<CR>

" 3}}}

" 2}}}

" Splits {{{2

nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

nnoremap <silent> <C-w>+ 2<C-w>+
nnoremap <silent> <C-w>- 2<C-w>-
nnoremap <silent> <C-w>< 2<C-w><
nnoremap <silent> <C-w>> 2<C-w>>

nnoremap <silent> <Leader>-  <C-w>s
nnoremap <silent> <Leader>\| <C-w>v

" 2}}}

" Unsorted {{{2

nnoremap <silent> <Leader>l     :set list!<CR>
nnoremap <silent> <Leader>n     :call ToggleNumbering()<CR>
nnoremap <silent> <Leader><S-c> :edit $MYVIMRC<CR>
nnoremap <silent> <Leader>_     :set cursorline!<CR>

" <Space> toggles folds
nnoremap <silent> <Space>       @=(foldlevel('.')?'za':"\<Space>")<CR>

inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" 2}}}

" Tweaks {{{2

" keep indented selection selected
vnoremap < <gv
vnoremap > >gv

" change between lowercase, uppercase, and titlecase
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

" 2}}}

" Pair Completion {{{2

" functionality dependent on indentation settings
inoremap {<CR>     {<CR>}<Esc>O
inoremap /*<CR>    /*<CR><BS>/<Esc>O
inoremap /**<CR>   /**<CR><BS>/<Esc>O
inoremap /*<Space> /*<Space><Space>*/<Esc>2hi

" 2}}}

" Disable Arrow Keys {{{2

noremap  <Up>    <Nop>
noremap  <Down>  <Nop>
noremap  <Left>  <Nop>
noremap  <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>

" 2}}}

" 1}}}

" Statusline {{{1

set statusline=
"set statusline+=[%n]\ 
set statusline+=[%{strlen(&ft)?&ft:'none'},
set statusline+=%{strlen(&fenc)?&fenc:&enc},
set statusline+=%{&fileformat}]
set statusline+=%h%m%r%w\ 
set statusline+=%f
set statusline+=%=
"set statusline+=[%{tagbar#currenttag('%s','','p')}]\ 
"set statusline+=[%{SyntaxItem()}]\ 
set statusline+=[\%03.3b,0x\%04.2B]\ 
set statusline+=[%(%04l,%04v%)]\ %<%P
set laststatus=2

" 1}}}

" vim:fdm=marker
