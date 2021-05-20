"令终端支持256色
set t_Co=256
"MacOs下解决delete/backspace键失效的问题
set backspace=2
"设置Vim主题
colorscheme fijicat
autocmd Filetype c,cpp colorscheme fijicat
autocmd FileType rust,python colorscheme gruvbox
autocmd FileType bash,zsh colorscheme spacecamp
autocmd FileType markdown.mkd colorscheme detorte
autocmd FileType text colorscheme challenger_deep
autocmd FileType html,css colorscheme one
autocmd FileType javascript,html,css,xml set ai
autocmd FileType javascript,html,css,xml set sw=2
autocmd FileType javascript,html,css,xml set ts=2
autocmd FileType javascript,html,css,xml set sts=2

"重新打开Vim后回到上次退出Vim时的文本位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
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
:set mouse=""
"隐藏鼠标
:set mousehide
"Vim文件类型设置
filetype on
filetype plugin on
filetype indent on
autocmd FileType python,c,cpp set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNew *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"

"自动根据文件类型选用主题
function! AutoSetTheme()
    if &filetype == 'python'
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

"autocmd FileType c,cpp,go,python,rust,xml,yml,perl
autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
"保存文件时，自动删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

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
inoremap kj <Esc>
nnoremap <silent><Leader>w :w!<CR>
inoremap <Leader>w <Esc>:w!<CR>
nnoremap q :q<CR>

"复制粘贴
nnoremap <Leader>a ggVG"
noremap <leader>c yG"
noremap <leader>v p"
noremap <leader>d dG"

"对当前窗口竖直分屏
nnoremap w <C-w>v

"匹配结果居中
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nnoremap <silent>ww <C-w>w

"关闭掉上次搜索的高亮
noremap <silent><leader> :nohls<CR>

"复制当前行到行尾的内容
map Y y$

"用;来代替:，省去了按shift
nnoremap ; :
nnoremap . <delete>

"Ctrl+c 将文本内容复制到系统剪贴板
"Ctrl+v 将系统的剪贴板内容复制到Vim中
nnoremap <C-c> "+y
nnoremap <C-v> "+p

cmap w!! w !sudo tee >/dev/null %
cmap wq!! wq !sudo tee >/dev/null %

nnoremap <S-k> gg
nnoremap <S-j> G
nnoremap <S-h> <Home>
nnoremap <S-l> <End>

"快速翻页/删除/复制
nnoremap 1 10
nnoremap 2 20
nnoremap 3 30

let g:powerline_pycmd="py3"
set laststatus=2
syntax on

" 代码折叠自定义快捷键 b
map b zc
map bb zx
set foldmethod=indent
set foldlevelstart=99 "关闭默认折叠选项"

" 折叠方法:
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
"auto Filetype python set foldmethod=indent
"auto Filetype cpp set foldmethod=indent

nnoremap <F2> :set nu! nu?<CR>
nnoremap <silent><F3> :silent NERDTree<CR>
nnoremap <silent><F4> :silent Vista<CR>
"nnoremap <F4> :TagbarToggle<CR>
nnoremap <silent><F10> : silent UndotreeToggle<CR>

"按<m>快速切换已打开的文件（缓冲）
"按<f>启动CtrlP模糊文件搜索
map <silent>m :silent bn<CR>
map <silent><S-m> :silent bp<CR>
"按<e>关闭当前文件缓冲
map <silent>e :silent bd<CR>
map <silent>f :Leaderf file --fuzzy --reverse --bottom<CR>
map <silent><leader>f :Leaderf mru --fuzzy --reverse --bottom<CR><TAB>
map <silent><leader>g :Leaderf function --reverse --bottom<CR><TAB>
map <silent>s :silent Startify<CR>

noremap <C-d> :sh<CR>
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
    silent exec "!g++ % -o %<"
    silent exec "!./%<"
    call feedkeys("\<C-d>")
    "call feedkeys("\<C-z>",'n')
