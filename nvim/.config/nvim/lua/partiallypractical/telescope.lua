require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('node_modules')

local mappings = {}

local cbff = require('telescope.builtin').current_buffer_fuzzy_find

mappings.curr_buf = function()
  local opt = { sorting_strategy = "ascending", layout_config = { prompt_position = "top"}, winblend=10  }

  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

return {
  telescope_mappings = mappings
}

