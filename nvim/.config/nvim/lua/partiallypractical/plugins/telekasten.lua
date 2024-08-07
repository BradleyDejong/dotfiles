return {
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
}
