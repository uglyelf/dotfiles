filetype off                   " required!
set nocompatible               " be iMproved

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-repeat'
Bundle 'edsono/vim-matchit'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'rodjek/vim-puppet'
Bundle 'godlygeek/tabular'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'nanotech/jellybeans.vim'

"set guifont=Source\ Code\ Pro\ Light\ for\ Powerline
set guifont=Droid\ Sans\ Mono\ for\ Powerline

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
" Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
syntax on
filetype on
filetype indent on
filetype plugin on
compiler ruby
set wrap
set ruler
colorscheme jellybeans
set number

set laststatus=2
let g:syntastic_python_checkers=['flake8']
let g:syntastic_puppet_checkers=['puppetlint']
let g:syntastic_check_on_open=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F

function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call HandleURI()<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Highlight trailing whitespace on lines
match Todo /\s\+$/

"Strips trailing whitepsace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,ruby,python,puppet autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>

set omnifunc=syntaxcomplete#Complete

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'

let g:ctrlp_buffer_func = {
    \ 'enter': 'Function_Name_1',
    \ 'exit':  'Function_Name_2',
    \ }

func! Function_Name_1()
    set laststatus=0
endfunc

func! Function_Name_2()
    set laststatus=2
endfunc

" Taglist plugin mapping
noremap <silent> <Leader>t :TlistToggle<CR>

" " Taglist plugin config
let Tlist_Use_Right_Window = 1
let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth = 45
let Tlist_GainFocus_On_ToggleOpen= 1
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1

" Puppet integration
set kp=pi
set iskeyword=-,:,@,48-57,_,192-255
set tags=tags;~/

" Window movement without ctrl-w
map  <C-h> <C-w>h
map  <C-j> <C-w>j
map  <C-k> <C-w>k
map  <C-l> <C-w>l

" F4 to toggle highlighting
noremap <F4> :set hlsearch! hlsearch?<CR>
