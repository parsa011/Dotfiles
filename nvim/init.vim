filetype plugin indent on
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set autoread
set backspace=indent,eol,start
set breakindent
set clipboard=unnamed
set cmdheight=2
set confirm
set cursorline
set display+=lastline
set expandtab
set fileformat=unix
set foldmethod=syntax
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set hidden
set hlsearch
set ignorecase
set laststatus=2
set magic
set mouse=a
set noic
set nolazyredraw
set noshowmode
set noswapfile
set notimeout ttimeout ttimeoutlen=200
set number
set nuw=6
set relativenumber number
set ruler
set scrolloff=4
set shiftwidth=4
set showbreak=↪
set showcmd
set showtabline=2
set sidescroll=10
set smartcase
set softtabstop=2
set splitbelow
set splitright
set switchbuf=usetab
set tabstop=4
set tags=./tags,tags;/
set termguicolors
set undodir="$HOME/.vim_undo_files"
set undofile
set undolevels=1000
set visualbell
set wrapscan

hi Search cterm=NONE ctermfg=black ctermbg=yellow

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end



" *******         LOAD PLUGINS          *******

call plug#begin('~/AppData/Local/nvim/plugged')

if has ('nvim')
  Plug 'neovim/python-client'
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  "Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'airblade/vim-gitgutter'
"Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'alvan/vim-closetag'
Plug 'artnez/vim-wipeout'
"Plug 'carlitux/deoplete-flow', { 'for': ['handlebars', 'html', 'javascript'] }
"Plug 'carlitux/deoplete-flow'
"Plug 'carlitux/deoplete-ternjs'
"Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['handlebars', 'html', 'javascript'] }
"Plug 'hail2u/vim-css3-syntax', { 'for': ['handlebars', 'html', 'javascript'] }
Plug 'hail2u/vim-css3-syntax'
Plug 'HerringtonDarkholme/yats.vim'
"Plug '/opt/local/bin/fzf'
"Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
"Plug 'lambdalisue/gina.vim'
"Plug 'majutsushi/tagbar'
"Plug 'mattn/emmet-vim', { 'for': ['handlebars', 'html', 'css', 'less', 'sass', 'scss'] }
Plug 'mattn/emmet-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
"Plug 'mustache/vim-mustache-handlebars', { 'for': ['handlebars'] }
"Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'OrangeT/vim-csharp', { 'for': ['asp', 'aspx'] }
"Plug 'othree/jspc.vim', { 'for': ['handlebars', 'html', 'javascript'] }
Plug 'othree/jspc.vim'
"Plug 'othree/html5.vim', { 'for': ['handlebars', 'html', 'javascript'] }
Plug 'othree/html5.vim'
"Plug 'pangloss/vim-javascript', { 'for': ['handlebars', 'html', 'javascript'] }
"Plug 'pangloss/vim-javascript'
"Plug 'posva/vim-vue'
Plug 'Raimondi/delimitMate'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sgur/vim-editorconfig'
Plug 'sheerun/vim-polyglot'
"Plug 'Shougo/denite.nvim'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'sickill/vim-pasta'
"Plug 'ternjs/tern_for_vim', { 'for': ['handlebars', 'html', 'javascript'] }
"Plug 'ternjs/tern_for_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'thaerkh/vim-workspace'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'wincent/ferret'
Plug 'zivyangll/git-blame.vim'

call plug#end()



" *******      CUSTOM KEY MAPPINGS      *******

" remove search highlights
nnoremap <CR>             :noh<CR><CR>

" don't copy deleted text to register
nnoremap d                "_d
vnoremap d                "_d

" restores register's content after paste
"vnoremap <silent> <expr> p <sid>Repl()
xnoremap <expr> p         'pgv"'.v:register.'y'

" auto indent after paste
nnoremap p                p=`]
nnoremap P                P=`]

" Toggle diff view on the left, center, or right windows
nmap <silent> <leader>dl  :call DiffToggle(1)<CR>
nmap <silent> <leader>dc  :call DiffToggle(2)<CR>
nmap <silent> <leader>dr  :call DiffToggle(3)<CR>

" jump to buffer
nnoremap <leader>d        :bd<CR>
nnoremap <leader>l        :ls<CR>
nnoremap <leader>n        :bn<CR>
nnoremap <leader>p        :bp<CR>
nnoremap <leader>1        :1b<CR>
nnoremap <leader>2        :2b<CR>
nnoremap <leader>3        :3b<CR>
nnoremap <leader>4        :4b<CR>
nnoremap <leader>5        :5b<CR>
nnoremap <leader>6        :6b<CR>
nnoremap <leader>7        :7b<CR>
nnoremap <leader>8        :8b<CR>
nnoremap <leader>9        :9b<CR>
nnoremap <leader>0        :10b<CR>



