return {
  'rose-pine/neovim',
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("partiallypractical.coloring").DoColors("kanagawa-dragon")
    end
  },
  'romainl/Apprentice',
  'morhetz/gruvbox',
}