elseif &filetype == 'python'
    silent :!clear
    silent :!echo "+----------------------+"
    silent :!echo "|「Python」脚本输出为：|"
    silent :!echo "+----------------------+\n"
    silent exec "!python3 %"
    call feedkeys("\<C-d>")
    "call feedkeys("\<C-z>",'n')
    endif
endfunc

set nocompatible              " 去除VI一致性
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

call plug#begin()
" 简写形式，只写username/repo即可
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/LeaderF'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ervandew/supertab'
Plug 'mhinz/vim-startify'
Plug 'liuchengxu/vista.vim'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'guns/xterm-color-table.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yianwillis/vimcdoc'
Plug 'voldikss/vim-translator'
Plug 'fatih/vim-go'
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
Plug 'tell-k/vim-autopep8', {'for': 'python'}
Plug 'voldikss/vim-floaterm'
Plug 'obcat/vim-hitspop'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-clang-format'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'alx741/vim-rustfmt'
Plug 'wakatime/vim-wakatime'
Plug 'racer-rust/vim-racer'
Plug 'mechatroner/rainbow_csv'
Plug 'voldikss/vim-codelf'
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
      \             [ 'readonly', 'filename','modified'] ]
      \           },
      \ }

"Vista标签查找侧栏
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

"Vim-tanslator配置
nmap <silent> <Leader>t <Plug>TranslateW
let g:tanslator_default_engines = ['youdao', 'haici', 'google']
let g:translator_window_max_width = 1.0*&columns
let g:translator_window_max_height = 2.0*&lines

"设置Vim的背景为终端透明（首先终端设置为透明）
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE

" 自定义Header和Footer
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

" 起始页显示的列表长度
let g:startify_files_number=9
" 过滤列表，支持正则表达式
let g:startify_skiplist = [
       \ '^/tmp',
       \ ]

" YouCompleteMe 补全配置
" Rust库路径
"let g:ycm_rust_src_path="/home/jacklanda/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib"
"Python3的解释器路径
let g:ycm_python_binary_path = '/Users/didi/opt/anaconda3/bin/python3'
"配置全局路径
let g:ycm_global_ycm_extra_conf='/Users/didi/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
"直接加载文件，不提示
let g:ycm_confirm_extra_conf = 0
let g:ycm_use_clangd=1
let g:ycm_seed_identifiers_with_syntax = 1
"禁用ycm的语法检查
let g:ycm_show_diagnostics_ui = 0
set completeopt=menu
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 从第2个键入字符就开始补全
let g:ycm_min_num_identifier_candidate_chars = 2
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
let g:ycm_add_preview_to_completeopt = 0
"输入指定的符号将触发补全
let g:ycm_semantic_triggers={
  \   'c,markdown' : ['->', '.'],
  \   'py,python,go': ['.'],
  \   'cpp' : ['->', '.', '::'],
  \   'c,cpp,python,py,java,go,erlang,perl': ['re!\w{2}'],
  \   'rust': ['.', ':', '::', '=>', '<='],
  \   'css': ['re!^\s{4}', 're!:\s+'],
  \   'html': ['</'],
  \ }
"按tab键移动选项游标
"let g:ycm_key_list_select_completion = ['<TAB>']
"插入模式下按回车键选中
let g:ycm_key_list_stop_completion = ['<CR>']
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
"设置YCM起作用的白名单
let g:ycm_filetype_whitelist = {
			\ "c":1,
            \ "cpp":1,
            \ "go":1,
            \ "rust":1,
            \ "python":1,
            \ "vim":1,
            \ "sh":1,
			\ "zsh":1,
            \ "yaml":1,
            \ "markdown":1,
			\ }
"ycm不补全的黑名单
let g:ycm_filetype_blacklist = {'txt':1, 'tagbar':1}

