" VIM Runtime Configuration file

" =============================================================================
" General Options
" =============================================================================

" Load Plugins
source ~/.vim/plugins.vim

" Appearance & Color
syntax on
set background=dark
colorscheme gruvbox

if has("gui_running")
    set guioptions-=l " removes lefthand scrollbar
    set guioptions-=L " removes lefthand scrollbar (split)
    set guioptions-=m " removes menubar
    set guioptions-=r " removes righthand scrollbar
    set guioptions-=T " removes toolbar
    set guifont=FiraMono\ 11
else
    set t_Co=256
endif

" Indentation
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4

" Search
set ignorecase
set incsearch
set smartcase

" Miscellaneous
set backspace=indent,eol,start
set nocompatible
set history=1000
set list
set listchars=tab:¦\ ,trail:×
set modeline
set nowrap
set relativenumber
set number
set showtabline=1

" =============================================================================
" Functions
" =============================================================================

" Cycle through capitalization (all lower -> title case -> all upper)
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

" Return the syntax group for the token under the cursor
function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" =============================================================================
" Key Bindings
" =============================================================================

let mapleader=","

" Aliases for split navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" Resize splits in increments of 2
nnoremap <silent> <C-w>+ 2<C-w>+
nnoremap <silent> <C-w>- 2<C-w>-
nnoremap <silent> <C-w>< 2<C-w><
nnoremap <silent> <C-w>> 2<C-w>>

" Aliases for horizontal and vertical splits
nnoremap <silent> <Leader>-  <C-w>s
nnoremap <silent> <Leader>\| <C-w>v

" Toggle folds with <Space>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" Toggle list chars
nnoremap <silent> <Leader>l :set list!<CR>

" Keep indented selection selected
vnoremap < <gv
vnoremap > >gv

" Apply TwiddleCase to visual selection with ~
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

" Pair Completion
inoremap {<CR>     {<CR>}<Esc>O
inoremap /*<CR>    /*<CR><BS>/<Esc>O
inoremap /**<CR>   /**<CR><BS>/<Esc>O
inoremap /*<Space> /*<Space><Space>*/<Esc>2hi

" Plugins
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>

" =============================================================================
" Statusline
" =============================================================================

set statusline=
set statusline+=[%{strlen(&ft)?&ft:'none'},
set statusline+=%{strlen(&fenc)?&fenc:&enc},
set statusline+=%{&fileformat}]
set statusline+=%h%m%r%w\ 
set statusline+=%f
set statusline+=%=
set statusline+=[%{SyntaxItem()}]\ 
set statusline+=[\%03.3b,0x\%04.2B]\ 
set statusline+=[%(%04l,%04v%)]\ %<%P
set laststatus=2
