function PPSetupMochaTests()
  vim.api.nvim_buf_set_keymap(0, 'n', "<Leader>tt", '', {
    noremap = true,
    desc = "Neotest run",
    callback = function()
      require("neotest").run.run()
    end
  })

  vim.api.nvim_buf_set_keymap(0, 'n', "<Leader>tf", '', {
    noremap = true,
    desc = "Neotest run file",
    callback = function()
      require("neotest").run.run(vim.fn.expand("%"))
    end
  })
  print("Mocha key bindings set up")

  -- vim.api.nvim_buf_set_keymap(0, "n", "<Leader>nm", "<cmd>Telescope node_modules list<CR>", {
    -- desc = "List npm modules",
    -- noremap = true
  -- })
end

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-vim-test",
    "vim-test/vim-test",
    "adrigzr/neotest-mocha",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require('neotest-mocha')({
          command = "npm test --",
          command_args = function(context)
            return {
                "--full-trace",
                "--reporter=json",
                "--reporter-options=output=" .. context.results_path,
                context.path,
            }
          end,
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        })
      }
    })

    vim.api.nvim_set_keymap('n', "<Leader>to", '', {
      noremap = true,
      desc = "Neotest open summary",
      callback = function()
        require("neotest").summary.open()
      end
    })

    -- vim.api.nvim_create_autocmd(
      -- { "BufEnter" },
      -- { pattern = { "*.js" }, callback = setupMochaTests }
    -- )
  end
}
