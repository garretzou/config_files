" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" 以下全部为新添加
set nocompatible
set encoding=utf-8
set hidden
syntax on
set synmaxcol=2048                " Don't syntax highlight super-long lines (for performance)


" 隐藏不可见字符
set nolist
" set invlist
" set list

set cursorline

" 去掉输入错误的提示声音

set noeb

set magic                   " 设置魔术

set guioptions-=T           " 隐藏工具栏

set guioptions-=m           " 隐藏菜单栏

" 设置在状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

" 加入tags文件



set autoindent                    " automatically indent lines and try to do it intelligently
set smartindent
set backspace=indent,eol,start    " backspace behaves 'normally'

" set softtabstop=2
"set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent

set textwidth=0
set nolinebreak
set nowrap

set virtualedit=all               " Allow the cursor to go in to 'invalid' places
   
set hlsearch                      " highlight search terms
set incsearch                     " search incrementally
set ignorecase                    " ignore case in searches...
set smartcase                     " ...but not really. Case sensitive if capitals are included.
set wrapscan                      " Set the search scan to wrap around the file

nmap <silent> <Leader>/ :nohlsearch<CR>  " Clear the find buffer


set laststatus=2                  " always display a status line

set number                        " show line numbers
set numberwidth=5
set ruler                         " display coordinates in status bar
set showcmd                       " display unfinished commands
set showmatch                     " show matching bracket (briefly jump)
set showmode                      " display the current mode in the status bar
set title                         " show file in titlebar
set scrolloff=3                   " When the page starts to scroll, keep the cursor 3 lines from top/bottom
set cmdheight=2                   " Make command line two lines high

" Use the same symbols as TextMate for tabstops and EOLs
" Show Invisibles (http://vimcasts.org/episodes/show-invisibles/) 
" set list
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.swp,*.bak,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Quickly edit/reload the vimrc file
" http://www.derekwyatt.org/vim/the-vimrc-file/my-vimrc-file/
nmap <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" navigate around in buffers...
map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>

" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>

" Maps Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>

nnoremap ;; : " ?

nmap <Leader>l :set list!<CR>               " Shortcut to rapidly toggle invisibles (`set list`)

" sudo save file
cmap w!! w !sudo tee % >/dev/null

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif

  
" nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
" nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
" nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"""""""""""""设置开启ctags"""""""""""""     
map <F4> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>  

"set tags file find path
set tags=tags;/
set tags+=~/.vim/systags
cs add ~/.vim/cscope.out

cmap w!! w !sudo tee > /dev/null %
