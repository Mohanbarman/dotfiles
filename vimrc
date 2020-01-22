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
set backspace=indent,eol,start

" ****************************| Color scheme |************************** "

colorscheme xemacs

" ******************************| Mappings |**************************** "

map <C-x> :wq<CR>
imap <C-x> <Esc>:wq<CR>
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

" ************************| Leader key mappings |*********************** "

let mapleader=","

" *********************| Run diffrent types of programs |*************** "

autocmd filetype c nmap <leader>c :w <CR> :!(clear; gcc -o %:r %) && (clear; ./%:r ; rm ./%:r) <CR>
autocmd filetype cpp nmap <leader>c :w <CR> :!(clear; g++ -o %:r %) && (clear; ./%:r ; rm ./%:r) <CR>
autocmd filetype python nmap <leader>c :w <CR> :!clear; python % <CR>
autocmd filetype javascript nmap <leader>c :w <CR> :!clear; node % <CR>
