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


require("lazy").setup({
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {
          config = {
            folds = false
          }
        },
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              work = "~/Nextcloud/notes/neorg/work",
              home = "~/Nextcloud/notes/neorg/home"
            }
          }
        }
      }
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  'sbdchd/neoformat',
  'tpope/vim-unimpaired',
  'tpope/vim-obsession',
  'tpope/vim-fugitive',
  'tpope/vim-dispatch',
  'elmcast/elm-vim',
  'tpope/vim-projectionist',
  'tpope/vim-vinegar',
  'radenling/vim-dispatch-neovim',
  'editorconfig/editorconfig-vim',
  'KeitaNakamura/neodark.vim',
  'ryanoasis/vim-devicons',
  'kyazdani42/nvim-web-devicons',
  'folke/which-key.nvim',
  'elianiva/telescope-npm.nvim',
  'rose-pine/neovim',
  'vim-test/vim-test',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'raichoo/purescript-vim',
  "nvim-lua/popup.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope-node-modules.nvim",
  'romainl/Apprentice',
  'morhetz/gruvbox',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'onsails/lspkind.nvim',
}, opts)
