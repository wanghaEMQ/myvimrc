"显示行号
set nu

"启动时隐去援助提示
set shortmess=atI

"语法高亮
syntax on

"使用vim的键盘模式
set nocompatible

"设置UTF-8
set encoding=utf-8
set fileencodings=utf-8,gbk

"require
filetype on

"不需要备份
set nobackup

"没有保存或文件只读时弹出确认
set confirm

"显示绝对路径
"set statusline=%F

"鼠标可用
set mouse=a

"tab缩进
set tabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

"文件自动检测外部更改
set autoread

"c文件自动缩进
set cindent

"自动对齐
set autoindent

"智能缩进
set smartindent

"高亮查找匹配
set hlsearch

"搜索忽略大小写
set ignorecase

"背景色
set background=dark

"显示匹配
set showmatch

"显示标尺，就是在右下角显示光标位置
set ruler

"允许折叠
set nofoldenable
"""""""""""""""""设置折叠"""""""""""""""""""""
"
"根据marker折叠
set foldmethod=marker

"bugs in nvim?
autocmd! Syntax c,cpp,h,cc normal zA
autocmd! Syntax c,cpp,h,cc normal zR

"手动折叠
"set fdm=manual
"set foldmethod=indent

"设置键盘映射，通过空格设置折叠
nnoremap <space> zA
""""""""""""""""""""""""""""""""""""""""""""""
"不要闪烁
set novisualbell

"启动显示状态行
set laststatus=2

"显示位置
set ruler

"用浅色高亮当前行
"autocmd InsertEnter * se cul
se cul

"显示输入的命令
set showcmd

"Make vimdiff not readonly
if &diff
	set noro
endif

"被分割窗口之间显示空白
set fillchars=vert:/

set fillchars=stl:/

set fillchars=stlnc:/

"split时右下优先
set splitright
set splitbelow

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-M> <C-W><C-W>
tnoremap <C-N> <C-\><C-N>

" CTags about
set tags=./tags;/

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'will133/vim-dirdiff'
Plug 'mtikekar/vim-bsv'
Plug 'rhysd/vim-clang-format'
Plug 'luochen1990/rainbow'
Plug 'yegappan/taglist'
" Theme
Plug 'gilgigilgil/anderson.vim'
Plug 'ajmwagar/vim-deus'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Plug 'fatih/vim-go' 
" Plug 'SirVer/ultisnips'

call plug#end()

" -------------
" Vundle (abandoned now)
" https://github.com/gmarik/Vundle.vim
" -------------
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" Plugin 'VundleVim/Vundle.vim'
" Plugin 'mtikekar/vim-bsv'

" call vundle#end()

filetype plugin indent on      " required  

" airline setting
" let g:airline_theme='base16_bespin'
let g:airline_theme='base16'
" let g:airline_theme='molokai'
" let g:airline#extensions#tabline#enabled = 1

set hidden

" lc setting
let g:LanguageClient_serverCommands = {
    \ 'rust': ['/home/wangha/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'python': ['/snap/bin/pyls'],
    \ 'c': ['/usr/bin/ccls'],
    \ 'cpp': ['/usr/bin/ccls'],
    \ }

let g:LanguageClient_diagnosticsEnable = 0

" rainbow setting
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Tlist setting
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
" let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1

autocmd FileType c,cc,cpp,h,hpp,py,rs TlistOpen | wincmd p

nmap <silent> gt <Esc>:TlistToggle<Cr>

" Global Theme
colorscheme deus

let g:deoplete#enable_at_startup = 1
" note that if you are using Plug mapping you should not use `noremap` mappings.

nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent> gh <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nmap <silent> gr <Plug>(lcn-references)
nmap <silent> gs <Plug>(lcn-symbols)
nmap <silent> gl <Plug>(lcn-highlight)

set statusline+=%9*\ col:%03c\                            "光标所在列
function! HighlightSearch()
      if &hls
          return 'H'
      else
          return 'h'
      endif
endfunction

" User color schema
hi User1 ctermfg=white   ctermbg=darkred
hi User2 ctermfg=blue    ctermbg=58
hi User3 ctermfg=white   ctermbg=100
hi User4 ctermfg=darkred ctermbg=95
hi User5 ctermfg=darkred ctermbg=77
hi User6 ctermfg=white   ctermbg=blue
hi User7 ctermfg=darkred ctermbg=blue  cterm=bold
hi User8 ctermfg=231     ctermbg=blue
hi User9 ctermfg=blue    ctermbg=black
hi User0 ctermfg=yellow  ctermbg=13

"vimdiff config
" 新增的行 "
highlight DiffAdd ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
" 删除的行 "
highlight DiffDelete ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
" 差异的行 "
highlight DiffChange ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
" 差异的文字 "
highlight DiffText ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse

