set nocompatible

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

let dotvim_root_dir = fnamemodify(expand('<sfile>'), ":p:h")
let bundle_dir = $HOME . "/.cache/bundle" 

let dein_dir = dotvim_root_dir . "/dein.vim"
echo dein_dir

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
call dein#add("liuchengxu/vim-clap")
call dein#add("fatih/vim-go")
call dein#add('Shougo/defx.nvim')
call dein#add('ryanoasis/vim-devicons')

call dein#end()

if dein#check_install()
  call dein#install()
endif

" dein plugin }}}

" set apperance
syntax on
set number
set showcmd
set guicursor=
set background=light
colorscheme solarized

" encoding
set encoding=utf-8
set termencoding=utf-8
set fenc=utf-8
set fencs=ucs-bom,utf-8,gb18030,gbk,gb2312,cp936,big5,euc-jp,latin1

" status line
set laststatus=2
set statusline =[%n]\ %f%h%w%m%r
set statusline+=\ \|\  
set statusline+=%{fugitive#head()!=''?''.fugitive#head().'':''}
set statusline+=\ \|\  
set statusline+=%y:%{&ff}:%{&fenc!=''?&fenc:&enc}:%L
set statusline+=%=
set statusline+=\ %l,%c\ %P

"defx
let g:python3_host_prog = "D:\\Python\\Python36-32\\python.exe"
call defx#custom#option('_', {
      \ 'resume': 1,
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'toggle': 1,
      \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
" Define mappings
nnoremap <silent><buffer><expr> <CR>  defx#do_action('drop')
nnoremap <silent><buffer><expr> c  defx#do_action('copy')
nnoremap <silent><buffer><expr> m  defx#do_action('move')
nnoremap <silent><buffer><expr> p  defx#do_action('paste')
nnoremap <silent><buffer><expr> l  defx#do_action('open_or_close_tree')
nnoremap <silent><buffer><expr> E  defx#do_action('open', 'vsplit')
nnoremap <silent><buffer><expr> P  defx#do_action('preview')
nnoremap <silent><buffer><expr> o  defx#do_action('open_tree', 'toggle')
nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
nnoremap <silent><buffer><expr> N  defx#do_action('new_file')
nnoremap <silent><buffer><expr> M  defx#do_action('new_multiple_files')
nnoremap <silent><buffer><expr> C  defx#do_action('toggle_columns',
		\                'mark:indent:icon:filename:type:size:time')
nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'time')
nnoremap <silent><buffer><expr> d  defx#do_action('remove')
nnoremap <silent><buffer><expr> r  defx#do_action('rename')
nnoremap <silent><buffer><expr> !  defx#do_action('execute_command')
nnoremap <silent><buffer><expr> x  defx#do_action('execute_system')
nnoremap <silent><buffer><expr> yy  defx#do_action('yank_path')
nnoremap <silent><buffer><expr> .   defx#do_action('toggle_ignored_files')
nnoremap <silent><buffer><expr> ;  defx#do_action('repeat')
nnoremap <silent><buffer><expr> h  defx#do_action('cd', ['..'])
nnoremap <silent><buffer><expr> ~  defx#do_action('cd')
nnoremap <silent><buffer><expr> q  defx#do_action('quit')
nnoremap <silent><buffer><expr> <Space>  defx#do_action('toggle_select') . 'j'
nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
nnoremap <silent><buffer><expr> j  line('.') == line('$') ? 'gg' : 'j'
nnoremap <silent><buffer><expr> k  line('.') == 1 ? 'G' : 'k'
nnoremap <silent><buffer><expr> <C-l>  defx#do_action('redraw')
nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')
nnoremap <silent><buffer><expr> cd  defx#do_action('change_vim_cwd')
endfunction

