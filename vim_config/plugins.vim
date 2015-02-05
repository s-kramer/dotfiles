" PLUGINS CONFIG
" calendar"{{{
  " nmap <Leader>ca :Calendar<CR>
  " let g:calendar_list = [
  " \   {'name': 'Tasks', 'path': $HOME.'/.vim/.tasks', 'ext': 'task'},
  " \   {'name': 'Diary', 'path': $HOME.'/.vim/.diary', 'ext': 'diary'},
  " \ ]
  " let g:calendar_current_idx = 1"}}}

" airline"{{{
  let g:airline_enable_branch=1
  let g:airline_detect_modified=1
  let g:airline_detect_paste=1
  let g:airline_inactive_collapse=1
   "let g:bufferline_echo = 0
   "let g:airline#extensions#bufferline#enabled = 1
  let g:airline#extensions#syntastic#enabled = 1
  let g:airline#extensions#hunks#enabled = 1
  let g:airline#extensions#ctrlp#show_adjacent_modes = 1
  let g:airline#extensions#whitespace#enabled = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_theme='base16'
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  if GUI()
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    if !exists('g:airline_powerline_fonts')
      "let g:airline_left_sep = ''
      "let g:airline_right_sep = ''
      let g:airline_symbols.branch = ''
      let g:airline_symbols.linenr = ''
    endif
  endif
"}}}

" buffergator"{{{
  " nmap <silent><Leader>b :EasyBuffer<CR>"}}}

" ctrlp"{{{
  " let g:ctrlp_cache_dir = $HOME.'/.vim/.ctrlp_cache'
  " let g:ctrlp_working_path_mode = 'ra'
  " let g:ctrlp_extensions = ['funky']

  " nmap <silent>cp :CtrlPMixed<CR>
  " nmap <silent>cm :CtrlPMRUFiles<CR>
  " nmap <silent>cf :CtrlPFunky<CR>
  " nmap <silent>cl :CtrlPLine<CR>
  " nmap <silent>cb :CtrlPBuffer<CR>
  " nmap <silent>ct :CtrlPBufTag<CR>

  " let g:ctrlp_custom_ignore = {
        " \ 'dir': '\.git$\|\.hg$\|\.svn$',
        " \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

  " On Windows use "dir" as fallback command.
  " if WINDOWS()
    " let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
  " elseif executable('ag')
    " let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
  " elseif executable('ack')
    " let s:ctrlp_fallback = 'ack %s --nocolor -f'
  " else
    " let s:ctrlp_fallback = 'find %s -type f'
  " endif"

  " let g:ctrlp_user_command = {
        " \ 'types': {
        " \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        " \ 2: ['.hg', 'hg --cwd %s locate -i .'],
        " \ },
        " \ 'fallback': s:ctrlp_fallback
        " \ }"}}}

" easymotion"{{{
  " let g:EasyMotion_leader_key = 'e'
  " hi link EasyMotionTarget ErrorMsg
  " hi link EasyMotionShade  Comment"}}}

" emmet"{{{
  " let g:user_emmet_leader_key = '<C-e>'"}}}

" fugitive"{{{
  " nmap <silent> <leader>gs :Gstatus<CR>
  " nmap <silent> <leader>gd :Gdiff<CR>
  " nmap <silent> <leader>gc :Gcommit<CR>
  " nmap <silent> <leader>gb :Gblame<CR>
  " nmap <silent> <leader>gl :Glog<CR>
  " nmap <silent> <leader>gp :Git push<CR>
  " nmap <silent> <leader>gr :Gread<CR>
  " nmap <silent> <leader>gw :Gwrite<CR>
  " nmap <silent> <leader>ge :Gedit<CR>
  " " Mnemonic _i_nteractive
  " nmap <silent> <leader>gi :Git add -p %<CR>
  " nmap <silent> <leader>gg :SignifyToggle<CR>"}}}

" indent guides"{{{
  " let g:indentLine_char = '│'
  " let g:indentLine_faster = 1"}}}

" NERDTree"{{{
  " nmap <silent><Leader>nt :NERDTreeToggle<CR>
  " let g:NERDTreeBookmarksFile = expand($HOME.'/.vim/.NERDTreeBookmarks')
  " let g:NERDTreeWinPos = "right"
  " let g:NERDTreeShowBookmarks = 1
  " let g:NERDTreeWinSize = 40
  " let g:NERDTreeChristmasTree = 0
  " let g:NERDTreeCaseSensitiveSort = 1
  " let g:NERDTreeQuitOnOpen = 1
  " let g:NERDTreeShowHidden = 1
  " let g:NERDTreeMouseMode = 2
  " let g:NERDTreeIgnore=[
        " \'\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
        " \ '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$' ]"}}}

" less"{{{
  " nmap <Leader>css :w <BAR> !lessc % > %:t:r.css<CR><space>"}}}

" rainbow parentheses"{{{
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces"}}}

" " signify"{{{
  " let g:signify_sign_overwrite = 1
  " let g:signify_sign_add = '+'
  " let g:signify_sign_change = '!'
  " let g:signify_sign_delete = '-'
  " let g:signify_sign_delete_first_line = '-'"}}}

" syntastic"{{{
  let g:syntastic_enable_balloons = 1
  let g:syntastic_auto_jump=0
  let g:syntastic_always_populate_loc_list=1
  let g:syntastic_auto_loc_list=1
  let g:syntastic_loc_list_height=5
  let g:syntastic_enable_signs=1
  let g:syntastic_error_symbol='✗'
  let g:syntastic_warning_symbol='⚠'
  let g:syntastic_haskell_checkers = ['ghc-mod', 'hdevtools', 'hlint']

  let g:syntastic_python_python_exec = '/usr/bin/python2.7'
  "}}}


" tabularize"{{{
  " vmap <Leader>a=  :Tabularize /=<CR>
  " vmap <Leader>a#  :Tabularize /#<CR>
  " vmap <Leader>a'  :Tabularize /'<CR>
  " vmap <Leader>a"  :Tabularize /"<CR>
  " vmap <Leader>a)  :Tabularize /)/r1c1l0<CR>
  " vmap <Leader>a== :Tabularize /=/r1c1l0<CR>
  " vmap <Leader>a:  :Tabularize /:<CR>
  " vmap <Leader>a:: :Tabularize /:\zs<CR>
  " vmap <Leader>a,  :Tabularize /,<CR>
  " vmap <Leader>a,, :Tabularize /,\zs<CR>"}}}

" undotree"{{{
  nmap <silent>U :UndotreeToggle<CR>
  " If undotree is opened, it is likely one wants to interact with it.
  let g:undotree_SetFocusWhenToggle=1"}}}

" neocomplete"{{{
  " let g:neocomplete#enable_at_startup = 1
  " let g:neocomplete#enable_smart_case = 1
  " let g:neocomplete#enable_auto_delimiter = 1
  " let g:neocomplete#max_list = 15
  " let g:neocomplete#force_overwrite_completefunc = 1

   " "Use honza's snippets.
  " let g:neosnippet#snippets_directory=expand($HOME.'/.vim/bundle/vim-snippets/snippets')

  " " Define keyword.
  " if !exists('g:neocomplete#keyword_patterns')
      " let g:neocomplete#keyword_patterns = {}
  " endif
  " let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " SuperTab like snippets behavior.
  " imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  " \ "\<Plug>(neosnippet_expand_or_jump)"
  " \: pumvisible() ? "\<C-n>" : "\<TAB>"
  " smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  " \ "\<Plug>(neosnippet_expand_or_jump)"
  " \: "\<TAB>"

  " Some convenient mappings
  " imap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"
  " imap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"

  " imap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
  " imap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"

  " imap <expr><Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
  " "imap <expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"

  " " <CR>: close popup
  " function! SmartReturn()
    " if pumvisible()
      " if neosnippet#expandable()
        " let expand = "\<Plug>(neosnippet_expand)"
        " return expand . neocomplete#smart_close_popup()
      " else
        " return neocomplete#smart_close_popup()
      " endif
    " else
      " return "\<CR>"
    " endif
  " endfunction
  " " <CR> close popup and save indent or expand snippet
  " imap <expr> <CR> SmartReturn()

  " " Enable heavy omni completion.
  " if !exists('g:neocomplete#sources#omni#input_patterns')
    " let g:neocomplete#sources#omni#input_patterns = {}
  " endif
  " let g:neocomplete#sources#omni#input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
  " let g:neocomplete#sources#omni#input_patterns.cpp='[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
  " let g:neocomplete#sources#omni#input_patterns.xml='<[^>]*'
  " let g:neocomplete#sources#omni#input_patterns.html='<[^>]*'
  " let g:neocomplete#sources#omni#input_patterns.markdown='<[^>]*'
  " let g:neocomplete#sources#omni#input_patterns.css='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
  " let g:neocomplete#sources#omni#input_patterns.less='^\s\+\w+\|\w+[):;]?\s\+\|[@!]'
  " let g:neocomplete#sources#omni#input_patterns.javascript='[^. \t]\.\%(\h\w*\)\?'
  " let g:neocomplete#sources#omni#input_patterns.json='[^. \t]\.\%(\h\w*\)\?'
  " let g:neocomplete#sources#omni#input_patterns.python='[^. *\t]\.\h\w*\|\h\w*::'
  " let g:neocomplete#sources#omni#input_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
  " let g:neocomplete#sources#omni#input_patterns.php='[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
  " let g:neocomplete#sources#omni#input_patterns.python3='[^. *\t]\.\h\w*\|\h\w*::'
  " let g:neocomplete#sources#omni#input_patterns.go='\h\w*\%.'
  " let g:neocomplete#sources#omni#input_patterns.perl='\h\w*->\h\w*\|\h\w*::'
  " let g:neocomplete#sources#omni#input_patterns.java='\%(\h\w*\|)\)\.'

  " " For snippet_complete marker.
  " if has('conceal')
      " set conceallevel=2 concealcursor=i
  " endif

  " " Enable omni completion.
  " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  " autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  " autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags"}}}

  " UntiSnips"{{{
  let g:UltiSnipsExpandTrigger="<c-j>"
  " let g:UltiSnipsSnippetDirectories=["/home/skramer/.vim/bundle/UltiSnips/UltiSnips", "/usr/share/vim/vimfiles/UltiSnips"]"}}}
  let g:UltiSnipsSnippetDirectories=["/home/skramer/.vim/bundle/UltiSnips/UltiSnips"]
  "}}}

  " YouCompleteMe"{{{
  let g:ycm_confirm_extra_conf = 0
  let g:ycm_global_ycm_extra_conf = '/opt/vim74/share/vim/vim74/ftplugin/cpp/.ycm_extra_conf.py'
  let g:ycm_enable_diagnostic_signs = 1
  let g:ycm_enable_diagnostic_highlighting = 1
  let g:ycm_autoclose_preview_window_after_completion = 0
  let g:ycm_complete_in_comments = 1
  highligh YcmErrorSection ctermfg = 3
  highligh YcmErrorSection ctermbg = 1
  let g:ycm_add_preview_to_completeopt = 1
"}}}

  " CommandT"{{{
  let g:CommandTMatchWindowReverse = 1
  let g:CommandTMaxCachedDirectories = 5
  let g:CommandTMaxFiles = 5000
  let g:CommandTMaxDepth = 20
  let g:CommandTMaxHeight = 10
  nmap <Leader>e :CommandT<CR>
"}}}

  " NERDCommenter"{{{
  let NERDSpaceDelims = 1
  let NERD_c_alt_style = 1
  let NERD_haskell_alt_style = 1
  let NERD_haskel_alt_style = 1
  let NERD_HASKELL_alt_style = 1
"}}}

  " Latex-suite"{{{
  " set grepprg=grep\ -nH\ $*
  " let g:tex_flavor='latex'
  " let g:Tex_DefaultTargetFormat='pdf'
  " let g:Tex_MultipleCompileFormats='pdf'"}}}

  " Tagbar"{{{
  map <Leader>tl :TagbarToggle<CR>"}}}

  " DelimitMate"{{{
  " let delimitMate_matchpairs = "(:),[:],{:},<:>"
  " au FileType cpp let b:delimitMate_matchpairs = "(:),[:],{:},<:>,<<: , < :\b" "}}}
  "
  " vim-abolish
  map // :S/

  " ghc-mod
  " let $PATH = $PATH . ':' . expand('~/.cabal/bin')
  "
  " haskell-vim
  let g:haskell_indent_if = 3
  let g:haskell_indent_case = 5
  let g:haskell_indent_let = 4
  let g:haskell_indent_where = 6
  let g:haskell_indent_do = 3
  let g:haskell_indent_in = 1
  let g:haskell_enable_quantification = 1
  let g:haskell_enable_recursivedo = 1
  let g:haskell_enable_arrowsyntax = 1
  let g:haskell_enable_pattern_synonyms = 1
  let g:haskell_enable_typeroles = 1


  " vim-slime
  let g:slime_target = "tmux"

  " hdevtools
  au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
  au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
  au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

  " jedi-vim
 " let g:jedi#popup_select_first=0
