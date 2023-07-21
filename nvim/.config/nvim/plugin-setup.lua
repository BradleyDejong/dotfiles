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
    -- build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            folds = false
          }
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              work = "~/Nextcloud/notes/neorg/work",
              home = "~/Nextcloud/notes/neorg/home"
            }
          }
        },
        ["core.export"] = {}
      }
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" }
    },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      require("harpoon").setup({
      })
      require("telescope").load_extension("harpoon")

      vim.api.nvim_set_keymap("n", "<Leader>hm",  "", {
        desc = "Harpoon mark",
        noremap = true,
        callback = mark.add_file
      })

      vim.api.nvim_set_keymap("n", "<Leader>hh",  "", {
        desc = "Harpoon menu",
        noremap = true,
        callback = ui.toggle_quick_menu
      })

      vim.api.nvim_set_keymap("n", "<Leader>fm",  "<cmd>Telescope harpoon marks<CR>", {
        desc = "Fzy harpoon marks",
        noremap = true
      })

      -- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end)
      vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end)
      vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end)
    end,
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },
  'sbdchd/neoformat',
  'tpope/vim-unimpaired',
  'tpope/vim-obsession',
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
    end
  },
  'tpope/vim-dispatch',
  'elmcast/elm-vim',
  'tpope/vim-projectionist',
  'tpope/vim-vinegar',
  'radenling/vim-dispatch-neovim',
  'editorconfig/editorconfig-vim',
  'KeitaNakamura/neodark.vim',
  'ryanoasis/vim-devicons',
  'kyazdani42/nvim-web-devicons',

  {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup({ })
    end
  },
  'elianiva/telescope-npm.nvim',
  'rose-pine/neovim',
  'vim-test/vim-test',
  'raichoo/purescript-vim',
  "nvim-lua/popup.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)

      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "help", "javascript", "typescript", "c", "lua", "rust", "norg" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},

      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    },
    config = function()
      local lsp = require('lsp-zero').preset({})
      local opts = { noremap= true, silent=true }

      lsp.ensure_installed({
        "tsserver",
        "eslint",
        "vuels",
        "jdtls",
        "lua_ls"
      })

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})

        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        --vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>qf', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', opts)
      end)

      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()

      local cmp = require("cmp")
      local cmp_action = require("lsp-zero").cmp_action()
      cmp.setup({
        sources = {
          {name = 'nvim_lsp'},
          {name = 'buffer', keyword_length = 3},
          {name = 'luasnip', keyword_length = 2 }
        }
      })

      vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    end
  },
  "nvim-treesitter/playground",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope-node-modules.nvim",
  'romainl/Apprentice',
  'morhetz/gruvbox',
  'hrsh7th/cmp-buffer',
  'saadparwaiz1/cmp_luasnip',
  'onsails/lspkind.nvim',
  'Olical/conjure',
  'gpanders/nvim-parinfer'
}, opts)
