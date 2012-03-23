filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

set modelines=0
set mouse=a
set clipboard=unnamed

"hide search highlighting on enter
nnoremap <silent> <CR> :noh<CR><CR>
"close buffer
nnoremap <silent> <leader>q :bd<CR>

runtime macros/matchit.vim

set noswapfile

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" Display extra whitespace
set list listchars=tab:»·,trail:·

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

let mapleader = ","

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %

nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

nnoremap <leader>s :set 
nnoremap <leader>a :Ack<space>

nnoremap <leader>v V`]


" CTags - tagbar
let g:tagbar_usearrows = 1
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>
map <Leader>t :TagbarToggle<CR>
set tags=./tags;


inoremap jj <ESC>

" * Text Formatting -- General

" don't make it look like there are line breaks where there aren't:
set nowrap

" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79

" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::

" * Text Formatting -- Specific File Formats

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" * Search & Replace

" * Spelling

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" * Keystrokes -- Formatting
" have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$


set laststatus=2

autocmd BufNewFile,BufRead *.rhtml set filetype=eruby
autocmd BufNewFile,BufRead *.erb* set filetype=eruby
autocmd BufNewFile,BufRead *.rake set filetype=ruby
autocmd BufNewFile,BufRead *.pm set filetype=perl

syntax on

" auto indent
set ai

" show line numbers
set nu

set binary noeol
set showmatch


win 150 60

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

set wildmenu


"Remove the toolbar
set guioptions-=T
set guioptions-=L
set guioptions-=r
"better status line
set statusline=%<%f%h%m%r%=%{strftime(\"%I:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ \ \|\ \ %{&ff}\ %l,%c%V\ %P\ \ 
"bigger font so i don't go blind
set guifont=Inconsolata-dz\ for\ Powerline:h13


"replace all tabs with 4 spaces
map \ft :%s/	/    /g<CR> 

set et


autocmd FileType * set relativenumber

"split stuff
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-n> :vsplit <CR>


"toggle spellcheck
inoremap <silent> <leader>s <c -O>:call SpellToggle()<cr>
map <silent> <leader>s :call SpellToggle()<cr>
function SpellToggle()
  if &spell == 1
    set nospell
  else
    set spell
  endif
endfunction
