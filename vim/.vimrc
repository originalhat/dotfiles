execute pathogen#infect()

" syntax is highlighted
syntax on

" lines have numbers
set number

" comments are italic
highlight Comment cterm=italic

" return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" ignorables for vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" ignorables for ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" fuzzy file, buffer, mru, tag, etc finder
set runtimepath^=~/.vim/bundle/ctrlp.vim

