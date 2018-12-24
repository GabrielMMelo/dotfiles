"
" Written by Gabriel M. Melo, Federal University of Lavras. 
"

" SOURCES --------------------------------- {{{
try
    source ~/.projects.vim
    source ~/.config.vim
catch
endtry
" }}}



" PLUGINS --------------------------------- {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" MY PLUGINS !!!! "
Plugin 'tpope/vim-fugitive'

Plugin 'alvan/vim-closetag'

Plugin 'valloric/youcompleteme'

"Plugin 'lervag/vimtex'

Plugin 'nvie/vim-flake8'

" After yanking (or deleting), paste with P and then use <C-P> or <C-N> to
" alternate between the historical yanks
Plugin 'vim-scripts/YankRing.vim'

"Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'morhetz/gruvbox'

"Plugin 'jaxbot/browserlink.vim'

"colorscheme gruvbox
"set background=dark

"Plugin 'valloric/matchtagalways'

"Plugin 'vim-airline/vim-airline'

"Plugin 'vim-airline/vim-airline-themes'
"let g:airline_theme='deus'
"let g:airline_theme='minimalist'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_powerline_fonts = 1
Plugin 'scrooloose/nerdtree'

" Plugin 'posva/vim-vue'

"Plugin 'airblade/vim-gitgutter'
"set updatetime=100

Plugin '907th/vim-auto-save'
" Autosaving
let g:auto_save = 1

" Plugin dbext https://www.vim.org/scripts/script.php?script_id=356
" dbext.vim variables
":let g:dbext_default_profile = 'PG'


" " All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this lineset nocompatible              "

" }}}



" GLOBAL  ---------------------------------------------------------------------- {{{

" Enable syntax 
syntax enable 
filetype plugin on

" Set leader
let mapleader = " "
let g:mapleader = " "

" Encoding
set encoding=utf-8
"set clipboard=unnamed  " to use *
set clipboard=unnamedplus  " to use ^C

" STATUSLINE ------------------------------------------- {{{

hi User1 ctermbg=235 ctermfg=white gui=BOLD
hi User2 ctermbg=54 ctermfg=white
hi User3 ctermbg=235 ctermfg=54

" Get git branch
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
" Get vim mode
let g:currentmode={ 'n' : 'Normal', 'no' : 'N·Operator Pending ', 'v' : 'Visual', 'V' : 'V·Line ', '^V' : 'V·Block ', 's' : 'Select', 'S': 'S·Line ', '^S' : 'S·Block ', 'i' : 'Insert', 'R' : 'Replace', 'Rv' : 'V·Replace ', 'c' : 'Command', 'cv' : 'Vim Ex', 'ce' : 'Ex ', 'r' : 'Prompt ', 'rm' : 'More ', 'r?' : 'Confirm ', '!' : 'Shell ', 't' : 'Terminal '}
function! ModeCurrent() abort
    let l:modecurrent = mode()
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

set noshowmode 
set laststatus=2

" Powerline icons
" 
set statusline=
set statusline+=%2*%{StatuslineGit()}
set statusline+=%2*\ %{ModeCurrent()}\ 
set statusline+=%3*
set statusline+=%1*
set statusline+=\ %t
set statusline+=%=
set statusline+=%3*
set statusline+=%2*
set statusline+=\ \ %l
set statusline+=/
set statusline+=%L
set statusline+=\ 
set statusline+=%c\ \ 
"}}}

" INTERFACE ------------------------------ {{{

set autoindent      " auto indentation
"set nobackup        " no *~ backup files
set copyindent      " copy the previous indentation on autoindenting
set smarttab        " insert tabs on the start of a line according to context

" Disable sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Disable mouse
set mouse=c

" Paths
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//
"}}}

" REGEXP ----------------------- {{{

" Hightlight search
set hlsearch

" Incremental search
set incsearch

" }}}

" FINDING FILES ------------------------- {{{
" Provides tab-completion for all file-related tasks
"     Use :find to open file from name to new buffer
set path+=**

" Display all matching files when we tab complete
set wildmenu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

" ignore case when searching
set ignorecase

" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smartcase       

nnoremap <leader>s :find 
" }}}

" SWITCHING TAGS   ----------------------- {{{
" Create the "tags" file (may need to install ctags first)
"     Use ^] to jump to tag under cursor
"     Use g^] for ambiguous tags
"     Use ^T to jump back up the tag stack
command! MakeTags !ctags -R .
set tags=./tags;/

"}}}

" FILE BROWSING (netrw)----------------------------- {{{

"let g:netrw_banner=0
"let g:netrw_browse_split=0
"let g:netrw_altv=1
"let g:netrw_liststyle=3
"let g:netrw_winsize=30

"let g:netrw_list_hide=netrw_gititgnore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S+'

"Disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

nnoremap <leader>n :NERDTreeToggle<CR>

" }}}

" Mapping
imap jj <Esc>
imap JJ <Esc>
nnoremap L $
nnoremap H 0

" TABS
nnoremap <tab> gt 
"nnoremap <leader>w :bdelete<CR>
:au BufAdd,BufNewFile * nested tab sball
nnoremap <C-W> :bdelete<CR>

" Black hole register
map <leader>b "_

" Uncomment the following to have Vim jump to the last position when                                                       
" " reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif
"}}}



" CUSTOM MAPPINGS ---------------------------------------------------- {{{

" Folding mappings
"nnoremap <tab>o za
"nnoremap <tab>j zj
"nnoremap <tab>k zk

