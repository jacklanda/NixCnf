"令终端支持256色
set t_Co=256

"MacOs下解决delete/backspace键失效的问题
set backspace=2

"设置Vim主题
colorscheme gruvbox

"重新打开Vim后回到上次退出Vim时的文本位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Vimdiff 主题
if &diff
    colorscheme gruvbox
endif

"set completeopt+=popup
let g:detorte_theme_mode = 'dark'
set background=dark

"文件在Vim之外修改过，自动重新读入
set autoread
set nobackup

"取消警铃
set noerrorbells
set visualbell t_vb=
set t_vb=

"编码设置
set timeoutlen=500
set encoding=UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set termencoding=utf-8
set formatoptions+=m
set formatoptions+=B

"显示光标所在行/列号
set ruler

"显示行号
set number

"超过窗口宽度的行不自动回绕显示
set nowrap

"回显命令
set showcmd
set showmode
set showmatch
set matchtime=2

"Vim查找配置
set hlsearch
set incsearch
set ignorecase                  " 设置搜索时大小写不敏感 "
set smartcase

"Vim制表符设置
set expandtab
set smarttab
set shiftround

"Vim缩进设置
set autoindent smartindent shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4

"Vim显示当前光标位置
set cursorline
set cursorcolumn

"设置鼠标无效
":set mouse=""
"隐藏鼠标
":set mousehide
"Enable mouse (esp. for balloons and scrolling in popups)
"set mouse=a       
" .. also in 'terminals that emit SGR-styled mouse reporting'
"set ttymouse=sgr  
set completeopt="menuone,preview"

"Vim文件类型设置
filetype on
filetype plugin on
filetype indent on
autocmd FileType python,c,cpp set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNew *.py set filetype=python
"autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
"autocmd FileType python exec ":call AutoSetTheme()"

"自动根据文件类型选用主题
function! AutoSetTheme()
    if &filetype == 'c'
        colorscheme gruvbox
    elseif &filetype == 'cpp'
        colorscheme gruvbox
    elseif &filetype == 'python'
        colorscheme gruvbox
    elseif &filetype == 'markdown.mkd'
        colorscheme detorte
    elseif &filetype == 'text'
        colorscheme challenger_deep
    else
        colorscheme fijicat
    endif
endfunc
map <silent><C-t> :call AutoSetTheme() <CR>

augroup tcl_filetype
  au!
  autocmd BufNewFile,BufRead *.tf   set filetype=tcl
  autocmd FileType tcl colorscheme gruvbox
augroup END

"自动设置文件头行
function! AutoSetFileHead()
    " .sh "
    if &filetype == 'sh'
        call setline(1, "\#!/bin/zsh")
    endif
    " python "
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/python3")
        call append(1, "\# -*- coding: utf-8 -*-")
        call append(1, "\# Author: Jacklanda")
    endif
    normal G
    normal o
    normal o
endfunc

" autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
"保存文件时，自动删除多余空格
" fun! <SID>StripTrailingWhitespaces()
    " let l = line(".")
    " let c = col(".")
    " %s/\s\+$//e
    " call cursor(l, c)
" endfun

"撤销配置:
nnoremap U <C-r>
set undolevels=10000              "撤销上限
set undoreload=10000
set undofile
set undodir=$HOME/.vim/.undo/

"修改引导键为逗点
let mapleader=","

"通过j,k,h,l来控制光标的移动
nnoremap <up> k
nnoremap <down> j
nnoremap <left> h
nnoremap <right> l

au InsertLeave * set nopaste

"通过<kj>键快速从插入模式切换回普通模式
"更推荐使用与<ESC>的ASCII码值相同的<C-[>来替代<ESC>
inoremap kj <Esc>
nnoremap <silent><Leader>w :w!<CR>
inoremap <Leader>w <Esc>:w!<CR>
nnoremap q :q<CR>

"复制粘贴
nnoremap <Leader>a ggVG
noremap <leader>c yG
noremap <leader>v p
noremap <leader>d dG

"对当前窗口竖直分屏
nnoremap <S-w> <C-w>v

"匹配结果居中
nnoremap <silent> n nzz
nnoremap <silent> N rzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

"关闭掉上次搜索的高亮
noremap <silent><leader> :nohls<CR>

"复制当前行到行尾的内容
map Y y$

"用;来代替:，省去了按shift
nnoremap ; :
nnoremap . <delete>

