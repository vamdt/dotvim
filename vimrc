set nocompatible
syntax on
filetype plugin indent on

let dotvim_root_dir = fnamemodify(expand('<sfile>'), ":p:h")
let bundle_dir = dotvim_root_dir . "\\bundle" 

let dein_dir = dotvim_root_dir . "\\dein.vim"

let &rtp .= "," . dein_dir

" dein plugin {{{

call dein#begin(bundle_dir)
call dein#end()
call dein#save_state()

" dein plugin }}}

