if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Gitコマンドを使えるようにする
  call dein#add('tpope/vim-fugitive')
  " Gitのdiffを表示してくれる
  call dein#add('airblade/vim-gitgutter')
  " Gitのdiffのfile表示
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  " Rails向けのコマンドを提供する
  call dein#add('tpope/vim-rails')
  " Ruby向けにendを自動挿入してくれる
  call dein#add('tpope/vim-endwise')
  " Rubyのローカル変数をハイライトしてくれる
  call dein#add('todesking/ruby_hl_lvar.vim')
  " syntax checker
  if has('job') && has('channel') && has('timers')
    call dein#add('w0rp/ale')
  else
    call dein#add('vim-syntastic/syntastic')
  endif
  " コメントON/OFFを手軽に実行
  call dein#add('tomtom/tcomment_vim')
  " vimのステータスライン
  call dein#add('vim-airline/vim-airline')
  " " ステータスラインのcolor scheme
  " call dein#add('joshdick/airline-onedark.vim')
  " Ctagsの自動更新
  " call dein#add 'szw/vim-tags'
  " prettier
  call dein#add('prettier/vim-prettier')
  " close-tag
  call dein#add('alvan/vim-closetag')
  " reference確認用
  call dein#add('thinca/vim-ref')
  " cssのcolor picker
  call dein#add('lilydjwg/colorizer')
  " slimのsyntax
  call dein#add('slim-template/vim-slim')
  " javascriptのsyntax
  call dein#add('pangloss/vim-javascript')
  " typescriptのsyntax
  call dein#add('leafgarland/typescript-vim')
  " pretty jsx
  call dein#add('maxmellon/vim-jsx-pretty')
  " ログファイルを色付けしてくれる
  call dein#add('vim-scripts/AnsiEsc.vim')
  " 行末の半角スペースを可視化
  call dein#add('bronson/vim-trailing-whitespace')
  " ディレクトリ検索・ファイル検索ができる
  call dein#add('ctrlpvim/ctrlp.vim')
  " 検索を早くするagコマンド
  call dein#add('rking/ag.vim')
  " 括弧の設定プラグイン
  call dein#add('kana/vim-smartinput')
  " color scheme確認用
  call dein#add('ujihisa/unite-colorscheme')
  " color scheme
  call dein#add('joshdick/onedark.vim')
  call dein#add('rakr/vim-one')
  call dein#add('KeitaNakamura/neodark.vim')
  call dein#add('nightsense/simplifysimplify')
  " 画面上にディレクトリを表示してくれる
  call dein#add('scrooloose/nerdtree')

  " Lsp
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('mattn/vim-lsp-settings')

  " Go
  call dein#add('mattn/vim-goimports')

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
" NERDTreeのキーバインド
map <C-n> :NERDTreeToggle<CR>
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

let g:onedark_termcolors=16

colorscheme onedark

""""""""""""""""""""""""""
" 各種ファイルの設定
" """"""""""""""""""""""""""
" スワップファイルは使わない
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
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
" syntasticの設定
let g:syntastic_mode_map = { 'mode': 'passive',
                \ 'active_filetypes': ['ruby', 'javascript', 'scss'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sass_checkers = ['stylelint']
let g:syntastic_scss_checkers = ['stylelint']
let g:syntastic_ruby_rubocop_exe = 'bundle exec rubocop'

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['tsserver', 'eslint'],
\  'ruby': ['rubocop'],
\  'css': ['stylelint'],
\  'scss': ['stylelint'],
\}
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\}
let g:ale_fix_on_save = 1

" lspHoverを自動で叩かないようにする
let lsp_signature_help_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1

" copoiltの設定
imap <silent> <M-i> <Plug>(copilot-next)
imap <silent> <M-o> <Plug>(copilot-previous)

" prettierの設定
" let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" vim-ref
 let g:ref_open = 'split'
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline系フォントを利用する
let g:airline_power_fonts = 1
" タブバーのカスタマイズを有効にする
let g:airline#extensionstabline#enabled = 1
" タブバーの右領域を非表示にする
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
" ブランチ情報を表示する
let g:airline#extensions#branch#enabled = 1

" tagを閉じるようにする
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.js'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" filetypeの自動検出(最後の方に書いた方がいいらしい)
filetype on

" lsp-hover auto
autocmd CursorMoved,CursorMovedI * call s:cursor_moved()
function! s:cursor_moved() abort
    if exists('s:timer_id')
        call timer_stop(s:timer_id)
    endif
    let s:timer_id = timer_start(5000, function('s:enable_hover'))
endfunction

function! s:enable_hover(timer_id) abort
    :LspHover
endfunction