"Ctrl+c 将文本内容复制到系统剪贴板
"Ctrl+v 将系统的剪贴板内容复制到Vim中
"set clipboard=unnamedplus
"nnoremap <C-c> +y
"nnoremap <C-v> +p

nnoremap <S-k> gg
nnoremap <S-j> G
nnoremap <S-h> <Home>
nnoremap d<S-h> d<Home>
nnoremap <S-l> <End>
nnoremap d<S-l> d<End>
vnoremap <S-h> <Home>
vnoremap <S-l> <End>h

"快速翻页/删除/复制
nnoremap 1 10
nnoremap 2 20
nnoremap 3 30

let g:powerline_pycmd="py3"
set laststatus=2
syntax on

"按w移动光标到上一个词词首
"按e移动光标到下一个词词首
nnoremap e <S-w>
vnoremap e <S-w>
nnoremap w <S-b>
vnoremap w <S-b>

"代码折叠自定义快捷键
set foldmethod=indent
set foldlevelstart=99 "关闭默认折叠选项"

"折叠方法:
"manual    手工折叠
"indent    使用缩进表示折叠
"expr      使用表达式定义折叠
"syntax    使用语法定义折叠
"diff      对没有更改的文本进行折叠
"marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
auto Filetype python set foldmethod=indent
auto Filetype cpp set foldmethod=indent

nnoremap <F2> :set nu! nu?<CR>
nnoremap <silent><F3> :silent NERDTree<CR>
nnoremap <silent><F4> :silent Vista<CR>
"nnoremap <F4> :TagbarToggle<CR>
nnoremap <silent><F10> : silent UndotreeToggle<CR>

"按<m>快速切换已打开的文件(缓冲)
map <silent>m :silent bn<CR>
map <silent><S-m> :silent bp<CR>
"按<Shift-e>关闭当前文件缓冲
map <silent><S-e> :silent bd<CR>

"按<f>启动LeaderF模糊文件搜索
map <silent>f :Leaderf file --fuzzy --reverse --bottom<CR>
map <silent><leader>f :Leaderf mru --fuzzy --reverse --bottom<CR><TAB>
map <silent><leader>g :Leaderf function --reverse --bottom<CR><TAB>
map <silent>s :silent Startify<CR>

"<F5>一键（编译）运行程序（仅简单测试用）
map <silent> <F5> :call CompileRunGcc()<CR><CR>
func! CompileRunGcc()
silent exec "w"
if &filetype == 'sh'
    silent :!time bash %
elseif &filetype == 'go'
    silent :!clear
    silent :!echo "+-------------------+"
    silent :!echo "|「Go」程序输出为： |"
    silent :!echo "+-------------------+\n"
    silent exec "w"
    silent exec "!go run %"
    call feedkeys("\<C-d>")
elseif &filetype == 'rust'
    silent :!clear
    silent :!echo "+--------------------+"
    silent :!echo "|「Rust」程序输出为：|"
    silent :!echo "+--------------------+\n"
    silent exec "w"
    silent exec "!rustc %"
    silent exec "!./%<"
    call feedkeys("\<C-d>")
elseif &filetype == 'c'
    silent :!clear
    silent :!echo "+------------------+"
    silent :!echo "|「C」程序输出为： |"
    silent :!echo "+------------------+\n"
    silent exec "w"
    silent exec "!gcc % -o %<"
    silent exec "!./%<"
    call feedkeys("\<C-d>")
elseif &filetype == 'cpp'
    silent :!clear
    silent :!echo "+-------------------+"
    silent :!echo "|「Cpp」程序输出为：|"
    silent :!echo "+-------------------+\n"
    silent exec "w"
    silent exec "!g++ -std=c++17 % -o %<"
    silent exec "!./%<"
    call feedkeys("\<C-d>")
    call feedkeys("\<C-z>",'n')
elseif &filetype == 'python'
    silent :!clear
    silent :!echo "+----------------------+"
    silent :!echo "|「Python」脚本输出为：|"
    silent :!echo "+----------------------+\n"
    silent exec "!python3 %"
    call feedkeys("\<C-d>")
    call feedkeys("\<C-z>",'n')
    endif
endfunc

set nocompatible               "去除VI一致性
filetype plugin indent on     "必须加载vim自带和插件相应的语法和文件类型相关脚本