" Search mappings
nnoremap <leader>f /
nnoremap <leader>F ?

" Movement mappings
nnoremap 0 ^
nnoremap <leader>p $
nnoremap <leader>q ^
vnoremap <leader>p $
vnoremap <leader>q ^

" Fast shortcuts
"nnoremap <leader>w <C-w>
nnoremap <leader>k <C-u>
nnoremap <leader>j <C-d>

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
" }}}



" FORMATING ----------------------------------------- {{{

" Set tabsize to 4 spaces 
:set tabstop=4
:set shiftwidth=4
:set expandtab

" No wrap text
:set nowrap

" Enumerating
"set nonumber
"set numberwidth=2

" Hightlight

hi Folded ctermbg=008
hi Folded ctermfg=255

" }}}



" FILETYPES COMMANDS -------------------------------------------------{{{

" Text file ---------------------------------- {{{ 
augroup filetype_text
    autocmd! 
    autocmd! BufRead,BufNewFile *.{txt,md} setfiletype text
    autocmd FileType text :setlocal spell spelllang=pt
    autocmd FileType text :hi SpellBad ctermbg=001
    autocmd FileType text :hi SpellBad ctermfg=255
    " zg to add a new word | zw to 'remove' a word
augroup END
" }}}

" Vim file ---------------------------------- {{{ 
augroup filetype_vim
    autocmd! 
    autocmd FileType vim :setlocal foldmethod=marker 
    autocmd FileType vim nnoremap <buffer> <leader>c :s/^/"/<CR>
    autocmd FileType vim nnoremap <buffer> <leader>d :s/"//<CR>
augroup end
" }}}

" SQL file ---------------------------------- {{{ 
augroup filetype_sql
    autocmd! 
    autocmd filetype vim :setlocal foldmethod=marker 
    autocmd! BufRead,BufNewFile *.sql setfiletype sql
    autocmd FileType sql DBCompleteTables
augroup end
" }}}

" HTML ---------------------------------- {{{ 
augroup filetype_html
    autocmd!
    autocmd VimEnter *.html :normal gg=G | :write

    " Comment
    autocmd FileType html nnoremap <buffer> <leader>c :s/^/<!--/<CR>:s/$/-->/<CR>
    autocmd FileType htmldjango nnoremap <buffer> <leader>c :s/^/<!--/<CR>:s/$/-->/<CR>

    " Uncomment
    autocmd FileType html nnoremap <buffer> <leader>d :s/<\!--//g<CR>:s/-->//g<CR> 
    autocmd FileType htmldjango nnoremap <buffer> <leader>d :s/<\!--//g<CR>:s/-->//g<CR> 


    " Snippets
    autocmd FileType html nnoremap <buffer> ,html :-1read $HOME/.vim/snippets/.skeleton.html<CR>3jwf>a
augroup END
" }}}

" Python ---------------------------------- {{{ 
augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
    autocmd FileType python nnoremap <buffer> <leader>d 0/#<CR>x
augroup END
" }}}

" LaTeX ---------------------------------------------------- {{{

"augroup filetype_latex
"    autocmd!
"    autocmd FileType tex nnoremap <buffer> <leader>c I%<esc>
"    autocmd FileType text :setlocal spell spelllang=pt
"    autocmd FileType text :hi SpellBad ctermbg=001
"    autocmd FileType text :hi SpellBad ctermfg=255
"    " Vimtex autocomplete with youcompleteme
"    if !exists('g:ycm_semantic_triggers')
"        :let g:ycm_semantic_triggers = {}
"    endif
"    :let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
"augroup END


" }}}

" }}}



" ABBREVIATIONS ---------------------------------------------------------- {{{

"  Header
iabbrev @@ Written by Gabriel M. Melo, Federal University of Lavras.

" }}}

  

" BEST PRACTICES ------------------------------------------------------ {{{

" Arrow keys never more!
map <Up> <nop>
map <Left> <nop>
map <Right> <nop>
map <Down> <nop>

imap <Up> <nop>
imap <Left> <nop>
imap <Right> <nop>
imap <Down> <nop>

" Easy edit this file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Easy edit .bashrc
nnoremap <leader>eb :call Execute(':vsplit ' . GetHomePath() . 'bashrc')<CR>
" }}}



" WINDOWS ----------------------------------------- {{{

" Copy text on visual mode to windows 
"vmap <C-c> :w! ~/.vimbuffer \| !cat ~/.vimbuffer \| clip.exe <CR><CR>

" }}}



" FUNCTIONS --------------------------------------------------- {{{
function! Execute(command)
    execute a:command
endfunction

function! GetHomePath()
    let path = $MYVIMRC
    let strLen = len(path)
    let index = strLen - 5
    while index <# strLen
        let path = substitute(path, '.$', '', '')
        let index += 1
    endwhile
    return path
endfunction

function! PautaAta(point, subpoint)
    echom a:point
endfunction

function! CustomSum()
    let sum = 0
    for l in range( 1, line('$') )
        let fields = split( getline(l), '\s*=\s*' )
        if ( len( fields ) != 2 || fields[1] =~? '\D' )
            continue
        endif
        let sum = sum + fields[1]
    endfor
    return sum
endfunction


" }}}



" IDEAS ------------------------------------------ {{{

"- H go to the top, but when we tap H twice, we'll go to top and up more the
"   screen lines number to make faster the movement

" import different files to .vimrc (one for each device) or separe with 'ifs'
" checking some OS/device information
" }}}
