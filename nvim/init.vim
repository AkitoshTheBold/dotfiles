call plug#begin('~/.config/nvim/plugins') " initialize plugins
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'valloric/youcompleteme'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-eunuch'
Plug 'aklt/plantuml-syntax', {'for': 'plantuml'}
Plug 'scrooloose/vim-slumlord', {'for': 'plantuml'}
Plug 'tpope/vim-fugitive'
Plug 'frazrepo/vim-rainbow'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-scripts/DrawIt'
Plug 'chamindra/marvim'
Plug 'sjl/gundo.vim'
" Plug 'neoclide/coc.nvim', {'for' : ['scala', 'sbt']}
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['scala','sbt']}
Plug 'jalvesaq/Nvim-R'
call plug#end()

set nocompatible
filetype plugin indent on
syntax on
set lazyredraw                                     "lazily redraw screen while executing macros, and other commands
set ttyfast                                        "more characters will be sent to the screen for redrawing
set ttimeout                                       "time waited for key press(es) to complete...
set ttimeoutlen=50                                 " ...makes for a faster key response
set noswapfile                                     "disable swap files
set autoread                                       "automatically read changes in the file
set hidden                                         "hide buffers instead of closing them even if they contain unwritten changes
set backspace=indent,eol,start                     "make backspace behave properly in insert mode
set clipboard=unnamed                              "use system clipboard; requires has('unnamedplus') to be 1
set wildmenu                                       "better menu with completion in command mode
set wildmode=longest:full,full
set completeopt=longest,menuone,preview            "better insert mode completions
"set nowrap                                         "disable soft wrap for lines
set scrolloff=2                                    "always show 2 lines above/below the cursor
set showcmd                                        "display incomplete commands
set laststatus=2                                   "always display the status bar
set number                                         "display line numbers
set cursorline                                     "highlight current line
set splitbelow                                     "vertical splits will be at the bottom
set splitright                                     "horizontal splits will be to the right
set autoindent                                     "always set autoindenting on
au VimEnter * set formatoptions-=cro                             "disable auto comments on new lines
"set tabstop=2 shiftwidth=2 softtabstop=2 expandtab "use two spaces for indentation
set tabstop=4 shiftwidth=4 softtabstop=4
set noexpandtab                                    "Don't use spaces as tabs
set incsearch                                      "incremental search highlight
set ignorecase                                     "searches are case insensitive...
set smartcase                                      " ..unless they contain at least one capital letter
set hlsearch                                       "highlight search patterns

" ┣ ━           ─ ┃ ┄ ┅ ┋ ┌ └ ┐ ┘ ║ ╠ ═ ➾  ⇒ ╭ ╯ ╰ ╮ ✑ ▷ ⪧ ᐅ ▻ ⫐ ⩥ ⬡ ▶ ⌲ ○ ▸
" 𝂂 𝀈 ؎  𝁠 𝀇 ⟜ ⊸ ⊢ ⊣ 𐎖 "
" ڪ ꘐ
" █ ▉ ▊ ▇ ▒ ▓ ░ ▚ ▞ ▖ ▝ ▘ ▗
set list
set listchars=tab:\|\ "
			"
			"

set termguicolors
set bg=dark
colorscheme gruvbox
"make vim transparent
hi Normal guibg=NONE ctermbg=NONE

" lalala

" Use persistent history.
if !isdirectory($HOME."/.config/nvim/undo-dir")
    call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif
set undodir=/home/aki/.config/nvim/undo-dir
set undofile
au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif

" python source
let g:python_host_prog = '/home/aki/Programs/pyenv/versions/pynvim2/bin/python'
let g:python3_host_prog = '/home/aki/Programs/pyenv/versions/pynvim3/bin/python'
" cursor controls
"set guicursor=n-v-c-i-ci-ve-r-cr:block,o:hor50
"			\,i-r-c-ci-ve-o-cr:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
"			\,sm:block-blinkwait175-blinkoff150-blinkon175



" remove current line highlight in unfocused window
au VimEnter,WinEnter,BufWinEnter,FocusGained,CmdwinEnter * set cul
au WinLeave,FocusLost,CmdwinLeave * set nocul
" remove trailing whitespace on save
autocmd! BufWritePre * :%s/\s\+$//e

" keymaps
let mapleader="\<Space>"

" use Alt + h,j,k,l to navigate
" tnoremap <A-h> <C-\><C-N><C-w>h
" tnoremap <A-j> <C-\><C-N><C-w>j
" tnoremap <A-k> <C-\><C-N><C-w>k
" tnoremap <A-l> <C-\><C-N><C-w>l
" inoremap <A-h> <C-\><C-N><C-w>h
" inoremap <A-j> <C-\><C-N><C-w>j
" inoremap <A-k> <C-\><C-N><C-w>k
" inoremap <A-l> <C-\><C-N><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l


" buffers
" crate a new empty buffer
nnoremap <leader>t :tabe<cr>
" move tab right
nnoremap <Tab> :tabn<cr>
" leader + Tab to switch to previous open buffer
nnoremap <leader><Tab> :tabp<cr>
" leader key twice to cycle between last two open buffers
nnoremap <leader><leader> <c-^>
" save
nnoremap <leader>w :w<cr>
" quit
nnoremap <leader>q :q<cr>
" force quit
nnoremap <leader>Q :q!<cr>
" save and quit
nnoremap <leader>wq :wq<cr>
" replace the word under cursor
nnoremap <leader>r :%s/\<<c-r><c-w>\>//g<left><left>
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

"move to the split in the direction shown, or create a new split
nnoremap <silent> <leader>H :call WinMove('h')<cr>
nnoremap <silent> <leader>J :call WinMove('j')<cr>
nnoremap <silent> <leader>K :call WinMove('k')<cr>
nnoremap <silent> <leader>L :call WinMove('l')<cr>

" Gundo
nnoremap <leader>u :GundoToggle<CR>

" terminal mode
tnoremap <Esc> <C-\><C-n>
au TermOpen * startinsert
nnoremap <C-t> :call NewTermTab()<cr>
nnoremap <leader>s :terminal<cr>
tnoremap <leader>q exit<cr>

function! NewTermTab()
	exec ":tabe"
	exec ":terminal"
endfunction

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" airline
let g:airline_powerline_fonts = 1
"TABLINE:
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 1    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 1     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

"NERDTree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" nerdcommenter
let g:NERDSpaceDelims = 1                               " Adds space after comment delimiter
let g:NERDCompactSexyComs = 1                           " Use compact syntax for prettified multi-line comments
let g:NERDCustomDelimiters = {
			\'c': { 'left': '/**', 'right': '**/'}
			\}
let g:NERDCommentEmptyLines = 1                         " Allow commenting and inverting empty lines (useful when commenting a region)
" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
" au FileType php let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
" au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])  " add <!-- --> pair and remove '{' for html file

" YouCompleteMe
let s:lsp = '~/Programs/lsp'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_language_server = [
  \   {
  \     'name': 'angular',
  \     'cmdline': [ 'node' ,
  \        expand( s:lsp . '/angular/node_modules/@angular/language-server' ),
  \        '--ngProbeLocations',
  \        expand( s:lsp . '/angular/node_modules/' ),
  \        '--tsProbeLocations',
  \        expand( s:lsp . '/angular/node_modules/' ),
  \        '--stdio' ],
  \     'filetypes': [ 'ts','html' ],
  \   },
  \   {
  \     'name': 'bash',
  \     'cmdline': [ 'node', expand( s:lsp . '/bash/node_modules/.bin/bash-language-server' ), 'start' ],
  \     'filetypes': [ 'sh', 'bash' ],
  \   },
  \   {
  \     'name': 'groovy',
  \     'cmdline': [ 'java', '-jar', expand( s:lsp . '/groovy/groovy-language-server/build/libs/groovy-language-server-all.jar' ) ],
  \     'filetypes': [ 'groovy' ]
  \   },
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ 'node', expand( s:lsp . '/yaml/node_modules/.bin/yaml-language-server' ), '--stdio' ],
  \     'filetypes': [ 'yaml' ],
  \   },
  \   {
  \     'name': 'json',
  \     'cmdline': [ 'node', expand( s:lsp . '/json/node_modules/.bin/vscode-json-languageserver' ), '--stdio' ],
  \     'filetypes': [ 'json' ],
  \   },
  \   {
  \     'name': 'kotlin',
  \     'filetypes': [ 'kotlin' ],
  \     'cmdline': [ expand( s:lsp . '/kotlin/server/build/install/server/bin/server' ) ],
  \   },
  \   {
  \     'name': 'd',
  \     'filetypes': [ 'd' ],
  \     'cmdline': [ expand( s:lsp . '/d/serve-d' ) ],
  \   },
  \   {
  \     'name': 'vue',
  \     'filetypes': [ 'vue' ],
  \     'cmdline': [ expand( s:lsp . '/vue/node_modules/.bin/vls' ) ]
  \   },
  \   {
  \     'name': 'docker',
  \     'filetypes': [ 'dockerfile' ],
  \     'cmdline': [ expand( s:lsp . '/docker/node_modules/.bin/docker-langserver' ), '--stdio' ]
  \   },
  \   {
  \     'name': 'vim',
  \     'filetypes': [ 'vim' ],
  \     'cmdline': [ expand( s:lsp . '/vim/node_modules/.bin/vim-language-server' ), '--stdio' ]
  \   },
  \   {
  \     'name': 'purescript',
  \     'filetypes': [ 'purescript' ],
  \     'cmdline': [ expand( s:lsp . '/vim/node_modules/.bin/purescript-language-server' ), '--stdio' ],
  \   },
  \   {
  \     'name': 'fortran',
  \     'filetypes': [ 'fortran' ],
  \     'cmdline': [ 'fortls' ],
  \   },
  \   {
  \     'name': 'haskell',
  \     'filetypes': [ 'haskell', 'hs', 'lhs' ],
  \     'cmdline': [ 'hie-wrapper', '--lsp' ],
  \     'project_root_files': [ '.stack.yaml', 'cabal.config', 'package.yaml' ],
  \   },
  \   {
  \     'name': 'lua',
  \     'filetypes': [ 'lua' ],
  \     'cmdline': [ expand( s:lsp . '/lua/lua-language-server/root/extension/server/bin/macOS/lua-language-server'),
  \                  expand( s:lsp . '/lua/lua-language-server/root/extension/server/main.lua' ) ],
  \   },
  \   {
  \     'name': 'dart',
  \     'cmdline': [ 'dart', expand( s:lsp . '/dart/analysis_server.dart.snapshot' ), '--lsp' ],
  \     'filetypes': [ 'dart' ],
  \   },
  \   {
  \     'name': 'rust',
  \     'filetypes': [ 'rust' ],
  \     'cmdline': [ expand( s:lsp .  '/rust/rust-analyzer/target/release/rust-analyzer' ) ],
  \     'project_root_files': [ 'Cargo.toml' ],
  \   },
  \   {
  \     'name': 'julia',
  \     'filetypes': [ 'julia' ],
  \     'project_root_files': [ 'Project.toml' ],
  \     'cmdline': [""],
  \   },
  \   {
  \     'name': 'ruby',
  \     'cmdline': [ expand( s:lsp . '/ruby/bin/solargraph' ), 'stdio' ],
  \     'filetypes': [ 'ruby' ],
  \   },
  \   {
  \     'name': 'php',
  \     'cmdline': [ 'php', expand( s:lsp . '/php/vendor/bin/php-language-server.php' ) ],
  \     'filetypes': [ 'php' ],
  \   },
  \ ]
  " \   {
  " \     'name': 'scala',
  " \     'filetypes': [ 'scala' ],
  " \     'cmdline': [ 'metals-vim' ],
  " \     'project_root_files': [ 'build.sbt' ]
  " \   },