call plug#begin()
"简写形式，只写username/repo即可
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/LeaderF'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'guns/xterm-color-table.vim'
Plug 'yianwillis/vimcdoc'
Plug 'voldikss/vim-translator'
Plug 'bling/vim-bufferline'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'godlygeek/tabular'
Plug 'itchyny/vim-cursorword'
Plug 'lfv89/vim-interestingwords'
Plug 'preservim/nerdcommenter'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'gregsexton/matchtag'
Plug 'w0rp/ale'
Plug 'voldikss/vim-floaterm'
Plug 'obcat/vim-hitspop'
Plug 'wakatime/vim-wakatime'
Plug 'mechatroner/rainbow_csv'
Plug 'voldikss/vim-codelf'
Plug 'jackguo380/vim-lsp-cxx-highlight'
"Plug 'bagrat/vim-buffet'
Plug 'luochen1990/rainbow'
"Plugin for Python
Plug 'tell-k/vim-autopep8', {'for': 'python'}
"Plug for Golang
Plug 'fatih/vim-go'
"Plugin for Rust
Plug 'alx741/vim-rustfmt'
Plug 'racer-rust/vim-racer'
Plug 'arzg/vim-rust-syntax-ext'
"Plugin for C++
Plug 'gauteh/vim-cppman'
Plug 'rhysd/vim-clang-format'
"Plug 'quark-zju/vim-cpp-auto-include'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plugin for SQL
Plug 'mattn/vim-sqlfmt'
Plug 'jsborjesson/vim-uppercase-sql'
call plug#end()

"在NERDtree文件树中显示书签
let NERDTreeShowBookmarks=1

"Leaderf 配置
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>'], '<C-C>': ['<Esc>']}
let g:Lf_WindowHeight = 0.3
let g:Lf_HideHelp = 1
let g:Lf_ShowHidden = 1

"设置lightline状态栏主题
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method'] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction'
      \},
      \ }

"Vista标签查找侧栏
let g:vista_default_executive = 'ctags'
let g:vista_sidebar_width = 40
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_executive_for = {
      \ 'cpp': 'coc',
      \ 'c'  : 'coc',
      \ 'cc' : 'coc',
      \ }
let g:vista_echo_cursor_strategy = "both"

"Vim-tanslator配置
nmap <silent> t <Plug>TranslateW
vmap <silent> t :TranslateW<CR>
let g:translator_source_lang = "auto"
let g:translator_target_lang = "zh"
let g:tanslator_default_engines = ["bing", "trans", "haici", "youdao"]
let g:translator_history_enable = v:true
let g:translator_window_type = "popup"
let g:translator_window_max_width = 0.6*&columns
let g:translator_window_max_height = 0.6*&lines

"设置Vim的背景为终端透明（首先终端设置为透明）
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE

"自定义Header和Footer
let g:startify_custom_header = [
            \                       '   __  __   ______                   __          ___     ',
            \                       '  /\ \/\ \ /\__  _\   /`\_/`\      /`__`\      /`___`\   ',
            \                       '  \ \ \ \ \\/_/\ \/  /\  ___ \    /\ \_\ \    /\_\ /\ \  ',
            \                       '   \ \ \ \ \  \ \ \  \ \ \__\ \   \/_> __<_   \/_/// /__ ',
            \                       '    \ \ \_/ \  \_\ \__\ \ \_/\ \    /\ \_\ \ __  // /_\ \',
            \                       '     \ `\___/  /\_____\\ \_\\ \_\   \ \____//\_\/\______/',
            \                       '     `\ /__/   \/_____/ \/_/ \/_/    \/___/ \/_/\/_____/ ',
            \      ]

let g:startify_custom_footer = [
            \ '+------------------------------+',
            \ '|  .-------.                   |',
            \ '|  |  Hi~  |                   |',
            \ '|  |-------|                   |',
            \ '|     ^      (\_/)             |',
            \ '|     |_____ (O.o)             |',
            \ '|            (> <)             |',
            \ '|            -----             |',
            \ '+----------------+-------------+',
            \]

"起始页显示的列表长度
let g:startify_files_number=9
"过滤列表，支持正则表达式
let g:startify_skiplist = [
       \ '^/tmp',
\ ]

"vim-bufferline缓冲区标签
let g:bufferline_echo = 1
let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 0
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = 0 "always first
let g:bufferline_fname_mod = ':t'
let g:bufferline_inactive_highlight = 'StatusLineNC'
let g:bufferline_active_highlight = 'StatusLine'
let g:bufferline_solo_highlight = 0
let g:bufferline_excludes = [] "see source for defaults
let g:bufferline_pathshorten = 0

