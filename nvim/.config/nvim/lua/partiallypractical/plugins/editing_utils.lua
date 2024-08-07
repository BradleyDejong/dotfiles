return {
  'editorconfig/editorconfig-vim',
  'tpope/vim-unimpaired',
  'tpope/vim-projectionist',
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },
}

