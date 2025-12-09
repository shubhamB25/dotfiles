local fn = vim.fn


-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins


  -- Auto Pairs 
  use "windwp/nvim-autopairs" -- Autopairs, intergrates with cmp and lsp 

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use 'folke/tokyonight.nvim'
  -- use "lunarvim/darkplus.nvim"


  -- tpope vim dispatch 
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- markdown previwer , View readme.md
  -- Plugins can have post-install/update hooks
  use {'iamcco/markdown-preview.nvim', run = 'cd app && sudo yarn install', cmd = 'MarkdownPreview'}



  -- cmp (auto completions) plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp' 
  use "RRethy/vim-illuminate" -- Illuminate other uses of current word/symbol under cursor

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

  -- LSP 
  use 'neovim/nvim-lspconfig'  -- enable lsp
  use 'williamboman/nvim-lsp-installer' -- simple to use language server installer


  -- Telescope
  use { 'nvim-telescope/telescope.nvim',
    require = { {'nvim-lua/plenary.nvim' },
      {'nvim-telescope/telescope-media-files.nvim'},
    }
  }
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- Commentings
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use "numToStr/Comment.nvim" -- Easily comment stuff


  -- Git Signs
  use  'lewis6991/gitsigns.nvim'

  -- Nvim Tree 
  -- Nvim web -devioncs
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- use "kyazdani42/nvim-tree.lua"
  -- use "kyazdani42/nvim-web-devicons"

  -- Nvim Buffer line
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Null ls
  use "jose-elias-alvarez/null-ls.nvim"

  -- Toggle Terminal 
  use "akinsho/toggleterm.nvim"

  -- NVIM impatient
  use "lewis6991/impatient.nvim"

  -- Indent Blank Line
  use "lukas-reineke/indent-blankline.nvim"

  -- Nvim Alpha Gretter
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }


  -- Lua line 
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- One Dark Theme
  use 'navarasu/onedark.nvim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

