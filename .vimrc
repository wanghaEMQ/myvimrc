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
filetype off

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
set foldenable
"""""""""""""""""设置折叠"""""""""""""""""""""
"
"根据语法折叠
set fdm=syntax

"手动折叠
set fdm=manual

"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"不要闪烁
set novisualbell

"启动显示状态行
set laststatus=2

"显示位置
set ruler

"浅色显示当前行
"autocmd InsertLeave * se nocul

"用浅色高亮当前行
"autocmd InsertEnter * se cul
se cul

"显示输入的命令
set showcmd

"被分割窗口之间显示空白
set fillchars=vert:/

set fillchars=stl:/

set fillchars=stlnc:/

set splitright
set splitbelow

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Nul> <C-W><C-W>
tnoremap <C-N> <C-\><C-N>

" CTags about
map <C-]> :split <CR>:exec("tag ".expand("<cword>"))<CR>
set tags+=~/docu/git/nanomq/tags
set tags+=~/docu/git/wanghaNanomq/nanomq/tags
set tags+=~/docu/git/toilet/tags
"set tags+=~/docu/git/nng/tags

" -------------  
" Vundle  
" https://github.com/gmarik/Vundle.vim  
" -------------  
  
" set the runtime path to include Vundle and initialize  
set rtp+=~/.vim/bundle/Vundle.vim  
call vundle#begin()  
" alternatively, pass a path where Vundle should install plugins  
"call vundle#begin('~/some/path/here')  
  
" let Vundle manage Vundle, required  
Plugin 'gmarik/Vundle.vim'  
  
" The following are examples of different formats supported.  
" Keep Plugin commands between vundle#begin/end.  
" plugin on GitHub repo  
" Plugin 'tpope/vim-fugitive'  
" plugin from http://vim-scripts.org/vim/scripts.html  
""Plugin 'L9'  
" Git plugin not hosted on GitHub  
" Plugin 'git://git.wincent.com/command-t.git'  
" git repos on your local machine (i.e. when working on your own plugin)  
" Plugin 'file:///home/gmarik/path/to/plugin'  
" The sparkup vim script is in a subdirectory of this repo called vim.  
" Pass the path to set the runtimepath properly.  
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}  
" Avoid a name conflict with L9  
""Plugin 'user/L9', {'name': 'newL9'}

" Install Vim-go  
" Plugin 'fatih/vim-go' 
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
" Plugin 'SirVer/ultisnips'
  
" All of your Plugins must be added before the following line  
call vundle#end()            " required  
filetype plugin indent on    " required  
" To ignore plugin indent changes, instead use:  
"filetype plugin on  
"  
" Brief help  
" :PluginList       - lists configured plugins  
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate  
" :PluginSearch foo - searches for foo; append `!` to refresh local cache  
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal  
"  
" see :h vundle for more details or wiki for FAQ  
" Put your non-Plugin stuff after this line

" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = '<C-Space>'
" let g:ycm_filetype_specific_completion_to_disable = {'c':1 , 'cpp':1}
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_min_num_of_chars_for_completion = 1

" UltiSnips setting
" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" airline setting
let g:airline_theme='base16_bespin'
" let g:airline_theme='molokai'
" let g:airline#extensions#tabline#enabled = 1


" nmap <leader>1 <Plug>AirlineSelectTab1

"statusline                                                                                                                                
" set statusline=
" set statusline+=%7*\[%n]                                  "buffernr
" set statusline+=%9*\ %<%m%r%w\ %P\                        "Modified? Read only? Top/bottom
" set statusline+=%2*\ %y\                                  "文件类型
" set statusline+=%4*\ %{&ff}\                              "文件系统(dos/unix..) 
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "语言 & 是否高亮，H表示高亮?
" set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "编码1
" set statusline+=%3*\ %{(&bomb?\",bom\":\"\")}           "编码2
" set statusline+=%1*\ %f\                                  "文件路径
" set statusline+=%8*\ %=\ row:%l/%L " (%03p%%)\            "光标所在行号/总行数 (百分比)
" set statusline+=%6*\ (%03p%%)  
" set statusline+=%9*\ col:%03c\                            "光标所在列
function! HighlightSearch()
      if &hls
          return 'H'
      else
          return 'h'
      endif
endfunction
hi User1 ctermfg=white  ctermbg=darkred
hi User2 ctermfg=blue  ctermbg=58
hi User3 ctermfg=white  ctermbg=100
hi User4 ctermfg=darkred  ctermbg=95
hi User5 ctermfg=darkred  ctermbg=77
hi User6 ctermfg=white  ctermbg=blue
hi User7 ctermfg=darkred  ctermbg=blue  cterm=bold
hi User8 ctermfg=231  ctermbg=blue
hi User9 ctermfg=blue  ctermbg=black
hi User0 ctermfg=yellow  ctermbg=13

set tags=./tags;/

"vimdiff config
" 新增的行 "
highlight DiffAdd ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse gui=reverse
" 删除的行 "
highlight DiffDelete ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse gui=reverse
" 差异的行 "
highlight DiffChange ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse gui=reverse
" 差异的文字 "
highlight DiffText ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse gui=reverse