" list filetypes :echo join(map(split(globpath(&rtp, 'ftplugin/*.vim'), '\n'), 'fnamemodify(v:val, ":t:r")'), "\n")

" table-mode
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
let g:table_mode_corner='+'
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'


" devicons
let g:WebDevIconsOS = 'Linux'
"let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {'.*kotlin.*\.kt$':''} " needed

" rainbow parans
let g:rainbow_active = 1

" Gundo
let g:gundo_prefer_python3 = 1

" compilation
" list of compilers by language
let g:compilers = {
			\"c": "!gcc '%' -o '%:r'",
			\"cpp": "!g++ '%' -o '%:r'",
			\"vim":"echo 'Cannot Compile'",
			\"markdown":"!pandoc '%' --highlight=breezedark -o '%:r'.pdf",
			\"python":"!python '%'",
			\"rust":"!cargo build",
			\"java":"!javac '%'",
			\"tex":"!pdflatex '%'",
			\"nroff":"!pdfroff -ms '%' > '%:r'.pdf"}

function! Compile(ft)
		exec "w"
		exec g:compilers[a:ft]
endfunction

let g:autoCompilers = {
			\"markdown":"!echo '%'  | entr pandoc '%' --highlight=breezedark -o '%:r'.pdf &",
			\"tex":"!echo '%'  | entr pdflatex '%' &",
			\ "nroff":"!echo '%'  | entr groff -ms '%' -T pdf > '%:r'.pdf &"}

function! AutoCompile(ft)
		exec "w"
		exec g:autoCompilers[a:ft]
endfunction


let g:executors = {
			\"c":":terminal ./'%:r'",
			\"cpp": ":terminal ./'%:r'",
			\"vim":"echo 'Cannot Execute'",
			\"markdown":"!zathura ''%:r'.pdf' &",
			\"python":":terminal python '%:r'.py",
			\"rust":":terminal cargo run",
			\"java":":terminal java '%:r'",
			\"tex":"!zathura ''%:r'.pdf' &",
			\"nroff":"!zathura ''%:r'.pdf' &"}

function! Exec(ft)
	if(&modified==1)
		call Compile(a:ft)
	endif
	let l:ex = g:executors[a:ft]
	let l:cmd = l:ex
	if (match(l:ex,"%") >= 0)
		" evaluates the command with filename.
		" :echo expand(%) -> filename relative to pwd of vim
		" :echo expans(%:r) -> filename without extension
		let l:cmd = l:ex[:match(l:ex,"'%:r'")-1].expand("%:r").l:ex[match(l:ex,"'%:r'")+5:]
	endif
	if (match(l:ex,"terminal") >= 0)
		exec ":tabe"
	endif
	exec l:cmd
endfunction

" keymaps
nnoremap <silent> <leader>c :call Compile(&filetype)<cr>
nnoremap <silent> <leader>ac :call AutoCompile(&filetype)<cr>
nnoremap <silent> <leader>e :call Exec(&filetype)<cr>
