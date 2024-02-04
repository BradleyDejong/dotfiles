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
    "rebelot/kanagawa.nvim",
    config = function()
      require("partiallypractical.coloring").DoColors("kanagawa-dragon")
    end
  },
  "nvim-telescope/telescope-symbols.nvim",
  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })
    end,
    dependencies = {"stevearc/dressing.nvim"}
  },
  {
    "nvim-neorg/neorg",
    -- build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.summary"] = {},
        ["core.journal"] = {},
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode"
          }
        },
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
            folds = true
          }
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              work = "~/Nextcloud/notes/neorg/work",
              home = "~/Nextcloud/notes/neorg/home",
              learning = "~/Nextcloud/notes/neorg/learning"
            },
            default_workspace = "work"
          }
        },
        ["core.export"] = {},
        ["core.export.markdown"] = {}
      }
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "folke/zen-mode.nvim" },
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
  'renerocksai/calendar-vim',
  {
    'renerocksai/telekasten.nvim',
    config = function()
      require('telekasten').setup({
        home = vim.fn.expand("~/Nextcloud/zettelkasten"),
        templates = vim.fn.expand("~/Nextcloud/zettelkasten/templates"),
        dailies = vim.fn.expand("~/Nextcloud/zettelkasten/daily"),
        template_new_daily = vim.fn.expand("~/Nextcloud/zettelkasten/templates/daily.md"),
        tag_notation = ":tag:",
      })

      vim.keymap.set("n", "<Leader>zff", "<cmd>Telekasten find_notes<CR>")
      vim.keymap.set("n", "<Leader>zfd", "<cmd>Telekasten find_daily_notes<CR>")
      vim.keymap.set("n", "<Leader>zfg", "<cmd>Telekasten search_notes<CR>")
      vim.keymap.set("n", "<Leader>zz", "<cmd>Telekasten follow_link<CR>")
      vim.keymap.set("n", "<Leader>zft", "<cmd>Telekasten search_notes<CR>\\[ \\]", { desc = "Find todos"})
      vim.keymap.set("n", "<Leader>zgT", "<cmd>Telekasten goto_today<CR>", { desc = "Goto today"})
      vim.keymap.set("n", "<Leader>zT", "<cmd>Telekasten toggle_todo<CR>", { desc = "Toggle todo"})
    end,
    dependencies = {'nvim-telescope/telescope.nvim', 'renerocksai/calendar-vim'}
  },
  'elianiva/telescope-npm.nvim',
  'rose-pine/neovim',
  'vim-test/vim-test',
  'raichoo/purescript-vim',
  "nvim-lua/popup.nvim",
  {
      "nvim-treesitter/nvim-treesitter-textobjects",
      lazy = true,
      config = function ()
        require("nvim-treesitter.configs").setup({
          textobjects = {
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ["a="] = { query = "@assignment.outer", desc = "Outer assignment" },
                ["i="] = { query = "@assignment.inner", desc = "Inner assignment" },

                ["am"] = { query = "@function.outer", desc = "Outer function definition" },
                ["im"] = { query = "@function.inner", desc = "Inner function definition" },

                ["af"] = { query = "@call.outer", desc = "Outer function definition" },
                ["if"] = { query = "@call.inner", desc = "Inner function definition" },

                ["aa"] = { query = "@parameter.outer", desc = "Outer params" },
                ["ia"] = { query = "@parameter.inner", desc = "Inner params" },
              },
            },
            move = {
              enable = true,
              set_jumps = true,
              goto_next_start = {
                ["]f"] = { query = "@call.outer", desc = "Outer function call" },
                ["]m"] = { query = "@function.outer", desc = "Outer function definition" },
                ["]a"] = { query = "@parameter.outer", desc = "Outer parameter" },
                ["]s"] = { query = "@scope", desc = "Outer parameter" },
              },
              goto_previous_start = {
                ["[f"] = { query = "@call.outer", desc = "Outer function call" },
                ["[m"] = { query = "@function.outer", desc = "Outer function definition" },
                ["[a"] = { query = "@parameter.outer", desc = "Outer parameter" },
              },
            }
          }
        })
      end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
    -- build = ":TSUpdate",
    config = function()
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)

      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "http" },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          }
        }
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
      local on_attach = function(client, bufnr)
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
      end

      lsp.on_attach(on_attach)

      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      require('lspconfig').purescriptls.setup {
        -- on_attach = on_attach,
        settings = {
          purescript = {
            addSpagoSources = true -- e.g. any purescript language-server config here
          }
        },
        flags = {
          debounce_text_changes = 150,
        }
      }


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
  'gpanders/nvim-parinfer',
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- stay in current windows (.http file) or change to results window (default)
        stay_in_current_window_after_split = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- table of curl `--write-out` variables or false if disabled
          -- for more granular control see Statistics Spec
          show_statistics = false,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
        search_back = true,
      })
    end
  }
}, opts)
