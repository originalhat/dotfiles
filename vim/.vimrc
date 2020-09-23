execute pathogen#infect()

" syntax is highlighted
syntax on

" lines have numbers
set number

" whitespace as tabs
set expandtab

" sane tab sizing
set tabstop=2

" sane tab sizing
set shiftwidth=2

" sane tab sizing
set expandtab

" TODO: can this be markdown specfic? auto-formatting is a great way to shoot
" yourself in the foot
" automatic formatting of paragraphs
"set formatoptions+=a

" update vim more quickly
set updatetime=100

" highlight search matches
set hls

" comments are italic
highlight Comment cterm=italic

" return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" ignorables for vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*,*/target/*

" ignorables for ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|build|target\|resources/public/js'

" use current directory for searching files
let g:ctrlp_working_path_mode = 0

" fuzzy file, buffer, mru, tag, etc finder
set runtimepath^=~/.vim/bundle/ctrlp.vim

" always show dotfiles w/ ctrp
" let g:ctrlp_show_hidden = 1

" trim trailing whitespace before save
autocmd BufWritePre * %s/\s\+$//e

" NERDTREE
map <C-n> :NERDTreeToggle<CR>

" active line highlighting
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

