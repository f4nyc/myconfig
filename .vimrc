set nocompatible              " required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required, 如果有新的插件，直接把名称放到这里
"Plugin 'minibufexpl.vim' "buffer管理
"Plugin 'comments.vim'                       "快速注释
Plugin 'winmanager'                         "窗口管理
Plugin 'flazz/vim-colorschemed'
Plugin 'gmarik/Vundle.vim'
Plugin 'klen/python-mode'
Plugin 'jmcantrell/vim-virtualenv'

Plugin 'pangloss/vim-javascript'            
Plugin 'mattn/emmet-vim'                    

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'                 "代码片段补全

Plugin 'w0rp/ale'                           "取代syntastic，异步语法检测

Plugin 'majutsushi/tagbar'                  "支持大纲浏览
Plugin 'tpope/vim-fugitive'                 "git支持，直接在vim中执行Git命令
Plugin 'Valloric/YouCompleteMe'            
Plugin 'scrooloose/nerdcommenter'           "快速注释，支持几乎所有编程语言

Plugin 'easymotion/vim-easymotion'          "快速移动插件, ‘,,w’可以在单词上出现前缀，然后快速跳转
Plugin 'scrooloose/nerdtree'                "文件树浏览		    
Plugin 'Xuyuanp/nerdtree-git-plugin'        "git+nerdtree 

Plugin 'yggdroot/indentline'                "缩进线条，可以set cursorline加上水平线
Plugin 'mhinz/vim-startify'                 "启动的时候显示一些编程相关的名言警句和最近打开文件,很有意思
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'                  "底下的文件信息提示行,彩虹效果
Plugin 'kien/rainbow_parentheses.vim'       "彩虹括号
Plugin 'edkolev/promptline.vim'
Plugin 'godlygeek/tabular'

Plugin 'plasticboy/vim-markdown'            "markdown语法高亮
Plugin 'iamcco/markdown-preview.vim'        "新的markdown预览，有图
Plugin 'iamcco/mathjax-support-for-mkdp'    "预览公式支持

Plugin 'xuhdev/vim-latex-live-preview'   "xetex预览
Plugin 'fatih/vim-go'                    "for golang
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


colorscheme ChocolateLiquor

"============================================================================
"for ycm 
"============================================================================
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '/home/fanyc/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
let g:livepreview_previewer = 'evince' " :LLPStartPreview 预览
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:mkdp_auto_start = 1
    " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
    "     " markdown 文件的时候打开一次
    "
let g:mkdp_auto_open = 1
    "             " 设置为 1 在编辑 markdown
    "             的时候检查预览窗口是否已经打开，否则自动打开预
    "                 " 览窗口

"============================================================================
"snip
"============================================================================
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<C-z>"
"弹出UltiSnips的可用列表,由于不常用, 所以这里设置成了特殊的<C-i>映射
let g:UltiSnipsListSnippets="<C-i>"
"<C-f>跳转的到下一个代码块可编辑区
let g:UltiSnipsJumpForwardTrigger="<C-f>"
"<C-b>跳转到上一个代码块可编辑区
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

"============================================================================
"emmet-vim
"<C-y>+<leader>
"具体语法help
"============================================================================
"============================================================================
let g:user_emmet_mode='a'




