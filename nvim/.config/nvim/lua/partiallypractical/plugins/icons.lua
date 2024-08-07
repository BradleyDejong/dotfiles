return {
  'ryanoasis/vim-devicons',
  'kyazdani42/nvim-web-devicons',
  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })
    end,
    dependencies = {"stevearc/dressing.nvim"}
  },
}

