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
NeoBundle 'Shougo/neocomplete'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'
" indentの設定
NeoBundle 'Yggdroot/indentLine'
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" rubocopの設定
NeoBundle 'scrooloose/syntastic'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" slimのsyntax
NeoBundle 'slim-template/vim-slim'
" coffeescriptのsyntax
NeoBundle 'kchmck/vim-coffee-script'
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
" color scheme
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'w0ng/vim-hybrid'
" 画面上にディレクトリを表示してくれる
NeoBundle 'schrooloose/nerdtree'
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'

call neobundle#end()

if ($ft=='ruby')
  colorscheme Tomorrow-Night
else
  colorscheme hybrid
endif

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
" rubocopの設定
let g:syntastic_mode_map = { 'mode': 'passive',
                \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
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