"=========================
"文件头
"=========================
autocmd BufNewFile *.py,*.cpp,*.asm,*.tex,*.md,*.sh call SetTitle()
func SetTitle()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding:utf-8 -*-")
        normal G
        normal o
        normal o
        call setline(5, "if __name__ == '__main__':")
    endif
    if &filetype == 'cpp'
        call setline(1,"#include<iostream>")
        call setline(2,"using namespace std;")
        call setline(3,"int main(){")
        call setline(4,"return 0;")
        call setline(5,"}")
    endif
    if &filetype == 'asm'
        call setline(1,"STACK SEGMENT")
        call setline(2,"DATA SEGMENT")
        call setline(3,"DATA ENDS")
        call setline(4,"CODE SEGMENT")
        call setline(5,"    ASSUME CS:CODE,DS:DATA")
        call setline(6,"START:")
        call setline(7,"CODE ENDS")
        call setline(8,"    END START")
    endif
    if &filetype == 'plaintex'
        call setline(1,"\\documentclass[11pt,a4paper]{article}")
        call setline(2,"\\usepackage{fontspec}")
        call setline(3,"\\setmainfont{WenQuanYi Micro Hei}")
        call setline(4,"\\begin{document}")
        call setline(5,"\\end{document}")
    endif
    if &filetype == 'markdown'
        call setline(1,"---")
        call setline(2,"title:")
        call setline(3,"author: f4nyc")
        call setline(4,"layout: post")
        call setline(5,"categories: Docs")
        call setline(6,"date: ".strftime("20%y-%m-%d"))        
        call setline(7,"")
        call setline(8,"---")
    endif
    if &filetype == 'sh'
        call setline(1,"#! /bin/zsh")
    endif
endfunc

"=========================
"airline
"=========================
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_detect_whitespace          = 1 "关闭空白符检测
let g:airline_theme                      = 'bubblegum' "设定主题

"=============================================================================
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_max = 16

"=========================
" vim原生设置
"=========================
" set rnu "显示相对行号
set incsearch               "搜索过程高亮,vim8中的新特性
set hls
set whichwrap=b,s,<,>,[,]   "允许左右方向键等等自由换行 
set nu
syntax on " 打开语法检测

set tabstop=4 "设置tab键长度
set et
set smarttab
set sw=4
set ts=4

set nolist "设置空格显示为+号
set listchars=trail:+

set foldmethod=syntax "代码折叠
"set foldlevelstart=99 "默认不折叠

set cursorline                  "设置光标行
set noswapfile                  "不要生成swap文件
set nobackup
set bufhidden=hide              "当buffer被丢弃的时候隐藏它
set guicursor=n-v-c:hor10       "normal下贯标显示为下划线
set expandtab                   "Use space instead of tabs

let mapleader = ","
"let g:mapleader = ","

map Y "+y
map P "+p

"noremap ok o<esc> "插入新行

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm.app"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

"============================================================================
"编码设置
"============================================================================
"Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)        
set encoding=utf-8
set langmenu=zh_CN.UTF-8
" 设置打开文件的编码格式  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 
set fileencoding=utf-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
"设置中文提示
language messages zh_CN.utf-8 
"设置中文帮助
set helplang=cn
"设置为双字宽显示，否则无法完整显示如:☆
"set ambiwidth=double

"=========================
"nerdtree
"=========================
let NERDTreeWinPos = 'left'
let NERDTreeWinSize = 30
let NERDTree_autofocus = 0
nmap <F2> <ESC>:NERDTreeToggle<RETURN>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"=========================
" tagbar
"=========================
nmap <F3> :TagbarToggle<CR>
let g:tagbar_width = 30
let g:tagbar_left = 0
let g:tagbar_autofocus = 0


"============================================================================
"解决tmux和terminator中airline的显示问题
"============================================================================
set t_Co=256


"============================================================================
"pythonmode
"============================================================================
let g:pymode_run = 1
"运行python的快捷键为p-y
let g:pymode_run_key = '<C-Y>'
"自动补全
map <C-Space> <nop> " disable python-mode RopeCodeAssistInsertMode Key binding
"Ctrl+O打开自动补全(使用Ctrl+N和Ctrl+P来向前、向后翻页)
inoremap <C-O> <C-R>=RopeCodeAssistInsertMode()<CR>
inoremap jk <esc>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
highlight PMenu ctermfg=16 ctermbg=187 guifg=#050505 guibg=#ccc5ad


"============================================================================
"vim-go
"============================================================================
"au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)



"使用fzf
nmap <C-P> :FZF<Return>           

"============================================================================
"ale
"============================================================================
let g:ale_lint_on_text_changed=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_save=1
let g:ale_lint_on_filetype_changed=1
nmap <Leader>s :ALEToggle<CR>