" *******        PLUGIN CONFIG          *******

" alvan/vim-closetag
let g:closetag_filenames = '*.html, *.htm, *hb, *hbs, *.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'


" lambdalisue/gina.vim
nnoremap <leader>ga       :Gina add %<CR>
nnoremap <leader>gA       :Gina add .<CR>
nnoremap <leader>gb       :Gina blame<CR>
nnoremap <leader>gB       :Gina branch<CR>
nnoremap <leader>gc       :Gina commit<CR>
nnoremap <leader>gd       :Gina diff<CR>
nnoremap <leader>gG       :Gina grep<CR>
nnoremap <leader>gh       :Gina show<CR>
nnoremap <leader>gi       :Gina ls<CR>
nnoremap <leader>gl       :Gina log<CR>
nnoremap <leader>gp       :Gina push<CR>
nnoremap <leader>gr       :Gina reflog<CR>
nnoremap <leader>gs       :Gina status<CR>
nnoremap <leader>gS       :Gina stash<CR>
nnoremap <leader>gt       :Gina tag<CR>




" juvenn/mustache.vim
let g:mustache_abbreviations = 1


" majutsushi/tagbar
nmap <F3>                 :TagbarToggle<CR>

let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_foldlevel = 0


let g:tagbar_type_css = {
  \ 'ctagstype' : 'css',
    \ 'kinds' : [
      \ 'c:class',
      \ 'i:id',
      \ 'm:media',
      \ 't:tag'
    \ ],
    \ 'sort' : 1
\ }

let g:tagbar_type_html = {
  \ 'ctagstype' : 'html',
    \ 'kinds' : [
      \ 'i:identifiers',
      \ 'c:classes'
    \ ],
    \ 'sort' : 1
\ }

let g:tagbar_type_javascript = {
  \ 'ctagstype' : 'js',
    \ 'kinds' : [
      \ 'a:array',
      \ 'b:boolean',
      \ 'c:class',
      \ 'f:function',
      \ 'm:method',
      \ 'n:number',
      \ 'o:object',
      \ 's:string',
      \ 'v:variable'
    \ ],
    \ 'sort' : 1
\ }

let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3',
    \ ],
    \ 'sort' : 0
\ }

let g:tagbar_type_scss = {
  \ 'ctagstype' : 'scss',
    \ 'kinds' : [
      \ 'c:class',
      \ 'd:media',
      \ 'f:function',
      \ 'i:ids',
      \ 't:tag',
      \ 'm:mixin'
    \ ],
    \ 'sort' : 1
\ }

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
    \ 'kinds': [
      \ 'c:classes',
      \ 'n:modules',
      \ 'f:functions',
      \ 'v:variables',
      \ 'v:varlambdas',
      \ 'm:members',
      \ 'i:interfaces',
      \ 'e:enums',
      \ 'I:imports'
  \ ],
  \ 'sort' : 1
\ }


" maksimr/vim-jsbeautify
autocmd FileType javascript noremap <buffer> <F4>   :call JsBeautify()<CR>
autocmd FileType json noremap <buffer> <F4>         :call JsonBeautify()<CR>
autocmd FileType jsx noremap <buffer> <F4>          :call JsxBeautify()<CR>
autocmd FileType html noremap <buffer> <F4>         :call HtmlBeautify()<CR>
autocmd FileType css noremap <buffer> <F4>          :call CSSBeautify()<CR>
autocmd FileType javascript vnoremap <buffer> <F4>  :call RangeJsBeautify()<CR>
autocmd FileType json vnoremap <buffer> <F4>        :call RangeJsonBeautify()<CR>
autocmd FileType jsx vnoremap <buffer> <F4>         :call RangeJsxBeautify()<CR>
autocmd FileType html vnoremap <buffer> <F4>        :call RangeHtmlBeautify()<CR>
autocmd FileType css vnoremap <buffer> <F4>         :call RangeCSSBeautify()<CR>


" mattn/emmet-vim
"let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \  'extends' : 'jsx',
  \ },
\ }


" mxw/vim-jsx
let g:jsx_ext_required = 0

" rafi/awesome-vim-colorschemes
set background=dark
colorscheme solarized8


