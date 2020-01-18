" -=-=-=- Defaults -=-=-=- "
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
set backspace=indent,eol,start

" -=-=-=- Color scheme -=-=-=- "
colorscheme peachpuff

map <C-x> <Esc>:wq<CR>

" -=-=-=-=- Leader key mappings -=-=-=-=-"

let mapleader=","

autocmd filetype c map <leader>c <Esc>:w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp map <leader>c <Esc>:w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
