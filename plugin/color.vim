" Filename: lightline-pika.vim
" Maintainer: Leo Mao
"
" Lightline settings used in pika-vim
" https://github.com/leomao/pika-vim

let s:base04 = [ '#1c1c1c', 234 ]
let s:base03 = [ '#262626', 235 ]
let s:base023 = [ '#3a3a3a ', 237 ]
let s:base02 = [ '#444444 ', 238 ]
let s:base01 = [ '#585858', 240 ]
let s:base00 = [ '#666666', 242  ]
let s:base0 = [ '#808080', 244 ]
let s:base1 = [ '#969696', 247 ]
let s:base2 = [ '#a8a8a8', 248 ]
let s:base3 = [ '#d0d0d0', 252 ]
let s:yellow = [ '#ffff00', 226 ]
let s:orange = [ '#e5786d', 173 ]
let s:red = [ '#e5786d', 203 ]
let s:magenta = [ '#ffaf00', 214 ]
let s:blue = [ '#0087ff', 69 ]
let s:green = [ '#95e454', 119 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base03, s:blue, 'bold' ], [ s:yellow, s:base04 ], [ s:base3, s:base01 ] ]
let s:p.insert.left = [ [ s:base03, s:green, 'bold' ], [ s:yellow, s:base04 ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base03, s:magenta, 'bold' ], [ s:yellow, s:base04 ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base03, s:red, 'bold' ], [ s:yellow, s:base04 ], [ s:base3, s:base01 ] ]
let s:p.inactive.left =  [ [ s:base1, s:base02 ], [ s:base00, s:base023 ] ]
let s:p.normal.right = [ [ s:base02, s:base3 ], [ s:base1, s:base01 ] ]
let s:p.inactive.right = [ [ s:base023, s:base01 ], [ s:base00, s:base02 ] ]
let s:p.normal.middle = [ [ s:base2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base1, s:base03 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base2, s:base023 ] ]
let s:p.tabline.middle = [ [ s:base02, s:base1 ] ]
let s:p.tabline.right = [ [ s:base2, s:base01 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#pika#palette = lightline#colorscheme#flatten(s:p)
