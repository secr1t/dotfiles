local themes = require("themes")
local storage = require("themes.storage")

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

return function()
  pickers.new({}, {
    prompt_title = "Themes",
    finder = finders.new_table({
      results = themes.list,
    }),
    sorter = conf.generic_sorter({}),

    attach_mappings = function(prompt_bufnr, map)
      local function select()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        themes.apply(selection[1])
        storage.save(selection[1])
      end

      map("i", "<CR>", select)
      map("n", "<CR>", select)

      return true
    end,
  }):find()
end
