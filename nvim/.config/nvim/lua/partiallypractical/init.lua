-- require("partiallypractical/remap")
-- require("partiallypractical/set")
require("partiallypractical/options")
require("partiallypractical/plugin-setup")
require("partiallypractical/language-client")
require("partiallypractical/telescope")
require("partiallypractical/plugin-config")
require("partiallypractical/snippets")

vim.api.nvim_set_keymap("n", "<Leader>XX",  "", {
  desc = "Setup quick keybinding",
  noremap = true,
  callback = require("partiallypractical.test-exec").setup
})
