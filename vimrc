" *****************************| Defaults |***************************** "
syntax on
set relativenumber
set number
set is
set ic
set tabstop=2
set nowrap
set shiftwidth=2
set expandtab
set autoindent
set nohlsearch
set backspace=indent,eol,start
set runtimepath^=~/.vim 
set splitbelow
set splitright
set exrc
let &packpath=&runtimepath
let &path.="/usr/include/AL,"

" *******************************| Vundle |***************************** "

call plug#begin()

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'

" Color schemes
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'edkolev/tmuxline.vim'

" For file viewer tree
Plug 'preservim/nerdtree'

call plug#end()            
filetype plugin indent on    

" **************************** | Coc | ******************************** "

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Check backspace "
function! s:check_back_space() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" autocomplete using tab "
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

"" Function for show documentation "
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"
" Remap for rename current word
nmap <leader>s <Plug>(coc-rename)

" Enter to complete the completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" ****************************| Theme |********************************* "

colorscheme palenight

set termguicolors
set noshowmode

let g:lightline = { 'colorscheme': 'palenight' }
let g:palenight_terminal_italics = 1

" transparent background
hi Normal ctermbg=NONE guibg=NONE

" autocompletion window theme
hi Pmenu guibg=#2e323e
hi PmenuSel guibg=#31DABA guifg=#282a36
hi PmenuSbar guibg=#2e323e guifg=#2e323e
hi PmenuThumb guibg=#3e4452 guifg=#352B59

" ******************************| Mappings |**************************** "

" Resize horizontal panes.
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>

noremap <C-w>++ :vertical resize +5<CR>
noremap <C-w>-- :vertical resize -5<CR>


" Resize vertical panes
" Next tab
nmap <C-p> :tabn<CR>

" focus panes
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Scrolling
nmap <A-j> <C-e>
nmap <A-k> <C-y>

vmap <A-j> <C-e>
vmap <A-k> <C-y>

" Save file
nmap <C-s> :w<CR>
" Save and exit
nmap <C-x> :x<CR>

" quit without saving
nnoremap <C-q> :q!<CR>


" |*| Leader key mappings |*| "

let mapleader=","

" Nerdtree
nnoremap <leader>n :NERDTree<CR>

nmap <leader>w <C-w>w


" running different programming language programs "
autocmd filetype c nmap <leader>z :!(make %:r) && (./%:r) <CR>
autocmd filetype cpp nmap <leader>z :!(make %:r) && (./%:r) <CR>
autocmd filetype python nmap <leader>z :w <CR> :!python % <CR>
autocmd filetype javascript nmap <leader>z :w <CR> :!node % <CR>
autocmd filetype racket nmap <leader>z :w <CR> :!racket % <CR>
autocmd filetype nasm nmap <leader>z :w <CR> :!nasm -f elf64 % -o %:r.o ; ld %:r.o -o %:r <CR> :!./%:r <CR>
autocmd filetype sh nmap <leader>z :w <CR> :!bash % <CR>

" ************************| Debugging c/c++ |**************************** "

autocmd filetype c nmap <leader>d :w <CR> :!(gcc -o %:r -g %) && (gdb %:r) <CR>
autocmd filetype cpp nmap <leader>d :w <CR> :!(g++ -o %:r -g %) && (gdb %:r) <CR>

" Autorun xrdb after modifying Xresources "
autocmd BufWritePost *.Xresources :silent exec "!xrdb %"

" Syntax highlighting for .conf files "
autocmd BufRead,BufNewFile .polybar,.termite,*.conf setf dosini
autocmd BufRead,BufNewFile *.rasi setf css
autocmd BufRead,BufNewFile *cron* setf crontab
autocmd BufRead,BufNewFile *.asm setf nasm
