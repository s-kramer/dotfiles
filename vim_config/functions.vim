" FUNCTIONS
function! ToggleSpell()
  if &spell
    if &spelllang == "pt"
      set spelllang=pt,en
      echo "toggle spell" &spelllang
    elseif &spelllang == "pt,en"
      set spelllang=en
      echo "toggle spell" &spelllang
    else
      set spell!
      echo "toggle spell off"
    endif
  else
    set spelllang=pt
    set spell!
    echo "toggle spell" &spelllang
  endif
endfunction
" Toggle spell check
nmap <silent>ts :call ToggleSpell()<CR>

" Convert variable case
function! TwistCase(str)
  if a:str =~# '^[a-z0-9_]\+[!?]\?$'
    let result = substitute(a:str, '_', '-', 'g')
  elseif a:str =~# '^[a-z0-9?!-]\+[!?]\?$'
    let result = substitute(a:str, '\C-\([^-]\)', '\u\1', 'g')
  elseif a:str =~# '^[a-z0-9]\+\([A-Z][a-z0-9]*\)\+[!?]\?$'
    let result = toupper(a:str[0]) . strpart(a:str, 1)
  elseif a:str =~# '^\([A-Z][a-z0-9]*\)\{2,}[!?]\?$'
    let result = strpart(substitute(a:str, '\C\([A-Z]\)', '_\l\1', 'g'), 1)
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vmap ^ ygv"=TwistCase(@")<CR>Pgv

function! DualView()
  if &columns == '80'
    set lines=50 columns=160
    only
    vsplit
  else
    set lines=50 columns=80
    only
  endif
endfunction
nmap <silent><Leader>d :call DualView()<CR>

function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    exe '1,' . n . 's#^\(.\{,10}Last Change:\).*#\1'
          \ strftime("%a %d/%b/%Y hr %H:%M") . '#e'
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()

function! MyFoldText()
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
  return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction

fun! ToggleFold()
  if &foldmethod == 'marker'
    exe 'set foldmethod=indent'
  else
    exe 'set foldmethod=marker'
  endif
endfun
map <silent>tf :call ToggleFold()<cr>

function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Enable the auto-creation of missing folders in a save path
if !exists('*s:MakeNewDir')
  function s:MakeNewDir(fullpath, buf)
    if empty(getbufvar(a:buf,'&buftype')) && a:fullpath!~#'\v^\w+\:\/'
      let dirpath=fnamemodify(a:fullpath,':h')
      if !isdirectory(dirpath)|call mkdir(dirpath,'p')|endif
    endif
  endfunction
  augroup WriteDir
    autocmd!
    autocmd BufWritePre * :call s:MakeNewDir(expand('<afile>'),+expand('<abuf>'))
  augroup END
endif

" Enable vim-check while typing
function! ClangCheckImpl(cmd)
  if &autowrite | wall | endif
  echo "Running " . a:cmd . " ..."
  let l:output = system(a:cmd)
  cexpr l:output
  cwindow
  let w:quickfix_title = a:cmd
  if v:shell_error != 0
    cc
  endif
  let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
  let l:filename = expand('%')
  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
    call ClangCheckImpl("clang-check -p build " . l:filename)
  elseif exists("g:clang_check_last_cmd")
    call ClangCheckImpl(g:clang_check_last_cmd)
  else
    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
  endif
endfunction

function! GetBuildMakePrgString()
    return GetMakePrgStringForPath("build")
endfunction

function! GetScanBuildMakePrgString()
    return GetMakePrgStringForPath("scan-build")
endfunction

function! GetMakePrgStringForPath(build_path)
    return "make -s -C ".a:build_path
endfunction

function! ClangRename()
    call inputsave()
    let l:newName = input('Enter new name for '.expand("<cword>").': ')
    call inputrestore()
    if l:newName == ""
        return
    endif

python << EOF
import sys
import vim
sys.argv = [vim.eval("newName")]
EOF

    execute "echo '\n'"
    execute "wall"
    execute "pyf /home/skramer/scripts/clang-rename.py"
endfunct
