" Filename: lightline-pika.vim
" Maintainer: Leo Mao
"
" Lightline settings used in pika-vim
" https://github.com/leomao/pika-vim

let s:save_cpo = &cpo
set cpo&vim

let s:branch = ''
let s:ro = 'RO'

if exists('g:lightline_pika_patchfont')
  let s:branch = get(g:lightline_pika_patchfont, 'branch', '')
  let s:ro = get(g:lightline_pika_patchfont, 'readonly', '')
endif

let s:ft_mode = {
      \ 'qf': 'QuickFix',
      \ 'tagbar': 'Tagbar',
      \ 'nerdtree': 'NERD Tree',
      \ 'undotree': 'Undo Tree',
      \ }

let s:fn_mode = {
      \ '[Command Line]': 'Command Line',
      \ '[BufExplorer]': 'BufExplorer',
      \ }

let s:sim_fn_mode = {
      \ 'diffpanel': 'Undo Diff',
      \ }

let s:mode_fn = {
      \ 'Tagbar': "get(g:lightline, 'fname', expand('%:t'))",
      \ }

let s:sub_fn = {
      \ '^\[preview': 'Preview',
      \ }

function! s:get_special_mode() abort
  let f = expand('%:t')
  let special = get(s:ft_mode, &ft, get(s:fn_mode, f, ''))
  if strlen(special)
    return special
  else
    for target in keys(s:sim_fn_mode)
      if f =~# target
        return s:sim_fn_mode[target]
      endif
    endfor
  endif
  return ''
endfunction

function! s:update_fugitive() abort
  let b:lightline_fugitive = ''
  try
    if exists('*gitbranch#name')
      let _ = gitbranch#name()
    elseif exists('*fugitive#head')
      let _ = fugitive#head()
    endif
    if strlen(_)
      let b:lightline_fugitive = s:branch . _
    endif
  catch
  endtry
endfunction

augroup LightLinePika
  autocmd!
  autocmd BufEnter,BufRead,BufWrite * call <SID>update_fugitive()
augroup END

function! lightline_pika#filename() abort
  let special = s:get_special_mode()
  let f = expand('%:t')
  if strlen(special)
    return eval(get(s:mode_fn, special, '""'))
  endif
  if has_key(b:, 'lightline_filename') && get(b:, 'lightline_filename_', '') ==# f . &mod . &ma
    return b:lightline_filename
  endif
  if !strlen(f)
    let f = '[No Name]'
  endif
  let b:lightline_filename_ = f . &mod . &ma
  let default = join(filter([&ro ? s:ro : '', f, &mod ? '+' : &ma ? '' : '-'], 'len(v:val)'), ' ')
  for target in keys(s:sub_fn)
    if f =~# target
      let default = s:sub_fn[target]
    endif
  endfor
  let b:lightline_filename = default
  if len(b:lightline_filename) > winwidth(0)
    let b:lightline_filename = matchstr(b:lightline_filename, repeat('.', strchars(b:lightline_filename) * winwidth(0) / len(b:lightline_filename)))
  endif
  return b:lightline_filename
endfunction

function! lightline_pika#fugitive() abort
  if !has_key(b:, 'lightline_fugitive')
    call s:update_fugitive()
  endif
  if strlen(s:get_special_mode())
    return ''
  endif
  return b:lightline_fugitive
endfunction

function! lightline_pika#mode() abort
  let special = s:get_special_mode()
  if strlen(special)
    return special
  else
    return winwidth(0) > 60 ? lightline#mode() : ''
  endif
endfunction

function! lightline_pika#fileformat() abort
  return winwidth(0) > 70 ? &ff : ''
endfunction

function! lightline_pika#filetype() abort
  return winwidth(0) > 70 ? (strlen(&ft) ? &ft : 'plain') : ''
endfunction

function! lightline_pika#fileencoding() abort
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

" TagBar settings
let g:tagbar_status_func = 'lightline_pika#tagbar_status_func'
function! lightline_pika#tagbar_status_func(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
