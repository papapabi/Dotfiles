syntax enable
colorscheme gruvbox
set background=dark
" For vim-indent-guides
set ts=2 sw=2 et
" So vim-airline appears all the time
set laststatus=2
set number
let g:airline_powerline_fonts = 1

" For smarter tab lines
let g:airline#extensions#tabline#enabled = 1

" Use vim-plug (junegunn/vim-plug) as the plugin manager
" The string in single quotes is the directory for the plugins 
call plug#begin('~/.vim/plugged')

" This shorthand notation fetches http://github.com/X/Y
" Plug 'X/Y'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'

call plug#end()

" Insert newline after cur line by pressing Enter (Shift+Enter inserts before
" the current line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Autorun vim-indent-guides on startup
" disable by pressing <leader>ig
autocmd VimEnter * IndentGuidesEnable