"vim-instant-markdown 配置
"filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_autostart = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 1
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_port = 11111
"let g:instant_markdown_autoscroll = 1
"let g:go_auto_sameids = 0

"vim-interestingwords 单词背景高亮
let g:interestingWordsDefaultMappings = 1
let g:interestingWordsTermColors = ['154', '121', '211', '6', '2', '160', '93', '137', '214', '222']
nnoremap <silent> <F6> :call InterestingWords('n')<CR>
nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

"nerdcommenter 配置：
"使用紧凑语法美化多行注释
let g:NERDCompactSexyComs = 1
"自定义默认注释符
let g:NERDCustomDelimiters = {
            \'c': {'left': '/* ', 'right': ' */'},
            \'cpp': {'left':'/* ', 'right': ' */'},
            \'rust': {'left': '/* ', 'right': ' */'},
            \'go': {'left': '/* ', 'right': ' */'},
            \'vim': {'left': '"'},
            \'cmake': {'left': '#'},
            \}
"单行注释&取消注释
nmap \ ,c<space>
"可视化模式多行注释
vmap \ ,c<space>
"在当前行插入注释
nmap <c-\> ,cA
imap <c-\> <esc>,c<space><end>

nmap <leader>m <Plug>ToggleMarkbar
let g:markbar_width = 30
let g:markbar_num_lines_context = 3

"ale 配置
let g:ale_cpp_cpplint_options = "-std=c++2a"
"let g:ale_set_highlights = 1
"nmap <F9> :ALELint<CR>
"let g:ale_lint_on_enter = 0

"autopep-8 配置
nnoremap <F8> :Autopep8<CR>
let g:autopep8_pep8_passes=1000
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1
let g:autopep8_ignore="E501,W293"

"vim-floaterm 配置
highlight Floaterm ctermbg=black
let g:floaterm_title="Terminal($1/$2)"
highlight FloatermBorder ctermbg=0 ctermfg=2
nnoremap <silent><F7> :FloatermToggle<CR>
tnoremap <silent><F7> <C-\><C-n>:FloatermKill<CR>

"vim-hitspop 配置
hi hitspopErrorMsg ctermfg=214

"vim-cpp-enhanced-highlight 配置
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"vim-clang-format 配置
let g:clang_format#auto_format = 1
let g:clang_format#style_options = {
            \ "IndentWidth" : 4,
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AlignTrailingComments": "false",
            \ "ColumnLimit": "150",
            \ "Standard" : "C++11",}
let g:clang_format#code_style = "google"

"vim-minimap配置
let g:minimap_auto_start = 1
let g:minimap_width = 15
let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'vista', 'startify']

"vim-rustfmt配置
let g:rustfmt_on_save = 1

"vim-racer配置
let g:racer_cmd = "/home/jacklanda/.cargo/bin/racer"
let g:racer_experimental_completer = 1

"coc-nvim配置
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

"GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"Remap <cr> to make it confirms completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"To make <cr> select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"To make coc.nvim format your code on <cr>
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"rainbow_csv配置
let g:rcsv_delimiters = ["\t", ",", "^", "~#~"]
"常用命令↓
":RainbowAlign => 文本列对齐
":RainbowShrink  => 取消列对齐(恢复原文本)
let g:rcsv_colorpairs = [['yellow', 'yellow'], ['blue', 'blue'], ['green', 'green'], ['magenta', 'magenta'], ['NONE', 'NONE'], ['darkred', 'darkred'], ['red', 'red'], ['darkgreen', 'darkgreen'], ['darkmagenta', 'darkmagenta'], ['darkcyan', 'darkcyan']]
let g:rbql_with_headers = 1
autocmd BufRead,BufNewFile *.csv set filetype=csv
autocmd BufRead,BufNewFile *.tsv,*.txt set filetype=tsv

"vim-codelf配置
"Example key mappings configuration
inoremap <silent> <Leader>l <left><C-R>=codelf#start()<CR>
nnoremap <silent> <Leader>l :call codelf#start()<CR>
let g:codelf_enable_popup_menu = 1
let g:codelf_proxy_url="http://127.0.0.1:1080"
let g:codelf_status = 1

"vim-cpp-auto-include配置
"autocmd BufWritePre *.cpp :ruby CppAutoInclude::process

"自动检测类型并设置 CMakeLists 文件语法高亮
autocmd BufNewFile,BufRead CMakeLists.txt set filetype=cmake
autocmd ColorScheme * hi CocMenuSel ctermbg=202 guibg=#fe8019
doautocmd ColorScheme
