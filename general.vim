" Neovim Settings
" === 

" General {{{

set number
set relativenumber
set cursorline
set hidden 			" Hide buffers when abandoned instead of unload
set statusline
set mouse=nv
set modeline

" }}}

" Tabs and Indents {{{

set noexpandtab			" Don't expand tabs to spaces
set tabstop=2			" The number of spaces a tab is
set shiftwidth=2		" Number of spaces to use in auto(indendt)
set textwidth=80		" Text width maxium chars before wrapping
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

" }}}
