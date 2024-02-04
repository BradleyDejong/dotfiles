local function setupquery()
  local pane = vim.fn.input("Tmux pane id: ")
  local command = vim.fn.input("Command to run: ")

  vim.keymap.set("n", "<leader>xx", ":!tmux send -t \\%" .. pane .. " \"" .. command .. "\" ENTER<CR>")
  vim.notify("Setup temporary execute command")
end

return {
  setup = setupquery
}
