local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  'altercation/vim-colors-solarized',
  'lifepillar/vim-solarized8',
  { 'neoclide/coc.nvim', branch= 'release' },
   'jiangmiao/auto-pairs',
   'honza/vim-snippets',
   'tpope/vim-fugitive',
   'airblade/vim-gitgutter',
   'Shougo/defx.nvim',
   'kristijanhusak/defx-git',
   'kristijanhusak/defx-icons',
   't9md/vim-choosewin',
   'fatih/vim-go',
   'junegunn/vim-easy-align',
   'ibhagwan/fzf-lua',
 
   'kyazdani42/nvim-web-devicons',
   'numToStr/FTerm.nvim',
   {'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
})
