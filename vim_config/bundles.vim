" PLUGINS BUNDLE
let vundle_readme=expand($HOME.'/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Plugin.."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle/
endif

" Required:
if has('vim_starting')
  set nocompatible
  set runtimepath+=$HOME/.vim/bundle/vundle/
  set sessionoptions-=options
endif

call vundle#rc(expand($HOME.'/.vim/bundle/'))
Plugin 'gmarik/vundle'

" Plugin Groups
" List only the plugin groups you will use
if !exists('g:bundle_groups')
  let g:bundle_groups=['general', 'devel', 'languages', 'colorscheme']
endif

" Plugins here:
" GENERAL
if count(g:bundle_groups, 'general')
  " Inactive
  " Plugin 'hotoo/calendar-vim'
  " Plugin 'Lokaltog/vim-easymotion'
  " Plugin 'Stormherz/tablify'
  " Plugin 'chrisbra/NrrwRgn'
  " Plugin 'kien/ctrlp.vim'
  " Plugin 'tacahiroy/ctrlp-funky'
  " Plugin 'kris89/vim-multiple-cursors'
  " Plugin 'troydm/easybuffer.vim'
  " Plugin 'yonchu/accelerated-smooth-scroll'
  " Plugin 'dkprice/vim-easygrep'
  " Plugin 'hwrod/interactive-replace'
  " Active
  Plugin 'bling/vim-airline'
  Plugin 'mbbill/undotree'
  Plugin 'mhinz/vim-startify'
  Plugin 'tpope/vim-abolish'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-vinegar'
  Plugin 'tpope/vim-bundler'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'tpope/vim-dispatch'
  Plugin 'djoshea/vim-autoread'
endif
" DEVELOPER
if count(g:bundle_groups, 'devel')
  " Inactive
  " Plugin 'mattn/emmet-vim'
  " Plugin 'AzizLight/TaskList.vim'
  " Plugin 'Chiel92/vim-autoformat'
  " Plugin 'Xuyuanp/git-nerdtree'
  " Plugin 'Yggdroot/indentLine'
  " Plugin 'gcmt/wildfire.vim'
  " Plugin 'godlygeek/tabular'
  " Plugin 'mhinz/vim-signify'
  " Plugin 'vim-scripts/LustyExplorer'
  " Plugin 'Raimondi/delimitMate'
  " Plugin 'scrooloose/syntastic'
  " Plugin 'nvie/vim-flake8'
   
  " Active
  Plugin 'kien/rainbow_parentheses.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'vim-scripts/UltiSnips'
  Plugin 'Valloric/YouCompleteMe'
  " Plugin 'majutsushi/tagbar'
  " Plugin 'Command-T'
  Plugin 'tommcdo/vim-exchange'
  Plugin 'mileszs/ack.vim'
  " Plugin 'godlygeek/tabular'
endif
" LANGUAGES"{{{
if count(g:bundle_groups, 'languages')
  " Cpp active
  " Plugin 'octol/vim-cpp-enhanced-highlight'
  " Other active
  Plugin 'vim-scripts/a.vim'
  " Other inactive
  " Plugin 'sheerun/vim-polyglot'
  " Plugin 'othree/html5.vim'
  " Plugin 'pangloss/vim-javascript'
  " Plugin 'othree/javascript-libraries-syntax.vim'
  " Plugin 'ap/vim-css-color'
  " Plugin 'burnettk/vim-angular'
  " Plugin 'davidhalter/jedi-vim'
  " Plugin 'tpope/vim-coffee-script'
  " Plugin 'tpope/vim-rails'
  " Plugin 'vim-ruby/vim-ruby'"}}}
  
  " Haskell inactive
  " Plugin 'eagletmt/ghcmod-vim'
  " Plugin 'Shougo/vimproc.vim'
  " Plugin 'lukerandall/haskellmode-vim'
  " Plugin 'dag/vim2hs'
  " Haskell Active
  Plugin 'bitc/vim-hdevtools'
  Plugin 'raichoo/haskell-vim'
  Plugin 'eagletmt/neco-ghc'
  Plugin 'jpalardy/vim-slime'

  "Markdown active
  " Plugin 'suan/vim-instant-markdown'
  " Plugin 'plasticboy/vim-markdown'
endif
" COLORSCHEME"{{{
if count(g:bundle_groups, 'colorscheme')
  Plugin 'sjl/badwolf'
  Plugin 'flazz/vim-colorschemes'
  " Plugin 'altercation/vim-colors-solarized'
  " Plugin 'morhetz/gruvbox'
  " Plugin 'chriskempson/base16-vim'
  " Plugin 'flazz/vim-colorschemes'
  " Plugin 'guns/xterm-color-table.vim'
  " Plugin 'CSApprox'
endif

" automatically load filetype plugins
filetype plugin indent on
