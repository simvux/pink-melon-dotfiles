" Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentLine'
Plug 'elixir-editors/vim-elixir'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'
Plug 'unblevable/quick-scope'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ElmCast/elm-vim'

call plug#end()

let g:indentLine_color_term = 3
let g:indentLine_enabled = 0

nnoremap <Space> :w<CR>

" COC
set cmdheight=2
set updatetime=300
set shortmess+=c 
set signcolumn=yes
hi SignColumn ctermbg=NONE 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)
nmap <silent> <C-b> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-g> <Plug>(coc-definition)
nmap <silent> <C-h> :vsp<CR><Plug>(coc-definition)
nmap <silent> <C-s> <Plug>(coc-references)
nmap <silent> <C-a> <Plug>(coc-rename)
hi Pmenu ctermfg=14 ctermbg=NONE
hi PmenuSel ctermfg=11 ctermbg=NONE

" Aliases
cnoreabbrev vex Vex
" cnoreabbrev ex Ex

" python
let g:pymode_lint_ignore = "E501,W"

" Autosave
let g:auto_save_in_insert_mode = 0

" No idea but this should be here
filetype plugin indent on
filetype plugin on

set completeopt=menu,menuone,preview,noselect,noinsert

" Makes the buffer not scroll when pressing `enter` on a pair
let AutoPairsCenterLine = 0

" F-T hinting
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

autocmd FileType rust map <buffer> <C-c> :w <BAR> !cargo build<CR>
autocmd FileType rust map <buffer> <C-x> :w <BAR> !RUST_BACKTRACE=1 cargo run<CR>
autocmd FileType elixir map <buffer> <C-c> :w <BAR> !echo ""; echo ""; elixirc %<CR>
" autocmd FileType elm map <buffer> <C-c> :!elm make src/Main.elm --output="www/index.html"
autocmd FileType elm map <buffer> <C-c> :wa <BAR> !../build<CR>
autocmd FileType haskell map <buffer> <C-c> :wa <BAR> !ghc %<CR>
autocmd FileType haskell map <buffer> <C-x> :wa <BAR> !ghc %; ./Main<CR>
autocmd FileType haskell map <buffer> <C-b> :wa <BAR> !hlint %<CR>
autocmd FileType nasm map <buffer> <C-c> :w <BAR> !nasm -f elf64 main.nasm -o main.o ; ld -m elf_x86_64 main.o -o main; rm main.o<CR>
autocmd FileType nasm map <buffer> <C-x> :w <BAR> !nasm -f elf64 main.nasm -o main.o ; ld -m elf_x86_64 main.o -o main ; ./main; rm main.o<CR>
autocmd FileType ruby map <buffer> <C-x> :w <BAR> !ruby %<CR>

autocmd FileType pandoc map <buffer> <C-c> :wa <BAR> silent !vimtopdf % out.pdf<CR>

" Double tap esc to de-hightlight
nnoremap <esc><esc> :silent! nohls<cr>

" enable colors
syntax on

" Enable native vim stuff
" Smart Resize
autocmd VimResized * wincmd =
"
"set tabstop=4
" Autoclear search HL
let g:incsearch#auto_nohlsearch = 1
" Split line/color 
set fillchars+=vert:\| 
hi VertSplit ctermbg=NONE guibg=NONE cterm=NONE ctermfg=6
set ignorecase
set hlsearch
set incsearch
set scrolloff=10
" Clear on shell command
" map :! :!clear;
" Scrolling keys
nnoremap <A-j> <C-e>
nnoremap <A-k> <C-y>
" Ctrl+hjkl for split momvement.
let g:BASH_Ctrl_j = 'off'
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>
" Don't wrap the bloody text, why would anyone want that? Looks like shit
set nowrap
" Set spellcheck lang, still have to manually enable with :set spell
set spelllang=en
" Search color 
hi Search ctermbg=NONE ctermfg=1
" inoremap <C-i> <C-\><C-o>:w<CR>

" vim-go
" let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" latex
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
" autocmd FileType tex setl updatetime=1
let g:livepreview_previewer = 'mupdf.update'

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Indentation Colors
let g:indent_guides_enable_on_vim_startup = 0
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" Arduino
let g:arduino_dir = '/usr/share/arduino'
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" These don't exist by default, you'd have to create them in elm-vim plugin files
" hi ElmPipeRight ctermfg=3
" hi ElmPipeLeft ctermfg=3

" lightline
set laststatus=2
set noshowmode

" identify highlight group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Move block forwards/backwards
nnoremap <C-,> ]m
nnoremap <C-m> [m

" nasm color highlighting
au BufRead,BufNewFile *.nasm :setf nasm
au BufRead,BufNewFile *.lm :setf rust

" Auto enter directories
autocmd BufEnter * silent! lcd %:p:h

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'colorscheme': '16color'
      \ }
      \ }
function! LightlineFilename()
  return expand('%:p')
endfunction

" Rust
" autocmd FileType rust inoremap : ::
"let g:ycm_rust_src_path = "/home/simon/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

" clipbord
" if has('unnamedplus')
"    set clipboard=unnamed,unnamedplus
" endif

" hi Keyword ctermfg=2
" hi Type ctermfg=14
" hi MatchParen cterm=none ctermfg=3 ctermbg=none
" hi Constant ctermfg=4
hi PreProc ctermfg=2
hi Type ctermfg=6

autocmd Filetype yaml setlocal tabstop=2

autocmd Filetype rust hi CocUnderline cterm=None
highlight EndOfBuffer ctermfg=black ctermbg=NONE

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
