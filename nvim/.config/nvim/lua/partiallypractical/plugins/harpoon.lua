return {
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
}
