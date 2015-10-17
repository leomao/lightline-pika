" Filename: lightline-pika.vim
" Maintainer: Leo Mao
"
" Lightline settings used in pika-vim
" https://github.com/leomao/pika-vim

if exists('g:loaded_lightline_pika') || v:version < 700
  finish
endif
let g:loaded_lightline_pika = 1

let s:save_cpo = &cpo
set cpo&vim

let g:lightline = extend(get(g:, 'lightline', {}), {
      \ 'colorscheme': 'pika',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive'], [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ 'close' ] ]
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum', 'readonly', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'readonly', 'filename', 'modified' ]
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2c',
      \ },
      \ 'component_function': {
      \   'mode': 'lightline_pika#mode',
      \   'fugitive': 'lightline_pika#fugitive',
      \   'filename': 'lightline_pika#filename',
      \   'fileformat': 'lightline_pika#fileformat',
      \   'filetype': 'lightline_pika#filetype',
      \   'fileencoding': 'lightline_pika#fileencoding',
      \ },
      \ }, 'keep')

let &cpo = s:save_cpo
unlet s:save_cpo
