syntax enable
colorscheme gruvbox
set background=dark
" For vim-indent-guides
set ts=2 sw=2 et
" So vim-airline appears all the time
set laststatus=2
set number
" Automatically populates the g:airline_symbols dictionary with powerline
" symbols
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" CtrlP
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height

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
Plug 'kien/ctrlp.vim'

call plug#end()

" Insert newline after cur line by pressing Enter (Shift+Enter inserts before
" the current line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Add shortcuts for easy buffer navigation
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>
nmap <F8> :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>
nmap <F7> :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>lb :ls<CR>

" Add a bind for save all open buffers
nmap <F9> :wa<CR>

" Add bindings for selection/clipboard buffer copy-pasting
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>p "+p

" CtrlP keybinds
nmap <leader>bf :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" CtrlP show all files in a dir
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" Autorun vim-indent-guides on startup
" disable by pressing <leader>ig
autocmd VimEnter * IndentGuidesEnable