" scrooloose/nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeWinSize = 40
let g:nerdtree_tabs_open_on_console_startup = 1
let g:acp_enableAtStartup = 0
let NERDTreeIgnore=['\.DS_Store', '\$HOME$', '\.swp']
let NERDTreeMapActivateNode='<RIGHT>'

" Autoclose on quit if NERDTree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" sgur/vim-editorconfig
let g:editorconfig_blacklist = {
  \ 'filetype': ['git.*', 'fugitive'],
  \ 'pattern': ['\.un~$']
\ }

" Shuogo/deoplet
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#flow#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue'
\ ]
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue'
\ ]
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\ ]
set completeopt=longest,menuone,preview
let g:deoplete#sources#javascript = ['file', 'ultisnips', 'tern']
"let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'tern']


" Shuogo/neosnippet
"let g:neosnippet#enable_completed_snippet = 1

"if has('nvim')
  "let g:neosnippet#snippets_directory='~/.local/share/nvim/site/plugged/vim-snippets/snippets'
"else
  "let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
"endif

"imap <expr><TAB>
  "\ pumvisible() ? "\<C-n>" :
  "\ neosnippet#expandable_or_jumpable() ?
  "\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  "\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" Expands or completes the selected snippet/item in the popup menu
"imap <expr><silent><CR> pumvisible() ? deoplete#mappings#close_popup() .
  "\ "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
"smap <silent><CR> <Plug>(neosnippet_jump_or_expand)


" carlitux/deoplete-ternjs
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
"let g:tern#command = ["tern"]
"let g:tern#arguments = ["--persistent"]


" ternjs/tern_for_vim
"let g:tern#command = ['tern']
"let g:tern#arguments = ['--persistent']
"let g:tern_show_argument_hints = 'on_hold'
"let g:tern_show_signature_in_pum = 1
"autocmd FileType javascript setlocal omnifunc=tern#Complete


" thaerkh/vim-workspace
let g:workspace_session_disable_on_args = 1
nnoremap <leader>ss        :ToggleWorkspace<CR>

" tiagofumo/vim-nerdtree-syntax-highlight
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" w0rp/ale
let g:ale_completion_enabled = 1
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
\}
let g:ale_linters = {
  \ 'css': ['stylelint'],
  \ 'html': ['htmlhint'],
  \ 'hbs': ['htmlhint', 'stylelint', 'eslint'],
  \ 'javascript': ['eslint'],
  \ 'json': ['jsonlint'],
  \ 'less': ['lesshint'],
  \ 'sass': ['stylelint'],
  \ 'scss': ['stylelint'],
  \ 'vim': ['vimlint']
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 0
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_echo_msg_format = '[%linter%] %s'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" zivyangll/git-blame.vim
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>


" *******       CUSTOM FUNCTIONS        *******

function! MyColors()
  highlight clear SignColumn
  highlight ColorColumn guibg=#073642
  set colorcolumn=100
endfunction

autocmd VimEnter,BufEnter,WinEnter * call MyColors()


" remove trailing whitespace on save
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()


" update ctags file on file write
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction

autocmd BufWritePost *.coffee,*.css,*.htm,*.html,*.js,*.less,*.md,*.sass,*.scss,*.ts call UpdateTags()


" restores register's content after paste
"function! RestoreRegister()
  "let @" = s:restore_reg
  "return ''
"endfunction

"function! s:Repl()
  "let s:restore_reg = @"
  "if &clipboard == "unnamed"
    "let @* = s:restore_reg
  "endif
  "return "p@=RestoreRegister()\<cr>"
"endfunction


" Disable one diff window during a three-way diff allowing
" you to cut out the noise of a three-way diff and focus on
" just the changes between two versions at a time.
function! DiffToggle(window)
  " Save the cursor position and turn on diff for all windows
  let l:save_cursor = getpos('.')
  windo :diffthis
  " Turn off diff for the specified window (but keep scrollbind)
  " and move the cursor to the left-most diff window
  exe a:window . "wincmd w"
  diffoff
  set scrollbind
  set cursorbind
  exe a:window . "wincmd " . (a:window == 1 ? "l" : "h")
  " Update the diff and restore the cursor position
  diffupdate
  call setpos('.', l:save_cursor)
endfunction


" Format JavaScript
"autocmd FileType javascript set formatprg=prettier\ --stdin
"autocmd BufWritePre *.js :normal gggqG
"autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"


" Look for updated file on disk
augroup improved_autoread
  autocmd!
  autocmd FocusGained * silent! checktime
  autocmd BufEnter * silent! checktime
augroup end
