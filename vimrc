" *****************************| Defaults |***************************** "
syntax on
set relativenumber
set number
set is
set ic
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set autoindent
set nohlsearch
set backspace=indent,eol,start
set runtimepath^=~/.vim 
let &packpath=&runtimepath

" *******************************| Vundle |***************************** "

call plug#begin()

Plug 'wadackel/vim-dogrun'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'

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

" ****************************| Theme |********************************* "

colorscheme palenight

set termguicolors
set noshowmode

let g:lightline = { 'colorscheme': 'palenight' }
let g:palenight_terminal_italics = 1

" ******************************| Mappings |**************************** "

noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>h :vertical:resize -5<CR>
noremap <C-w>l :vertical:resize +5<CR>

" ************************| Leader key mappings |*********************** "

let mapleader=","

autocmd filetype c nmap <leader>c :w <CR> :!(clear ; gcc -o %:r %) && (clear ; ./%:r ; rm ./%:r) <CR>
autocmd filetype cpp nmap <leader>c :w <CR> :!(clear ; g++ -o %:r %) && (clear ; ./%:r ; rm ./%:r) <CR>
autocmd filetype python nmap <leader>c :w <CR> :!clear; python % <CR>
autocmd filetype javascript nmap <leader>c :w <CR> :!clear; node % <CR>

" ************************| Debugging c/c++ |**************************** "

autocmd filetype c nmap <leader>d :w <CR> :!(gcc -o %:r -g %) && (gdb %:r ; rm ./%:r) <CR>
autocmd filetype cpp nmap <leader>d :w <CR> :!(g++ -o %:r -g %) && (gdb %:r ; rm ./%:r) <CR>