let g:go_bin_path=$HOME.".go/go/bin"
let g:go_gopls_enabled = 1
let g:go_def_mode = 'gopls'
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=2
let g:go_doc_popup_window = 0
let g:go_textobj_include_function_doc = 0
let g:go_doc_keywordprg_enabled = 0

"vim-bufferline缓冲区标签
let g:bufferline_echo = 1
let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 0
let g:bufferline_rotate = 1
let g:bufferline_fixed_index =  0 "always first
let g:bufferline_fname_mod = ':t'
let g:bufferline_inactive_highlight = 'StatusLineNC'
let g:bufferline_active_highlight = 'StatusLine'
let g:bufferline_solo_highlight = 0
let g:bufferline_excludes = [] "see source for defaults
let g:bufferline_pathshorten = 0

"vim-instant-markdown
filetype plugin on
"Uncomment to override defaults:
let g:instant_markdown_autostart = 1
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 1
let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_port = 11111
let g:instant_markdown_autoscroll = 1
let g:go_auto_sameids = 0

"vim-interestingwords 单词背景高亮
"let g:interestingWordsDefaultMappings = 1
nnoremap <silent> <F6> :call InterestingWords('n')<CR>
nnoremap <silent> n :call WordNavigation(1)<cr>
nnoremap <silent> N :call WordNavigation(0)<cr>

"nerdcommenter 配置：
"使用紧凑语法美化多行注释
let g:NERDCompactSexyComs = 1
"注释后增加一空格
"let g:NERDSpaceDelims = 1
"自定义默认注释符
let g:NERDCustomDelimiters = {
            \'c': {'left': '/* ', 'right': ' */'},
            \'cpp': {'left':'/* ', 'right': ' */'},
            \'rust': {'left': '/* ', 'right': ' */'},
            \'go': {'left': '/* ', 'right': ' */'},
            \'vim': {'left': '"'},
            \}
"单行注释&取消注释
nmap \ ,c<space>
"可视化模式多行注释
vmap \ ,c<space>
"在当前行插入注释
nmap <c-\> ,cA
imap <c-\> <esc>,c<space><end>

"nmap <leader>m <Plug>ToggleMarkbar
"let g:markbar_width = 30
"let g:markbar_num_lines_context = 3

"ale 配置
"let g:ale_set_highlights = 1
"nmap <F9> :ALELint<CR>
"let g:ale_lint_on_enter = 0

"autopep-8 配置
nnoremap <F8> :Autopep8<CR>
let g:autopep8_pep8_passes=1000
let g:autopep8_disable_show_diff=1
let g:autopep8_on_save = 1

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
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",}

"vim-minimap配置
let g:minimap_auto_start = 1
let g:minimap_width = 15
let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'vista', 'startify']

"vim-rustfmt配置
let g:rustfmt_on_save = 1

"vim-racer配置
let g:racer_cmd = "/home/jacklanda/.cargo/bin/racer"
let g:racer_experimental_completer = 1

"supertab配置
let g:SuperTabDefaultCompletionType = "<c-n>"

"coc-nvim配置

"rainbow_csv配置
let g:rcsv_delimiters = ["\t", ",", "^", "~#~"]
" 常用命令↓
" :RainbowAlign => 文本列对齐
" :RainbowShrink  => 取消列对齐(恢复原文本)
let g:rcsv_colorpairs = [['yellow', 'yellow'], ['blue', 'blue'], ['green', 'green'], ['magenta', 'magenta'], ['NONE', 'NONE'], ['darkred', 'darkred'], ['red', 'red'], ['darkgreen', 'darkgreen'], ['darkmagenta', 'darkmagenta'], ['darkcyan', 'darkcyan']]

"vim-codelf配置
" Example key mappings configuration
inoremap <silent> <Leader>l <left><C-R>=codelf#start()<CR>
nnoremap <silent> <Leader>l :call codelf#start()<CR>
let g:codelf_enable_popup_menu = 1
"let g:codelf_proxy_url = http://127.0.0.1:1080
let g:codelf_status = 1
