execute pathogen#infect()

" ----- File navigation (gf) -----
" Add extensions so gf works with JS/TS imports
set suffixesadd+=.js,.jsx,.ts,.tsx,.json,.vue,.css,.scss

" Handle @ alias (adjust 'src' if your project uses a different path)
set path+=src/**
set includeexpr=substitute(v:fname,'^@','src','')
" Include @ and / in filename detection for gf
set isfname+=@-@

" ----- True color support (for kitty/tmux) -----
if has('termguicolors')
  set termguicolors
endif

" syntax is highlighted
syntax on

" ----- Theme -----
colorscheme catppuccin_mocha

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

" Increase syntax highlighting timeout (default 2000ms)
set redrawtime=10000

" highlight search matches
set hls

" comments are italic
highlight Comment cterm=italic gui=italic

" return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" ignorables for vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*,*/target/*

" ----- fzf (replaces ctrlp) -----
set rtp+=/opt/homebrew/opt/fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-b> :Buffers<CR>

" fzf window at bottom
let g:fzf_layout = { 'down': '40%' }

" use ripgrep for fzf, respects .gitignore
" add patterns here to exclude from file search (Ctrl-p)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" --glob "!*.lock" --glob "!coverage/*" --glob "!dist/*" --glob "!build/*"'

" exclude from content search (Ctrl-g)
" customize the globs for your project
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '
  \   . '--glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" --glob "!*.lock" --glob "!coverage/*" '
  \   . shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview(),
  \   <bang>0)

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

