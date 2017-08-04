"Configuration file for vim

set nocompatible                "禁用 Vi 兼容模式
syntax on
filetype off                    "启用文件类型侦测
filetype plugin indent on       "启用缩进
"filetype plugin on             "针对不同的文件类型加载对应的插件
set smartindent                 "启用智能对齐方式
set expandtab                   "将Tab键转换为空格
set tabstop=4                   "设置Tab键的宽度
set shiftwidth=4                "换行时自动缩进4个空格
set softtabstop=4               "方便在开启了et后使用退格（backspace）键，每次退格将删除X个空格
set smarttab                    "开启时，在行首按TAB将加入sw个空格，否则加入ts个空格
set foldenable                  "启用折叠
set foldmethod=indent           "indent 折叠方式
set ignorecase                  "搜索模式里忽略大小写
set smartcase                   "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
"set noincsearch                "在输入要搜索的文字时，取消实时匹配
set number                      "显示行号
set laststatus=2                "启用状态栏信息
set cmdheight=2                 "设置命令行的高度为2，默认为1
set cursorline                  "突出显示当前行
set wrap                        "设置不自动换行
set autoread                    "当文件在外部被修改，自动更新该文件
set writebackup                 "保存文件前建立备份，保存成功后删除该备份
set nobackup                    "设置无备份文件
set noswapfile                  "设置无临时文件
set vb t_vb=                    "关闭提示音
"set mouse=a                    " 在任何模式下启用鼠标
set t_Co=256                    " 在终端启用256色
set backspace=indent,eol,start  "设置退格键可用
set buftype=
set nocompatible                "禁用 Vi 兼容模式
set autochdir
set fileformat=unix             "设置新文件的<EOL>格式
set fileformats=unix,dos,mac    "给出文件的<EOL>格式类型
set modelines=0		            "CVE-2007-2438
set hlsearch                    "高亮搜索
set incsearch                   "在输入要搜索的文字时，实时匹配
set encoding=utf-8              "设置gvim内部编码
set fileencoding=utf-8          "设置当前文件编码
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Chiel92/vim-autoformat'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'michalbachowski/vim-wombat256mod'
"Plugin 'scrooloose/syntastic'
Plugin 'StanAngeloff/php.vim'
Plugin 'guenti/vim-php-cs-fixer'
"Plugin 'rizzatti/dash.vim'

"cd ~/.vim/bundle/YouCompleteMe && npm install -g typescript && ./install.py  --tern-completer --gocode-completer
"C-family languages support: add --clang-completer when calling ./install.py
"C# support: add --omnisharp-completer when calling ./install.py
"Go support: ensure go is installed and add --gocode-completer when calling ./install.py
"TypeScript support: install nodejs and npm then install the TypeScript SDK with npm install -g typescript
"JavaScript support: install nodejs and npm and add --tern-completer when calling ./install.py
"Rust support: install rustc and cargo and add --racer-completer when calling ./install.py
"Plugin 'Valloric/YouCompleteMe'
call vundle#end()

"colorscheme wombat256mod                          "终端配色方案

"用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<cr>:noh<cr>

"常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<cr>:noh<cr>

"常规模式下输入 cf 自动格格式化
nmap cf :Autoformat<CR><CR>

"Dash搜索
"nmap <silent> <leader>d <Plug>DashSearch
"nmap <silent> <leader>D <Plug>DashGlobalSearch

"toggle the Tagbar window
nmap tb :TagbarToggle<CR>

"Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>
"Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>
"Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>
" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"If php-cs-fixer is in $PATH, you don't need to define line below
"let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "symfony"              " which level ?
let g:php_cs_fixer_config = "default"             " configuration
"let g:php_cs_fixer_config_file = '.php_cs'       " configuration file
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

" http://vim.wikia.com/wiki/Show_tab_number_in_your_tab_line
if exists("+showtabline")
	function MyTabLine()
		let s = ''
		let t = tabpagenr()
		let i = 1
		while i <= tabpagenr('$')
			let buflist = tabpagebuflist(i)
			let winnr = tabpagewinnr(i)
			let s .= '%' . i . 'T'
			let s .= (i == t ? '%1*' : '%2*')
			let s .= ' '
			let s .= i . ')'
			let s .= ' %*'
			let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
			let file = bufname(buflist[winnr - 1])
			let file = fnamemodify(file, ':p:t')
			if file == ''
				let file = '[No Name]'
			endif
			let s .= file
			let i = i + 1
		endwhile
		let s .= '%T%#TabLineFill#%='
		let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
		return s
	endfunction
	set stal=2
	set tabline=%!MyTabLine()
endif

"statusline
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "文件路径
set statusline+=%2*\ %y\                                  "文件类型
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "编码1
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "编码2
set statusline+=%4*\ %{&ff}\                              "文件系统(dos/unix..)
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "语言 & 是否高亮，H表示高亮?
set statusline+=%8*\ %=\ row:\ %l/%L\                       "光标所在行号/总行数 (百分比)
set statusline+=%9*\ col:%03c\                            "光标所在列
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Read only? Top/bottom
function! HighlightSearch()
      if &hls
          return 'H'
      else
          return ''
      endif
endfunction
hi User1 ctermfg=white  ctermbg=darkred
hi User2 ctermfg=blue  ctermbg=58
hi User3 ctermfg=white  ctermbg=100
hi User4 ctermfg=darkred  ctermbg=95
hi User5 ctermfg=darkred  ctermbg=77
hi User7 ctermfg=darkred  ctermbg=blue  cterm=bold
hi User8 ctermfg=231  ctermbg=blue
"hi User9 ctermfg=#ffffff  ctermbg=#810085
hi User0 ctermfg=yellow  ctermbg=138

"Plugin majutsushi/tagbar
let g:tagbar_phpctags_bin='/usr/local/bin/phpctags'
let g:tagbar_ctags_bin="/usr/local/bin/ctags"
let g:tagbar_left = 0
let g:tagbar_width = 40
let g:tagbar_indent = 0
let g:tagbar_autoshowtag = 1

"Plugin StanAngeloff/php.vim
function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END

"前端文件类型缩进改为2
autocmd FileType javascript,html,css,xml set ai
autocmd FileType javascript,html,css,xml set sw=2
autocmd FileType javascript,html,css,xml set ts=2
autocmd FileType javascript,html,css,xml set sts=2
