set nocompatible

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set scrolloff=6

"fold
"set foldmethod=marker
set foldmethod=syntax
set foldnestmax=1

let dotvim_root_dir = fnamemodify(expand('<sfile>'), ":p:h")
let bundle_dir = $HOME . "/.cache/bundle" 

let dein_dir = dotvim_root_dir . "/dein.vim"
echo dein_dir

let &rtp .= "," . dein_dir

"go 
let g:go_fmt_command = "goimports"
let g:go_def_mode = "godef"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_experimental = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" dein plugin {{{

call dein#begin(bundle_dir)

if !has('nvim')   
  call dein#add('roxma/nvim-yarp')   
  call dein#add('roxma/vim-hug-neovim-rpc') 
endif

call dein#add("Shougo/dein.vim")

call dein#add("wsdjeg/dein-ui.vim")
call dein#add("jiangmiao/auto-pairs")
call dein#add("liuchengxu/vim-which-key")
call dein#add("altercation/vim-colors-solarized")
call dein#add("neoclide/coc.nvim")
call dein#add("honza/vim-snippets")
call dein#add("tpope/vim-fugitive")
call dein#add("tpope/vim-surround")
call dein#add("airblade/vim-gitgutter")
call dein#add("junegunn/fzf.vim")
call dein#add("fatih/vim-go")
call dein#add('Shougo/defx.nvim')
call dein#add('kristijanhusak/defx-icons')
call dein#add('junegunn/vim-easy-align')
call dein#add('rust-lang/rust.vim')
call dein#add('ibhagwan/fzf-lua', {'branch': 'main'})
call dein#add('kyazdani42/nvim-web-devicons')


call dein#end()

if dein#check_install()
  call dein#install()
endif

" dein plugin }}}

" set apperance
syntax enable
set number
set showcmd
set guicursor=
set background=dark
colorscheme solarized
set cmdheight=2
set autowrite
set cursorline
set showtabline=2
set splitright " 新分隔窗口在右边
set splitbelow " 新分隔窗口在左边
set showmatch "短暂回显匹配括号

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

let mapleader="\<Space>"
inoremap jk <Esc>
vnoremap jk <Esc>
onoremap jk <Esc>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" fzf-lua
nnoremap <silent><nowait> <leader>j :lua require('fzf-lua').files()<CR>
nnoremap <silent><nowait> <leader>k :lua require('fzf-lua').buffers()<CR>

" vim easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"defx
let g:python3_host_prog = "/usr/bin/python3.7"
call defx#custom#option('_', {
      \ 'resume': 1,
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'toggle': 1,
      \ })
nnoremap <silent> <Leader>e :Defx -columns=indent:icons:filename:type<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
	setl nospell
	setl nonumber
" Define mappings
nnoremap <silent><buffer><expr> <CR> defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')
nnoremap <silent><buffer><expr> c  defx#do_action('copy')
nnoremap <silent><buffer><expr> m  defx#do_action('move')
nnoremap <silent><buffer><expr> p  defx#do_action('paste')
nnoremap <silent><buffer><expr> l  defx#do_action('open_or_close_tree')
nnoremap <silent><buffer><expr> s  defx#do_action('drop', 'split')
nnoremap <silent><buffer><expr> v  defx#do_action('drop', 'vsplit')
nnoremap <silent><buffer><expr> t  defx#do_action('drop', 'tabe')
nnoremap <silent><buffer><expr> P  defx#do_action('preview')
nnoremap <silent><buffer><expr> o  defx#do_action('open_tree', 'toggle')
nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
nnoremap <silent><buffer><expr> N  defx#do_action('new_file')
nnoremap <silent><buffer><expr> M  defx#do_action('new_multiple_files')
nnoremap <silent><buffer><expr> C  defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
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

" vim-go 
set updatetime=300
let g:go_auto_type_info = 1
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" coc
"
let g:coc_global_extensions = ['coc-snippets', 'coc-python', 'coc-json']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

augroup user_plugin_coc
	autocmd!
	autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<Down>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<Up>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>" : "\<C-u>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <Leader>p <Plug>(coc-format)

nmap gs <Plug>(coc-git-chunkinfo)
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show commit contains current position
nmap gC <Plug>(coc-git-commit)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		let l:found = CocAction('doHover')
	endif
endfunction
