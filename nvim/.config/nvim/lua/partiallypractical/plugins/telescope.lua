return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local function mapN(lhs, desc, callback)
        vim.api.nvim_set_keymap('n',lhs, '', {
          desc = desc,
          noremap = true,
          callback = callback
        })
      end

      local function mapBufN(lhs, desc, callback)
        vim.api.nvim_buf_set_keymap(0, 'n',lhs, '', {
          desc = desc,
          noremap = true,
          callback = callback
        })
      end

      mapN(
      '<Leader>/',
      "Buffer fzy find",
      require('partiallypractical/telescope').telescope_mappings.curr_buf
      )

      mapN('<c-p>',"Tscpe find files", require('telescope.builtin').git_files)
      mapN('<Leader>ff',"Tscpe find files", require('telescope.builtin').find_files)

      mapN('<Leader>fg', "Find (git grep)", require('git_grep').live_grep)
      mapN("<Leader>fb", "Find buffer", require('telescope.builtin').buffers)
      mapN("<Leader>fh", "Find help tags", require('telescope.builtin').help_tags)
    end
  },
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope-node-modules.nvim",
  "nvim-telescope/telescope-symbols.nvim",
  'davvid/telescope-git-grep.nvim',
}

