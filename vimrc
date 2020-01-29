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
set splitbelow
set splitright
let &packpath=&runtimepath

" *******************************| Vundle |***************************** "

call plug#begin()

Plug 'wadackel/vim-dogrun'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

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

" Function for show documentation "
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>s <Plug>(coc-rename)


" ****************************| Theme |********************************* "

colorscheme palenight

set termguicolors
set noshowmode

let g:lightline = { 'colorscheme': 'palenight' }
let g:palenight_terminal_italics = 1

" transparent background for vim 
hi Normal guibg=NONE ctermbg=NONE

" ******************************| Mappings |**************************** "

noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>

nmap <C-l> :tabn<CR>
nmap <C-h> :tabp<CR>

" ************************| Leader key mappings |*********************** "

let mapleader=","

autocmd filetype c nmap <leader>c :w <CR> :!(clear ; gcc -o %:r %) && (clear ; ./%:r ; rm ./%:r) <CR>
autocmd filetype cpp nmap <leader>c :w <CR> :!(clear ; g++ -o %:r %) && (clear ; ./%:r ; rm ./%:r) <CR>
autocmd filetype python nmap <leader>c :w <CR> :!clear; python % <CR>
autocmd filetype javascript nmap <leader>c :w <CR> :!clear; node % <CR>

" ************************| Debugging c/c++ |**************************** "

autocmd filetype c nmap <leader>d :w <CR> :!(gcc -o %:r -g %) && (gdb %:r ; rm ./%:r) <CR>
autocmd filetype cpp nmap <leader>d :w <CR> :!(g++ -o %:r -g %) && (gdb %:r ; rm ./%:r) <CR>
