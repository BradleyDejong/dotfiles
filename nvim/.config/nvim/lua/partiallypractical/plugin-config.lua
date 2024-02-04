
function mapN(lhs, desc, callback)
  vim.api.nvim_set_keymap('n',lhs, '', {
     desc = desc,
     noremap = true,
     callback = callback
   })
end

vim.api.nvim_set_keymap("n", "<Leader>Ts", ":TestSuite<CR>", {
  desc = "Test suite",
  noremap = true
})
vim.api.nvim_set_keymap("n", "<Leader>Tt", ":TestFile<CR>", {
  desc = "Test file",
  noremap = true
})

function mapBufN(lhs, desc, callback)
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

mapN('<Leader>fg', "Find (grep)", require('telescope.builtin').live_grep)
mapN("<Leader>fb", "Find buffer", require('telescope.builtin').buffers)
mapN("<Leader>fh", "Find help tags", require('telescope.builtin').help_tags)
-- mapN("<Leader>fnm", "Find node modules", require('telescope.builtin').help_tags)
--
--
local function setupNpm()
  mapBufN("<Leader>nn", "run npm", require("telescope._extensions.npm.npm_scripts").picker)

  vim.api.nvim_buf_set_keymap(0, "n", "<Leader>nm", "<cmd>Telescope node_modules list<CR>", {
    desc = "List npm modules",
    noremap = true
  })
end
vim.api.nvim_create_autocmd(
    { "BufEnter" },
    { pattern = { "*.js" }, callback = setupNpm }
)

local function setupGhokin()
  vim.api.nvim_buf_set_keymap(0, "n", "<Leader>pp", "<cmd>!ghokin fmt replace %<CR>", {
    desc = "Ghokin format",
    noremap = true
  })
end

vim.api.nvim_create_autocmd(
    { "BufEnter" },
    { pattern = { "*.feature" }, callback = setupGhokin }
)

