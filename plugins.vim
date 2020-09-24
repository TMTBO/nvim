" vim-plug
"
  
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" INstall Plugins with vim-plug {{{

call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Pretty Dress
Plug 'bling/vim-bufferline'
Plug 'bpietravalle/vim-bolt'
Plug 'theniceboy/vim-deus'

"Plug 'arzg/vim-colors-xcode'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" General Highlighter
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'RRethy/vim-illuminate'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'junegunn/fzf.vim'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'kevinhwang91/rnvimr'
" Plug 'airblade/vim-rooter'
" Plug 'pechorin/any-jump.vim'

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Git
" Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
" Plug 'cohama/agit.vim'

" Autoformat
" Plug 'Chiel92/vim-autoformat'

" Swift

Plug 'keith/swift.vim'
Plug 'arzg/vim-swift'

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
" Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
" Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

call plug#end()

" }}}

" Plug configs {{{

" airline {{{

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0


" }}}

" coc {{{

let g:coc_global_extensions = [
				\ 'coc-marketplace',
        \ 'coc-actions',
        \ 'coc-css',
        \ 'coc-diagnostic',
        \ 'coc-explorer',
        \ 'coc-flutter-tools',
        \ 'coc-gitignore',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-lists',
        \ 'coc-prettier',
        \ 'coc-pyright',
        \ 'coc-python',
        \ 'coc-snippets',
        \ 'coc-sourcekit',
        \ 'coc-stylelint',
        \ 'coc-syntax',
        \ 'coc-tasks',
        \ 'coc-todolist',
        \ 'coc-translator',
        \ 'coc-tslint-plugin',
        \ 'coc-tsserver',
        \ 'coc-vimlsp',
        \ 'coc-vetur',
        \ 'coc-yaml',
        \ 'coc-yank']

" }}}



" }}}
