" KEYMAPPINGS
"DISABLED DEFAULT MAPPING: UNSET SHORTCUTS {{{
  " Unmapping help from F1 and Ctrl-F1 for use toggling the reference manual
  " the :h topic feature works, and <Leader><F1> displays quickref
  inoremap <F1> <nop>
  nnoremap <F1> <nop>
  vnoremap <F1> <nop>
  "unmap the suspend function
  map <C-z> <Nop>
"}}}

" Set mapleader
let g:mapleader=","
nnoremap ,, ,

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" netrw
" map <silent> <C-o> :Explore<CR>

" spacebar create/open/close folding
nmap <silent> <Space> za
vmap <silent> <Space> zf

" enable/disable list
nmap <silent> <Leader>l :set nolist!<CR>

" ,/ turn off search highlighting
nmap <silent><Leader>/ :nohls<CR>

" Sudo to write
cmap w!! :w !sudo tee % >/dev/null

" write control
" noremap <silent> <C-s> :update<CR>
noremap <silent> <C-s> :write<CR>

" Alt-key mapping
noremap <silent> s :wa<CR>
" inoremap <silent> <C-S> <Esc>:wa<CR>
inoremap <silent> <C-S> <Esc>:wa<CR>

map q :q<CR>
map Q :qa<CR>

" Quick alignment of text
nmap <Leader>al :left<CR>
nmap <Leader>ar :right<CR>
nmap <Leader>ac :center<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
" nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
" nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
" nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
" nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Spell commands
" nmap ?n ]s
" nmap ?p [s
" nmap ?+ zg
" nmap ?? z=

" Improve up/down movement on wrapped lines
" nnoremap j gj
" nnoremap k gk

" Session controls
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>

" Make Y consistent with C and D
nnoremap Y y$

" jump to start/end of line
" noremap H ^
" noremap L $

noremap <C-h> ^
noremap <C-l> $

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap
" nnoremap Q @='n.'<Esc>

" Use tab to indent a line
" vnoremap <Tab> >gv
" vnoremap <S-Tab> <gv
" nnoremap <Tab> >>
" nnoremap <S-Tab> <<

" Map command-[ and command-] to indenting or outdenting
" while keeping the original selection in visual mode
"vmap ] >gv
"vmap [ <gv
"nmap ] >>
"nmap [ <<
"imap ] <Esc>>>i
"imap [ <Esc><<i

" Easier increment/decrement
nmap + <C-a>
nmap - <C-x>

" Keep search pattern at the center of the screen
" nmap <silent> n nzz
" nmap <silent> N Nzz
" nmap <silent> * *zz
" nmap <silent> # #zz
" nmap <silent> g* g*zz
" nmap <silent> g# g#zz

" Circular windows navigation
map <Leader>o :only<CR>

" Drag Current Line/s Vertically
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
nmap <A-k> [e
nmap <A-j> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
vmap <A-k> [egv
vmap <A-j> ]egv

" move between buffers
" nmap <C-S-TAB> :bprev<CR>
" nmap <C-TAB> :bnext<CR>

" switch to the directory of the open buffer
map <Leader>cd :cd %:p:h<cr>

" set text wrapping toggles
nmap <silent> tw :set invwrap<CR>:set wrap?<CR>

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap g [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Underline the current line with '-'
nmap <silent> <leader>ul :t.<CR>Vr-

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Move between tabs
map <Leader>h :tabp<CR>
map <Leader>l :tabn<CR>

" Controlled pasting
nmap <Leader>P :s/[^ ]$/& /e<CR>$p:nohlsearch<CR>
map <Leader>p @='"+P'<Esc>

" config open
map <Leader>rc :tabnew $MYVIMRC<CR>
map <Leader>rcm :tabnew ~/.vim/map.vim<CR>
map <Leader>rcp :tabnew ~/.vim/plugins.vim<CR>
map <Leader>rcb :tabnew ~/.vim/bundles.vim<CR>
map <Leader>rcf :tabnew ~/.vim/functions.vim<CR>
map <Leader>rcs :tabnew ~/.vim/settings.vim<CR>
map <Leader>rca :tabnew ~/.vim/autocmd.vim<CR>
map <Leader>rcy :tabnew /opt/vim74/share/vim/vim74/ftplugin/cpp/.ycm_extra_conf.py<CR>

" snippet edition
map <Leader>scp :vsplit /usr/share/vim/vimfiles/UltiSnips/cpp.snippets<CR>
map <Leader>scc :vsplit /usr/share/vim/vimfiles/UltiSnips/c.snippets<CR>

" tab control
map <Leader>T :tabnew
map <Leader>vt :tabnew ~/tips/vim_tips<CR>
map <Leader>ww :vsplit<CR>:e 
map <Leader>wv :split<CR>:e 

" quick copy to clipboard
map <Leader>yy ^"+y$

" move between tags
map <Leader>[ :tp<CR>
map <Leader>] :tn<CR>

" spell toggle
nmap cse :set spell! spelllang=en<CR>
nmap csp :set spell! spelllang=pl<CR>

" search expressions
noremap <expr> :: ':%S:::g \|norm!``'.repeat("\<Left>", 12)
noremap <expr> :" ':.,.+S:::g \|norm!``'.repeat("\<Left>",14)
noremap <expr> :> ':.S:::g \|norm!``'.repeat("\<Left>", 12)
noremap <expr> :$ ':.,$S:::g \|norm!``'.repeat("\<Left>", 12)

noremap <expr> :C: ':%S:::gc'.repeat("\<Left>", 4)
noremap <expr> :C" ':.,.+S:::gc'.repeat("\<Left>", 6)
noremap <expr> :C> ':.S:::gc'.repeat("\<Left>", 4)
noremap <expr> :C$ ':.,$S:::gc'.repeat("\<Left>", 4)

" tab switching
map ≠ :tabn 1<cr>
map ² :tabn 2<cr>
map ³ :tabn 3<cr>
map ¢ :tabn 4<cr>
map € :tabn 5<cr>
map ½ :tabn 6<cr>

" s-tab fix
" map <Esc>[Z <s-tab>
" map [Z <s-tab>
" ounmap [Z
" map [Z <c-p>

" map <C-k> :pyf /home/skramer/scripts/clang-format.py<cr>
nmap <silent> <C-k> :1,$pyf /home/skramer/scripts/clang-format.py<cr>
vmap <silent> <C-k> :pyf /home/skramer/scripts/clang-format.py<cr>
imap <C-k> <c-o>:pyf /home/skramer/scripts/clang-format.py<cr>

" Trigger makefile
nmap <silent> <F5> :wa<CR>:Make<CR>
imap <silent> <F5> <Esc>:wa<CR>:Make<CR>

" Trigger clang-check
nmap <silent> <F4> :Dispatch scan-build -v `cat /home/skramer/scripts/scan_build_checker_list` <c-r>=GetScanBuildMakePrgString()<CR><CR>
imap <silent> <F4> <Esc>:Dispatch scan-build -v `cat /home/skramer/scripts/scan_build_checker_list` <c-r>=GetScanBuildMakePrgString()<CR><CR>i

" Trigger clang-rename
map  <leader>rr :call ClangRename()<CR>
imap  <leader>rr <C-o>:call ClangRename()<CR>i
