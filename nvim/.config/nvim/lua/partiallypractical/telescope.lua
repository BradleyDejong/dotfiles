local mappings = {}

local cbff = require('telescope.builtin').current_buffer_fuzzy_find

mappings.curr_buf = function()
  local opt = { sorting_strategy = "ascending", layout_config = { prompt_position = "top"}, winblend=10  }

  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

return {
  telescope_mappings = mappings
}

