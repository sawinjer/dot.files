" Plugins
call plug#begin()
  Plug 'sainnhe/everforest'
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  
  " Utils
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ap/vim-css-color'
  Plug 'preservim/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " Completion / linters / formatters
  Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}
  Plug 'plasticboy/vim-markdown'
  Plug 'rust-lang/rust.vim'
call plug#end()

" Options
set background=dark
colorscheme everforest
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set hidden
set mouse=a
set number
set title
set wildmenu
set t_Co=256

" Tabs size
set expandtab
set shiftwidth=2
set tabstop=2

" Support italic fonts (idk how it works, but it works :D)
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Automatic syntax support for files
filetype plugin indent on
syntax on

" File browser
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let NERDTreeQuitOnOpen=1 
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Enable custom file browser
let NERDTreeShowHidden=1

" Enables custrom tray
let g:airline#extensions#tabline#enabled = 1

"Enable ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Language server stuff
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Normal mode remappings
nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>

" Tabs
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>

" COC
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent><A-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Rust

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

