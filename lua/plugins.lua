return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'altercation/vim-colors-solarized'
  use 'lifepillar/vim-solarized8'
  
  use { 'neoclide/coc.nvim', 
        branch= 'release'
  }
  use 'jiangmiao/auto-pairs'
  use 'honza/vim-snippets'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  -- use 'junegunn/fzf.vim'
  use 'fatih/vim-go'
  use 'Shougo/defx.nvim'
  use 'kristijanhusak/defx-icons'
  use 'junegunn/vim-easy-align'
  use 'ibhagwan/fzf-lua'
 
  use 'kyazdani42/nvim-web-devicons'
  use 'numToStr/FTerm.nvim'
end)
