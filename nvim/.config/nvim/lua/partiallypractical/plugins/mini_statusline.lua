return {
  {
    "echasnovski/mini.nvim",
    config = function ()
      local sl = require 'mini.statusline'
      sl.setup { use_icons = true }
    end
  }
}
