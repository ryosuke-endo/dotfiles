"--プラグインの設定
if 0 | endif

if &compatible
  set nocompatible "Be improved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let Neobundle manage Neobundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My bundles here:
" Refer to |:NeoBundle-example|.
" Note: You don't set neobundle settinf in .gvimrc!

" Snipet関連
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" unite vim
NeoBundle 'Shougo/unite.vim'
" vimproc
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }
" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" Gitのdiffを表示してくれる
NeoBundle 'airblade/vim-gitgutter'
" indentの設定
" NeoBundle 'Yggdroot/indentLine'
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" rubocopの設定
NeoBundle 'scrooloose/syntastic'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" vimのステータスライン
NeoBundle 'itchyny/lightline.vim'

" cssのcolor picker
NeoBundle 'lilydjwg/colorizer'
" slimのsyntax
NeoBundle 'slim-template/vim-slim'
" coffeescriptのsyntax
NeoBundle 'kchmck/vim-coffee-script'
" javascriptのsyntax
NeoBundle 'pangloss/vim-javascript'
" jsxのsyntax
NeoBundle 'mxw/vim-jsx'
" sassのlinter
NeoBundle 'gcorne/vim-sass-lint'
" ログファイルを色付けしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

" ディレクトリ検索・ファイル検索ができる
NeoBundle 'ctrlpvim/ctrlp.vim'
" 検索を早くするagコマンド
NeoBundle 'rking/ag.vim'
" 括弧の設定プラグイン
NeoBundle 'kana/vim-smartinput'
" color scheme確認用
NeoBundle 'ujihisa/unite-colorscheme'
" color scheme
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'gosukiwi/vim-atom-dark'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'lifepillar/vim-solarized8'
NeoBundle 'joshdick/onedark.vim'
NeoBundle 'endel/vim-github-colorscheme'
NeoBundle 'atelierbram/vim-colors_duotones'
NeoBundle 'ciaranm/inkpot'
" 画面上にディレクトリを表示してくれる
NeoBundle 'schrooloose/nerdtree'
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" NERDTreeのキーバインド
map <C-n> :NERDTreeToggle<CR>
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'

call neobundle#end()

colorscheme solarized

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

NeoBundleCheck

""""""""""""""""""""""""""
" 各種ファイルの設定
""""""""""""""""""""""""""
" スワップファイルは使わない
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウィンドウのタイトルバーにファイルの情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
set nowrap
set ignorecase
" クリップボードの設定
set clipboard=unnamed
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" indentの文字
set tabstop=1
" rubocopの設定
let g:syntastic_mode_map = { 'mode': 'passive',
                \ 'active_filetypes': ['ruby', 'coffee'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_sass_checkers = ['sass_lint']
let g:syntastic_scss_checkers = ['scss_lint']

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }
""""""""""""""""""""""""""""""

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

""""""""""""""""""""""""""""""
" ctrlpの設定
""""""""""""""""""""""""""""""
"  検索ウィンドウの設定
" :help g:ctrlp_match_window
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'"

""""""""""""""""""""""""""""""
" neocompleteの設定
""""""""""""""""""""""""""""""
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_auto_select = 1
    let g:neocomplete#enable_enable_camel_case_completion = 0
    if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

""""""""""""""""""""""""""""""
" uniteをagで検索
""""""""""""""""""""""""""""""
" insert modeで開始
let g:unite_enable_start_insert = 1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼び出し
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on
