return {
  "nvim-treesitter/playground",
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
        ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "http", "dhall" },
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
}
