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

" update vim more quickly
set updatetime=100

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

" training wheels
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" active window/line highlighting
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

