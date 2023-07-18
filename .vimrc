" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
"set tm=500
"set updatetime=1000
set guioptions -=m 
set guioptions -=T
set noswapfile
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set bs=2
set wildignore+=*node_modules/**
" Makes search act like search in modern browsers
set incsearch 

" Highlight search results
set hlsearch

set laststatus=2

if !has('gui_running')
	set t_Co=256
endif

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" set leader key to \
let mapleader = "\\"

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

vmap <c-m> :make<cr>

" open ctag in tab/vertical split
nmap gdn  :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap gd/ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nmap gd- :sp <CR>:exec("tag ".expand("<cword>"))<CR>
nmap gdd :exec("tag ".expand("<cword>"))<CR>


" Enable auto completion menu after pressing TAB.
set wildmenu

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view eier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Press the space bar to type the : character in command mode.
noremap <space> :

" terminal maps
nnoremap <leader>tl :below vertical terminal<cr>
nnoremap <leader>tj :below terminal<cr>

" close tab
noremap <c-n> :tabnew<cr>


" don't copy deleted text to register
nnoremap d "_d
vnoremap d "_d

" auto indent after paste
nnoremap p p=`]
nnoremap P P=`]

" copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Moving between tabs with meta key and arrows
nnoremap <m-left> gT
nnoremap <m-right> gt

set nu

set guifont=Anonymous\ Pro\:h13

call plug#begin('~/.vim/plugged')
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
	Plug 'mhinz/vim-startify'

	" Interface stuff
	Plug 'mhinz/vim-startify' " fancy start page
	" Plug 'vim-airline/vim-airline'
	Plug 'itchyny/lightline.vim'
	Plug 'srcery-colors/srcery-vim'

	" Fuzzy Finder
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
	Plug 'ctrlpvim/ctrlp.vim'

	Plug 'tomasiser/vim-code-dark'
	Plug 'morhetz/gruvbox'
	Plug 'preservim/nerdtree'
	Plug 'vim-scripts/VimIRC.vim'
	Plug 'jparise/vim-graphql'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Git
	Plug 'jreybert/vimagit'
	if has('nvim') || has('patch-8.0.902')
		Plug 'mhinz/vim-signify'
	else
		Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
	endif

	" HTML/CSS/JS Plugins
	Plug 'ap/vim-css-color'
	Plug 'pangloss/vim-javascript'
	Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'

	" C# Plugins
	Plug 'OmniSharp/omnisharp-vim'

call plug#end()

" Coc Config
let g:coc_global_extensions = [
	\ 'coc-tsserver'
	\ ]

" nerd tree configs
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

if executable('rg')
	let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

" omnisharp configuration
inoremap <expr> <Tab> pumvisible() ? '<C-n>' :                                                                                                                    
	\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <C-o><C-r> :!dotnet run

" large file highlight
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" prettier and eslint
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
	let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
	let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
	if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
		silent call CocActionAsync('doHover')
	endif
endfunction

function! s:show_hover_doc()
	call timer_start(100, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

"coc config
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>do <Plug>(coc-codeaction)

" js File import configs
let g:js_file_import_sort_after_insert = 1
let g:js_file_import_use_fzf = 1
let g:js_file_import_use_telescope = 1
nmap <C-i> <Plug>(JsFileImport)
nmap <C-u> <Plug>(PromptJsFileImport)

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" airline config
"let g:airline_powerline_fonts = 1

" light line status bar
let g:lightline = {
			\ 'colorscheme': 'srcery',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
			\ },
			\ 'component': {
			\   'hey parsa': 'work harder please'
			\ },
			\ }

set background=dark
colorscheme srcery
