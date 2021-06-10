set nocompatible

" set apperance
syntax on
set number
set showcmd
set laststatus=2


" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

let dotvim_root_dir = fnamemodify(expand('<sfile>'), ":p:h")
let bundle_dir = dotvim_root_dir . "\\bundle" 

let dein_dir = dotvim_root_dir . "\\dein.vim"

let &rtp .= "," . dein_dir

" dein plugin {{{

call dein#begin(bundle_dir)

if !has('nvim')   
  call dein#add('roxma/nvim-yarp')   
  call dein#add('roxma/vim-hug-neovim-rpc') 
endif

call dein#add("Shougo/dein.vim")

call dein#add("wsdjeg/dein-ui.vim")
call dein#add("liuchengxu/vim-which-key")
call dein#add("altercation/vim-colors-solarized")
"call dein#add("neoclide/coc.nvim")
call dein#add("tpope/vim-fugitive")
call dein#add("tpope/vim-surround")
"call dein#add("airblade/vim-gitgutter")
call dein#add("junegunn/fzf.vim")
"call dein#add("fatih/vim-go.vim")

call dein#end()

if dein#check_install()
  call dein#install()
endif

" dein plugin }}}


set background=light
colorscheme solarized
