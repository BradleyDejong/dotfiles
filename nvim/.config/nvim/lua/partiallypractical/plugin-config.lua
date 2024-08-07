local function setupNpm()
  -- mapBufN("<Leader>nn", "run npm", require("telescope._extensions.npm.npm_scripts").picker)

  -- vim.api.nvim_buf_set_keymap(0, "n", "<Leader>nm", "<cmd>Telescope node_modules list<CR>", {
    -- desc = "List npm modules",
    -- noremap = true
  -- })
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

