" be iMproved
set nocompatible
set noswapfile

let  Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let  Tlist_WinWidth = 55
let  NERDTreeWinSize = 45
set foldmethod=indent
"let  LookupFile_TagExpr = './lookuptag'
" Vundle setting {
	filetype off " required!

	set rtp+=~/.vim/bundle/vundle/
	"if has("gui_running")
		"set rtp+=~/.vim/bundle/vim-powerline
	"endif
	call vundle#rc()

	" let Vundle manage Vundle(required!)
	Bundle 'gmarik/vundle'

	" plugins repos {
		" Mini buffer
		" code complete plugin
		"Bundle 'Valloric/YouCompleteMe'
		Bundle 'jeetsukumaran/vim-buffergator'
		" General Utilities
		Bundle 'genutils'
        " Quike Open Files By name
        Bundle 'lookupfile'
		" The-NERD-tree
		Bundle 'The-NERD-tree'
		" Commenter for many lang
		Bundle 'The-NERD-Commenter'
		" Taglist
		Bundle 'taglist.vim'
		" match ()
		Bundle 'matchit.zip'
		" color colorscheme
		Bundle 'chriskempson/vim-tomorrow-theme'
		" more colorful colorscheme
		Bundle 'athom/more-colorful.vim'
		" Auto close the block #when i use AutoClose  found it not work very well so i use this replace it
		Bundle 'jiangmiao/auto-pairs'
		" Get git branch status
		Bundle 'Git-Branch-Info'
		" SuperTab for autocomplete
		Bundle 'SuperTab'
		" ctrlp.vim
		Bundle 'ctrlp.vim'
		" Ruby on Rails plugin
		Bundle 'tpope/vim-rails'
		" vim plugin for ruby language
		Bundle 'vim-ruby/vim-ruby'
		" Vim golang plugin
		Bundle 'jnwhiteh/vim-golang'
		" Markdown hightline plugin
		Bundle 'Markdown'
		" tabular #code formate
		Bundle 'godlygeek/tabular'
	" }

	" required!
	filetype plugin on
	filetype plugin indent on
" }


" TagList setting {
	" Show Tlist on the right
	let Tlist_Use_Right_Window=1

	" Close vim when Tlist is the last window
	let Tlist_Exit_OnlyWindow=1

	" Show Tlist only one file
	let Tlist_Show_One_File=1

	" Get focus when open the Tlist
	let Tlist_GainFocus_On_ToggleOpen=1

	" Mapping <F8>to Toggle the Tlist
	map <C-o> :TlistToggle<cr>
" }


" format setting {
	" 开始行号
	set number

	" 设定 << 和 >> 命令移动时的宽度为 4
	set shiftwidth=4

	" 使得按退格键时可以一次删掉 4 个空格
	set softtabstop=4

	" 设定 tab 长度为 4
	set tabstop=4

	" 设定提示宽度的标尺为80个字符
	set textwidth=100
	set cc=+1

	" 光标距离上下边距行数
	set so=3

	" 为这些语言设置缩进风格 {
		autocmd FileType ruby set shiftwidth=2 | set expandtab
		autocmd FileType erlang set shiftwidth=2 | set expandtab
		autocmd FileType php set shiftwidth=4 | set expandtab
		autocmd FileType go set shiftwidth=4 | set softtabstop=2
	" }
" }

" display setting {
	" 显示状态栏 (默认值为 1, 无法显示状态栏)
	set laststatus=2

	" 搜索时高亮显示被找到的文本
	set hlsearch

	set ignorecase
	set smartcase
	" 输入搜索内容时就显示搜索结果
	set incsearch

	" 显示tab以及空格
	set list
	set listchars=tab:>-,trail:·

	" syntax on
	syntax on

	" 设置backspace
	set backspace=indent,eol,start
" }

" key map {
	" <leader> key setting {
		let mapleader = ","
		let g:mapleader = ","
	" }

"temp disable highlight search {
    nmap <leader>h :noh<cr>
  "  }
	" Fast saving
	nmap <leader>w :w!<CR>
" NERDTree setting {
" map <C-i> :NERDTreeToggle<cr>
	nmap <leader>g :NERDTreeToggle<cr>
" }

	" fast change panel {
		nmap <Tab> <C-w>w
		nmap <c-h> <c-w><c-h>
		"nmap <c-j> <c-w><c-j>
		"nmap <c-k> <c-w><c-k>
		nmap <c-j> :tabprev<cr>
		nmap <c-k> :tabnext<cr>
		nmap <c-l> <c-w><c-l>
	" }
" }

" other setting {
	" Set to auto read when a file is changed from the outside
	set autoread
	autocmd! bufwritepost .vimrc source %

	" no backup
	set nobackup

	" 自动缩进
	set autoindent

	" remove bell
	set vb

	" 让Vim默认使用系统的剪切板
	set clipboard=unnamed

	" 快速退出
	map <leader>q :q<cr>
	map <leader>qq :q!<cr>
	map <Leader>qa :qa!<cr>
	" 快速保存并退出
	map <leader>wq :wq<cr>

	" Vim使用的ctag  已经不用了系统的ctags已经软连接到/usr/local/bin/ctags
	"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

	" status {
	"set statusline=Shadow
	"set statusline+=\\ Git:\%{GitBranchInfoTokens()[0]}\ 
	"set statusline+=\%f%m
	"set statusline+=%=%{''.(&fenc!=''?&fenc:&enc).''}
	"set statusline+=\\%{&ff}
	"set statusline+=\\%y
	"set statusline+=\\ [%-8.(%l,%c%)\ %-4.(%p%%%)]
	" }

	" 设置golang complete格式 {
	set completeopt=longest,menu
	" }
	
	" 设置git merge
	map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
	map <silent> <leader>3 :diffget 3<CR> :diffupdate<CR>
	map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>

	" 设置代码折叠 {
	set foldmethod=marker
	set foldnestmax=3
	set foldclose=all
	set nofoldenable
	" }

	" 设置命名列表 {
	set wildmode=list:longest
	set wildmenu
	set wildignore=*.o,*.obj.*.~
	" }

	" fast change buff {
    nmap <Leader>bp :bp<cr>
    nmap <Leader>bn :bn<cr>
	" Tabular config and key map {
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
	inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
	function! s:align()
		let p = '^\s*|\s.*\s|\s*$'
		if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
			let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
			let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
			Tabularize/|/l1
			normal! 0
			call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
		endif
	endfunction
	function! RebuildLookupTags()
		!echo "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > lookuptags
		!gfind . -type f -printf "%f\t%p\t1\n" >> lookuptags
	endfunction
    "更新rags
    function! UpdateTags()
      let result = system("/Users/ryan/.rvm/bin/rdoc -f tags .")
	  echo result
    endfunction
    "检查ruby语法
    function! RubyCheck()
	  let filename = expand('%:p')
      let cmd =  system("/usr/bin/ruby -cw " . filename)
	  echo cmd
    endfunction
	nmap <Leader>r :call RubyCheck()<cr>
    nmap <F8> :call UpdateTags()<cr>
	" }
