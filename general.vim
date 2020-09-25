" Neovim Settings
" === 

set number
set relativenumber
set cursorline
set hidden 			" Hide buffers when abandoned instead of unload
"set statusline
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set modeline

set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path+=**                 " Directories to search when using gf and friends
set isfname-==               " Remove =, detects filename in var=/foo/bar
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=2500           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions-=o         " Disable comment-continuation (normal 'o'/'O')

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endi

" What to save for views and sessions:
set viewoptions=folds,cursor,curdir,slash,unix
set sessionoptions=curdir,help,tabpages,winsize

if has('mac') && has('vim_starting')
	let g:clipboard = {
		\   'name': 'macOS-clipboard',
		\   'copy': {
		\      '+': 'pbcopy',
		\      '*': 'pbcopy',
		\    },
		\   'paste': {
		\      '+': 'pbpaste',
		\      '*': 'pbpaste',
		\   },
		\   'cache_enabled': 0,
		\ }
endif

if has('clipboard') && has('vim_starting')
	set clipboard& clipboard+=unnamedplus
endif

" colorscheme hybrid

" }}}

" Tabs and Indents {{{

set noexpandtab			" Don't expand tabs to spaces
set tabstop=4			" The number of spaces a tab is
set shiftwidth=4		" Number of spaces to use in auto(indendt)
set textwidth=100		" Text width maxium chars before wrapping
set softtabstop=-1		" Automatically keeps in sync with shiftwidth
set smarttab			" Tab insert blanks according to 'shiftwidth'
set shiftround 			" Round indent to multiple of 'shiftwidth'


" }}}

" Searching {{{

set ignorecase    " Search ignoring case
set smartcase     " Keep case when searching with *
set infercase     " Adjust case in insert completion mode
set incsearch     " Incremental search
set wrapscan      " Searches wrap around the end of the file

set complete=.,w,b,k  " C-n completion: Scan buffers, windows and dictionary

if exists('+inccommand')
	set inccommand=nosplit
endif

if executable('rg')
	set grepformat=%f:%l:%c:%m
	let &grepprg =
		\ 'rg --hidden --vimgrep' . (&smartcase ? ' --smart-case' : '') . ' --'
elseif executable('ag')
	set grepformat=%f:%l:%c:%m
	let &grepprg =
		\ 'ag --hidden --vimgrep' . (&smartcase ? ' --smart-case' : '') . ' --'
endif

" }}}

" Behavior {{{
" --------
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,vsplit    " Jump to the first open window
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
set completeopt=menu,menuone    " Always show menu, even for one item
set completeopt+=noselect       " Do not select a match in the menu

if exists('+completepopup')
	set completeopt+=popup
	set completepopup=height:4,width:60,highlight:InfoPopup
endif

if has('patch-7.4.775')
	" Do not insert any text for a match until the user selects from menu
	set completeopt+=noinsert
endif

if has('patch-8.1.0360') || has('nvim-0.4')
	set diffopt+=internal,algorithm:patience
	" set diffopt=indent-heuristic,algorithm:patience
endif

" Use the new Neovim :h jumplist-stack
if has('nvim-0.5')
	set jumpoptions=stack
endif

" }}}

" Editor UI {{{
" --------------------
set noshowmode          " Don't show mode in cmd window
set shortmess=aoOTI     " Shorten messages and don't show intro
set scrolloff=2         " Keep at least 2 lines above/below
set sidescrolloff=5     " Keep at least 5 lines left/right
set nonumber            " Don't show line numbers
set noruler             " Disable default status ruler
set list                " Show hidden characters

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
" set winheight=4         " Minimum height for active window
" set winminheight=4      " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

set showcmd             " Show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
set laststatus=2        " Always show a status line
set colorcolumn=+0      " Column highlight at textwidth's max character-limit
set display=lastline

if has('folding') && has('vim_starting')
	set foldenable
	set foldmethod=indent
	set foldlevelstart=99
endif

if has('nvim-0.4')
	set signcolumn=auto:1
else
	set signcolumn=auto          " Always show signs column
endif

" UI Symbols
" icons:  ▏│ ¦ ╎ ┆ ⋮ ⦙ ┊ 
let &showbreak='↳  '
set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·
" set fillchars=foldopen:O,foldclose:x
" set fillchars=vert:▉,fold:─

if has('patch-7.4.314')
	" Do not display completion messages
	set shortmess+=c
endif

if has('patch-7.4.1570')
	" Do not display message when editing files
	set shortmess+=F
endif

if has('conceal') && v:version >= 703
	" For snippet_complete marker
	set conceallevel=2 concealcursor=niv
endif

if exists('+previewpopup')
	set previewpopup=height:10,width:60
endif

" Pseudo-transparency for completion menu and floating windows
if &termguicolors
	if exists('&pumblend')
		set pumblend=10
	endif
	if exists('&winblend')
		set winblend=10
	endif
endif

" }}}

" Coc {{{

set updatetime=100
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
 else
  set signcolumn=yes
endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }}}

" Powerline {{{

" let g:powerline_pycmd = 'py3'
" set rtp+=/usr/local/lib/python3.8/site-packages/powerline/bindings/vim
set laststatus=2
set showtabline=2
set noshowmode
set t_Co =256
set guifont=Source\ Code\ Pro\ for\ Powerline:h15:cANSI

" }}}
